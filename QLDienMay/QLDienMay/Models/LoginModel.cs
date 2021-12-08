using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QLDienMay.Models
{
    public class LoginModel
    {
        [Display(Name = "Tài khoản")]
        [StringLength(50, MinimumLength = 8, ErrorMessage = "Vui lòng nhập {0} tối đa 8-50 ký tự")]
        [Required(ErrorMessage = "Vui lòng nhập {0}")]
        public string UserName { get; set; }

        [Display(Name = "Mật khẩu")]
        [StringLength(32, MinimumLength = 8, ErrorMessage = "Vui lòng nhập {0} từ 8-32 ký tự")]
        [Required(ErrorMessage = "Vui lòng nhập {0}")]
        public string PassWord { get; set; }
    }
}