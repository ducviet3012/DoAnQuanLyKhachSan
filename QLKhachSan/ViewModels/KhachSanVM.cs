using System.ComponentModel.DataAnnotations;
namespace QLKhachSan.ViewModels
{
    public class KhachSanVM
    {
        public int MaKS {  get; set; }
        public int? MaTinh {  get; set; }
        [Required(ErrorMessage = "Vui lòng chọn tên tỉnh.")]
        public string? TenTinh {  set; get; }
        [Required(ErrorMessage = "Vui lòng chọn tên huyện.")]
        public string TenHuyen { get; set; }
        [Required(ErrorMessage = "Vui lòng chọn tên xã.")]
        public string TenXa { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên khách sạn.")]
        public string? TenKS {  get; set; }
        public string? Anh {  get; set; }
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ cụ thể.")]
        public string? DiaChi {  get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mô tả.")]
        public string? Mota {  get; set; }
        public int? Duyet {  get; set; }
        [Required(ErrorMessage = "Vui lòng chọn số sao .")]
        public int? DanhGia { get; set; }
    }
}
