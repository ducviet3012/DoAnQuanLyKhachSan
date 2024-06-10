using Microsoft.AspNetCore.Mvc;
using QLKhachSan.Models;
using QLKhachSan.ViewModels;
using QLKhachSan.Helpers;
using Microsoft.AspNetCore.Authorization;
using System.Net.Mail;
using System.Net;
using QLKhachSan.Services;
using Newtonsoft.Json;
using System.Globalization;
using Microsoft.AspNetCore.SignalR;
using QLKhachSan.SignalRChat;
using System;

namespace QLKhachSan.Controllers
{
    public class RoomController : Controller
    {
        private readonly ILogger<RoomController> _logger;
        private readonly QLKhachSanTTTNContext db;
        private readonly IVnPayService _vnPayService;
        private readonly IHubContext<ChatHub> _hubContext;
        public RoomController(ILogger<RoomController> logger, QLKhachSanTTTNContext context, IVnPayService vnPayService, IHubContext<ChatHub> hubContext)
        {
            _logger = logger;
            db = context;
            _vnPayService = vnPayService;
            _hubContext = hubContext;
        }
        public List<BookingVM> Cart => HttpContext.Session.Get<List<BookingVM>>("Cart") ?? new List<BookingVM>();
		#region Đặt phòng
		//[Authorize]
		public IActionResult Booking(BookingVM model)
        {
            var email = HttpContext.Session.GetString("email");
            if (email != null)
            {
                var khachhhang = (from kh in db.KhachHangs
                                  where kh.Email == email
                                  select kh).FirstOrDefault();
                ViewBag.email = khachhhang.Email;
                ViewBag.diachi = khachhhang.DiaChi;
                ViewBag.sdt = khachhhang.Sdt;
            }
            var gia = (from lp in db.LoaiPhongs
                       join p in db.Phongs on lp.MaLp equals p.MaLp
                       where p.MaPhong == model.maphong
                       select lp.Gia).FirstOrDefault();
            TimeSpan soNgay = model.ngaydi - model.ngayden;
            int soNgayTrongKhoang = (soNgay.Days + 1);
            model.thanhtien = (double)gia * soNgayTrongKhoang;
            model.tenphong = HttpContext.Session.GetString("tenphong");
            HttpContext.Session.SetBool("SentMail", false);
            return View(model);
        }
		#endregion

		#region Lưu phòng được đặt vào db
		public void SaveBookingInfoToDatabase(int customerID, BookingVM model, int roomID, string payment)
        {
            var khachhang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == customerID);
            var khachhang1 = db.KhachHangs.SingleOrDefault(kh => kh.Email == model.Email);

            if (khachhang != null)
            {
                var hoadon = new HoaDon
                {
                    MaKh = customerID,
                    NgayThanhToan = DateTime.Now,
                    TenKh = model.GiongKhachHang ? khachhang.TenKh : model.HoTen,
                    Email = model.GiongKhachHang ? khachhang.Email : model.Email,
                    Sdt = model.GiongKhachHang ? khachhang.Sdt : model.DienThoai,
                    TinhTrang = payment == "Thanh toán VNPay" ? "Đã thanh toán" : "Đã đặt cọc"

                };
                db.Add(hoadon);
                db.SaveChanges();
                var datphong = new DatPhong
                {
                    SoHoaDon = hoadon.SoHoaDon,
                    MaPhong = roomID,
                    NgayDen = model.ngayden,
                    NgayDi = model.ngaydi,
                    SoNguoi = model.songuoitoida,
                    IsDelete = 0
                };
                db.Add(datphong);
                db.SaveChanges();
            }
            else
            {
                var hoadon = new HoaDon
                {
                    MaKh = null,
                    NgayThanhToan = DateTime.Now,
                    TenKh = model.GiongKhachHang ? khachhang.TenKh : model.HoTen,
                    Email = model.GiongKhachHang ? khachhang.Email : model.Email,
                    Sdt = model.GiongKhachHang ? khachhang.Sdt : model.DienThoai,
                    TinhTrang = payment == "Thanh toán VNPay" ? "Đã thanh toán" : "Đã đặt cọc"

                };
                db.Add(hoadon);
                db.SaveChanges();
                var datphong = new DatPhong
                {
                    SoHoaDon = hoadon.SoHoaDon,
                    MaPhong = roomID,
                    NgayDen = model.ngayden,
                    NgayDi = model.ngaydi,
                    SoNguoi = model.songuoitoida,
                    IsDelete = 0
                };
                db.Add(datphong);
                db.SaveChanges();
            }
        }
		#endregion

