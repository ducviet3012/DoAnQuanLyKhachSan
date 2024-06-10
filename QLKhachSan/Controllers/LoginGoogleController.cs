using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLKhachSan.Models;
using System.Security.Claims;

namespace QLKhachSan.Controllers
{
    public class LoginGoogleController : Controller
    {
        private readonly QLKhachSanTTTNContext db;

        public LoginGoogleController(QLKhachSanTTTNContext context)
        {
            db = context;
        }
        public async Task Login()
        {
            await HttpContext.ChallengeAsync(GoogleDefaults.AuthenticationScheme,
                new AuthenticationProperties
                {
                    RedirectUri = Url.Action("GoogleResponse")
                });
        }
        public async Task<IActionResult> GoogleResponse()
        {
            var result = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            var email = result.Principal.FindFirst(ClaimTypes.Email)?.Value;

            if (!string.IsNullOrEmpty(email))
            {
                HttpContext.Session.SetString("email", email);
                var khachhang = await db.KhachHangs.FirstOrDefaultAsync(u => u.Email == email);
                // Tìm hoặc tạo một bản ghi cho người dùng với email này trong cơ sở dữ liệu

                if (khachhang == null)
                {
                    // Nếu người dùng chưa tồn tại trong cơ sở dữ liệu, tạo một bản ghi mới
                    var newUser = new KhachHang
                    {
                        Email = email,
                        UserId = 0,
                        HieuLuc = 0
                    };
                    db.KhachHangs.Add(newUser);
                    await db.SaveChangesAsync();
                    var customerId = (from kh in db.KhachHangs
                                      where kh.Email == email
                                      select kh.MaKh).FirstOrDefault();
                    var claim = new List<Claim>
    {
                        new Claim(ClaimTypes.Email, email),
                        new Claim(ClaimTypes.Name, khachhang.TenKh),
                        new Claim("CustomerID", khachhang.MaKh.ToString()),
                        new Claim(ClaimTypes.Role,"Customer"),
                        new Claim("UserId", khachhang.UserId.ToString())
        // Thêm các claim khác nếu cần
    };
                    var identity = new ClaimsIdentity(claim, CookieAuthenticationDefaults.AuthenticationScheme);
                    var principal = new ClaimsPrincipal(identity);
                    var authProperties = new AuthenticationProperties
                    {
                        // Lưu session nếu cần thiết
                        IsPersistent = true
                    };

                    // Đăng nhập người dùng với danh sách Claims mới
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
                    var claims = result.Principal.Identities.FirstOrDefault().Claims.Select(claims => new
                    {
                        claims.Issuer,
                        claims.OriginalIssuer,
                        claims.Type,
                        claims.Value
                    });
                    return Redirect("/");
                }
                else
                {
                    var customerId = (from kh in db.KhachHangs
                                      where kh.Email == email
                                      select kh.MaKh).FirstOrDefault();
                    var claim = new List<Claim>
    {
                        new Claim(ClaimTypes.Email, email),
                        new Claim(ClaimTypes.Name, khachhang.TenKh),
                        new Claim("CustomerID", khachhang.MaKh.ToString()),
                        new Claim(ClaimTypes.Role,"Customer"),
                        new Claim("UserId", khachhang.UserId.ToString())
    };
                    var identity = new ClaimsIdentity(claim, CookieAuthenticationDefaults.AuthenticationScheme);
                    var principal = new ClaimsPrincipal(identity);
                    var authProperties = new AuthenticationProperties
                    {
                        // Lưu session nếu cần thiết
                        IsPersistent = true
                    };

                    // Đăng nhập người dùng với danh sách Claims mới
                    HttpContext.Session.SetString("idKH", khachhang.UserId.ToString());
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
                    return Redirect("/");
                }
            }
            return Redirect("/");

        }
    }
}
