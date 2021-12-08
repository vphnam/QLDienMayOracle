using QLDienMay.Code;
using QLDienMay.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLDienMay.Controllers
{
    public class KhachHangController : Controller
    {
        QLDienMayEntities db = new QLDienMayEntities();
        // GET: KhachHang
        public ActionResult DangNhap()
        {
            LoginModel login = new LoginModel();
            return View(login);
        }
        [HttpPost]
        public ActionResult DangNhap(LoginModel loginModel)
        {
            if (ModelState.IsValid)
            {
                List<KHACHHANG> lstkh2 = db.KHACHHANGs.ToList();
                string pass = Encryptor.ComputeSha256Hash(loginModel.PassWord);
                ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
                ObjectParameter return_id = new ObjectParameter("rETURN_ID", typeof(string));
                db.PROC_DANG_NHAP(loginModel.UserName, pass, 0, return_value, return_id);
                int kq = int.Parse(string.Format("{0}", return_value.Value));
                if (kq == 1)
                {
                    ViewData["LoiDN"] = "Tài khoản không tồn tại!";
                }
                else if (kq == 2)
                    ViewData["LoiDN"] = "Sai mật khẩu!";
                else if (kq == 3)
                    ViewData["LoiDN"] = "Tài khoản đã bị khóa!";
                else
                {
                    string id = return_id.Value.ToString();
                    KHACHHANG kh = db.KHACHHANGs.SingleOrDefault(n => n.MAKHACHHANG == id);
                    Session["KhachHang"] = kh;
                    return RedirectToAction("Index", "Home");
                }

            }
            return View();
        }
        public ActionResult DangKy()
        {
            ViewBag.TP = db.THANHPHOes.ToList();
            KHACHHANG kh = new KHACHHANG();
            return View(kh);
        }
        [HttpPost]
        public ActionResult DangKy(KHACHHANG khEn, string authPassWord, string maTP)
        {
            ViewBag.TP = db.THANHPHOes.ToList();
            string hoTen = khEn.TENKHACHHANG;
            string sDT = khEn.SDT;
            string diaChi = khEn.DIACHI;
            string eMail = khEn.EMAIL;
            string userName = khEn.TAIKHOAN;
            string passWord = khEn.MATKHAU;
            string tP = maTP;
            if(passWord != authPassWord)
            {
                ViewData["LoiDK"] = "Mật khẩu và xác nhận mật khẩu phải giống nhau!";
            }
            else
            {
                string pass = Encryptor.ComputeSha256Hash(passWord);
                ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
                db.PROC_DANG_KY_KHACH_HANG(hoTen,sDT,diaChi,tP,eMail,userName,pass, return_value);
                int kq = int.Parse(string.Format("{0}", return_value.Value));
                if (kq == 1)
                    ViewData["LoiDK"] = "Số điện thoại đã được đăng ký, vui lòng đổi!";
                else if (kq == 2)
                    ViewData["LoiDK"] = "Email đã được đăng ký, vui lòng đổi!";
                else if (kq == 3)
                    ViewData["LoiDK"] = "Tên tài khoản đã được đăng ký, vui lòng đổi!";
                else if(kq == 0)
                {
                    return RedirectToAction("DangNhap", "KhachHang");
                }
                else
                    ViewData["LoiDK"] = "Lỗi không xác định, chờ xíu nhập lại xem!";
            }
            return View();
        }
        public ActionResult QuenMatKhau()
        {
            return View();
        }
    }
}