		#region Gửi email thông tin đã đặt phòng cho khách hàng
		private void SendConfirmationEmail(BookingVM bookingModel, string customerEmail, string paymentMethod)
        {
            string subject;
            string paymentInfo;

            // Tạo nội dung email
            var tenks = (from ks in db.KhachSans
                         join lp in db.LoaiPhongs on ks.MaKs equals lp.MaKs
                         join p in db.Phongs on lp.MaLp equals p.MaLp
                         where p.MaPhong == bookingModel.maphong
                         select ks.TenKhachSan).FirstOrDefault();
            var diachi = (from ks in db.KhachSans
                          join lp in db.LoaiPhongs on ks.MaKs equals lp.MaKs
                          join p in db.Phongs on lp.MaLp equals p.MaLp
                          where p.MaPhong == bookingModel.maphong
                          select ks.DiaChi).FirstOrDefault();

            var strSanPham = $@"
        <table style='border-collapse: collapse; width: 100%;'>
            <thead>
                <tr style='background-color: #f2f2f2;'>
                    <th style='border: 1px solid #ddd; padding: 8px;'>Tên khách sạn</th>
                    <th style='border: 1px solid #ddd; padding: 8px;'>Tên phòng</th>
                    <th style='border: 1px solid #ddd; padding: 8px;'>Ngày đến</th>
                    <th style='border: 1px solid #ddd; padding: 8px;'>Ngày đi</th>
                    <th style='border: 1px solid #ddd; padding: 8px;'>Số người</th>
                    <th style='border: 1px solid #ddd; padding: 8px;'>Địa chỉ</th>";
            if (paymentMethod == "Đặt cọc phòng(40%)")
            {
                strSanPham += "<th style='border: 1px solid #ddd; padding: 8px;'>Tiền cọc</th><th style='border: 1px solid #ddd; padding: 8px;'>Cần thanh toán</th>";
            }
            else
            {
                strSanPham += "<th style='border: 1px solid #ddd; padding: 8px;'>Tổng tiền</th>";
            }
            strSanPham += @"
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style='border: 1px solid #ddd; padding: 8px;'>" + tenks + @"</td>
                    <td style='border: 1px solid #ddd; padding: 8px;'>" + bookingModel.tenphong + @"</td>
                    <td style='border: 1px solid #ddd; padding: 8px;'>" + bookingModel.ngayden + @"</td>
                    <td style='border: 1px solid #ddd; padding: 8px;'>" + bookingModel.ngaydi + @"</td>
                    <td style='border: 1px solid #ddd; padding: 8px;'>" + bookingModel.songuoitoida + @"</td>
                    <td style='border: 1px solid #ddd; padding: 8px;'>" + diachi + @"</td>";
            if (paymentMethod == "Đặt cọc phòng(40%)")
            {
                strSanPham += "<td style='border: 1px solid #ddd; padding: 8px;'>" + (bookingModel.thanhtien * 40 / 100) + @"</td>
                       <td style='border: 1px solid #ddd; padding: 8px;'>" + (bookingModel.thanhtien * 60 / 100) + @"</td>";
            }
            else
            {
                strSanPham += "<td style='border: 1px solid #ddd; padding: 8px;'>" + bookingModel.thanhtien + @"</td>";
            }
            strSanPham += @"
                </tr>
            </tbody>
        </table>";

            var strThongTinKhachHang = $@"
        <p>Họ tên khách hàng: <strong>{bookingModel.HoTen}</strong></p>
        <p>Email: <strong>{bookingModel.Email}</strong></p>
        <p>Số điện thoại: <strong>{bookingModel.DienThoai}</strong></p>";

            var fullContent = $@"
        <div style='font-family: Arial, sans-serif;'>
            <h2 style='color: #333;'>Thông tin đặt phòng</h2>
            {strSanPham}
            <h2 style='color: #333;'>Thông tin khách hàng</h2>
            {strThongTinKhachHang}
        </div>";

            // Xác định tiêu đề và thông tin thanh toán dựa trên phương thức thanh toán
            if (paymentMethod == "Đặt cọc phòng(40%)")
            {
                subject = "Xác nhận đặt cọc phòng thành công";
                paymentInfo = "Bạn đã đặt cọc phòng thành công.";
            }
            else
            {
                subject = "Phòng bạn được đặt thành công";
                paymentInfo = "Cảm ơn bạn đã đặt phòng.";
            }

            // Gửi email
            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential("doducviet3012@gmail.com", "ebfwregutahnwhrj"),
                EnableSsl = true,
            };
            var fromAddress = new MailAddress("doducviet3012@gmail.com", "Hotel");
            var toAddress = new MailAddress(customerEmail ?? bookingModel.Email);
            var mailMessage = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = $"{fullContent}<p style='font-family: Arial, sans-serif;'>{paymentInfo}</p>",
                IsBodyHtml = true
            };

            smtpClient.Send(mailMessage);
        }
		#endregion

		#region Xác nhận đã đăth phòng thành công
		[HttpPost]
        public IActionResult ConfirmBooking(int maphong, BookingVM model, string payment = "COD")
        {
            if (ModelState.IsValid)
            {
                var email = HttpContext.Session.GetString("email");
                var customerID = (from kh in db.KhachHangs
                                  where kh.Email == email
                                  select kh.MaKh).FirstOrDefault();
                var khachhang = new KhachHang();
                string ht;
                string emailKH;
                string dienthoai;
                string adressEmail;
                HttpContext.Session.SetString("CustomerID", customerID.ToString());
                HttpContext.Session.SetString("RoomID", maphong.ToString());
                HttpContext.Session.SetString("PaymentMethod", payment);
                HttpContext.Session.SetString("BookingModel", JsonConvert.SerializeObject(model));
                if (model.GiongKhachHang)
                {
                    khachhang = db.KhachHangs.SingleOrDefault(p => p.MaKh == customerID);
                    model.HoTen = khachhang.TenKh;
                    model.DienThoai = khachhang.Sdt;
                    model.Email = email;
                    ht = khachhang.TenKh;
                    emailKH = khachhang.Email;
                    dienthoai = khachhang.Sdt;
                    adressEmail = khachhang.Email;
                }
                else
                {
                    ht = model.HoTen;
                    emailKH = model.Email;
                    dienthoai = model.DienThoai;
                    adressEmail = model.Email;
                }
                if (payment == "Thanh toán VNPay")
                {
                    var vnPayModel = new VnPaymentRequestModel
                    {
                        Amount = model.thanhtien,
                        CreateDate = DateTime.Now,
                        Desscription = $"{model.HoTen}{model.DienThoai}",
                        FullName = model.HoTen,
                        OrderId = new Random().Next(1000, 10000)
                    };
                    return Redirect(_vnPayService.CreatePaymentUrl(HttpContext, vnPayModel));
                }
                else if (payment == "Đặt cọc phòng(40%)")
                {
                    var vnPayDepositModel = new VnPaymentRequestModel
                    {
                        Amount = model.thanhtien * 40 / 100,
                        CreateDate = DateTime.Now,
                        Desscription = $"{model.HoTen} {model.DienThoai} - Đặt cọc",
                        FullName = model.HoTen,
                        OrderId = new Random().Next(1000, 10000)
                    };
                    // Chuyển hướng đến VNPay để thanh toán đặt cọc
                    return Redirect(_vnPayService.CreatePaymentUrl(HttpContext, vnPayDepositModel));
                }
                else
                {
                    SendConfirmationEmail(model, email, payment);
                }
                SaveBookingInfoToDatabase(customerID, model, maphong, payment);
                return View(model);
            }

            return View(model);
        }

        [Authorize]
        public IActionResult PaymentFail()
        {
            return View();
        }
        public IActionResult Success()
        {
            return View();
        }
        //[Authorize]
        public IActionResult PaymentCallBack()
        {
            var response = _vnPayService.PaymentExecute(Request.Query);
            if (response == null || response.VnPayResponseCode != "00")
            {
                TempData["Message"] = $"Lỗi thanh toán VNPay:{response.VnPayResponseCode}";
                return Redirect("/");
            }
            var customerID = int.Parse(HttpContext.Session.GetString("CustomerID"));
            var roomID = int.Parse(HttpContext.Session.GetString("RoomID"));
            var paymentMethod = HttpContext.Session.GetString("PaymentMethod");
            var bookingModel = JsonConvert.DeserializeObject<BookingVM>(HttpContext.Session.GetString("BookingModel"));
            var email = HttpContext.Session.GetString("email");
            if (bookingModel.GiongKhachHang)
            {
                var khachhang = db.KhachHangs.SingleOrDefault(p => p.MaKh == customerID);
                bookingModel.HoTen = khachhang.TenKh;
                bookingModel.DienThoai = khachhang.Sdt;
                bookingModel.Email = email;
            }
            bool sentmail = HttpContext.Session.GetBool("SentMail") ?? false;
            if (!sentmail)
            {
                SaveBookingInfoToDatabase(customerID, bookingModel, roomID, paymentMethod);
                SendConfirmationEmail(bookingModel, email, paymentMethod);
                HttpContext.Session.SetBool("SentMail", true);
            }
            return View("ConfirmBooking", bookingModel);
        }
		#endregion
	}
}
