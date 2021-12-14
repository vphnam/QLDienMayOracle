using QLDienMay.Code;
using QLDienMay.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace QLDienMay.Controllers
{
    public class KhachHangController : Controller
    {
        QLDienMayEntities db = new QLDienMayEntities();

        // GET: KhachHang
        public ActionResult DangNhap()
        {
            if(Session["KhachHang"] == null)
            {
                LoginModel login = new LoginModel();
                return View(login);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
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
                else if (kq == -1)
                    ViewData["LoiDN"] = "Lỗi không xác định!";
                else
                {
                    string id = return_id.Value.ToString();
                    List<KHACHHANG> lstKh = db.KHACHHANGs.ToList();
                    KHACHHANG kh = lstKh.SingleOrDefault(n => n.MAKHACHHANG == id.Trim());
                    Session["KhachHang"] = kh;
                    return RedirectToAction("Index", "Home");
                }

            }
            return View();
        }
        public ActionResult DangXuat()
        {
            if(Session["KhachHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                Session["KhachHang"] = null;
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult DangKy()
        {
            if (Session["KhachHang"] == null)
            {
                ViewBag.TP = db.THANHPHOes.ToList();
                KHACHHANG kh = new KHACHHANG();
                return View(kh);
            }
            else
                return RedirectToAction("Index", "Home");
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
        public ActionResult ThongTin()
        {
            if (Session["KhachHang"] == null)
            {
                return RedirectToAction("DangNhap");
            }
            else
            {
                if(Session["Message"] != null)
                {
                    ViewBag.Message = (string)Session["Message"];
                    Session["Message"] = null;
                }
                KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
                return View(kh);
            } 
        }
        public ActionResult CapNhat()
        {
            if (Session["KhachHang"] == null)
            {
                return RedirectToAction("DangNhap");
            }
            else
            {
                KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
                ViewBag.TP = db.THANHPHOes.ToList();
                return View(kh);
            }
        }
        
        [HttpPost]
        public ActionResult CapNhat(KHACHHANG khEn, string maTP)
        {
            ViewBag.TP = db.THANHPHOes.ToList();
            KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
            ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
            db.PROC_UPDATE_KHACH_HANG(kh.MAKHACHHANG, khEn.TENKHACHHANG, khEn.SDT, khEn.DIACHI, maTP, khEn.EMAIL, return_value);
            int kq = int.Parse(string.Format("{0}", return_value.Value));
            if (kq == 1)
                ViewData["LoiCN"] = "Số điện thoại đã được đăng ký, vui lòng đổi!";
            else if (kq == 2)
                ViewData["LoiCN"] = "Email đã được đăng ký, vui lòng đổi!";
            else if (kq == 0)
            {
                kh = db.KHACHHANGs.Find(kh.MAKHACHHANG);
                Session["KhachHang"] = kh;
                return RedirectToAction("ThongTin", "KhachHang");
            }
            else
                ViewData["LoiCN"] = "Lỗi không xác định, chờ xíu nhập lại xem!";
            return View();
        }
        public ActionResult GuiPhanHoi()
        {
            if(Session["KhachHang"] == null)
            {
                return RedirectToAction("DangNhap","KhachHang");
            }
            else
            {
                PHANHOI ph = new PHANHOI();
                return View(ph);
            }   
        }
        [HttpPost]
        public ActionResult GuiPhanHoi(PHANHOI phEn)
        {

            KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
            ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
            db.PROC_GUI_PHAN_HOI(kh.MAKHACHHANG, phEn.NOIDUNG, return_value);
            int kq = int.Parse(string.Format("{0}", return_value.Value));
            if (kq == 1)
                ViewData["LoiGuiPH"] = "Bạn đã gửi phản hồi quá 5 lần, vui lòng đợi xử lý!";
            else if (kq == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            else
                ViewData["LoiGuiPH"] = "Lỗi không xác định, vui lòng thử lại sau!";
            return View();
        }
        public ActionResult Home_DoiMatKhau()
        {
            if (Session["KhachHang"] == null)
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }
            else
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult Home_DoiMatKhau(KHACHHANG khEn, string oldPassWord, string authPassWord)
        {
            string newPass = khEn.MATKHAU;
            KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
            oldPassWord = Encryptor.ComputeSha256Hash(oldPassWord);
            if (oldPassWord == kh.MATKHAU.Trim())
            {
                if(newPass == authPassWord)
                {
                    string pass = Encryptor.ComputeSha256Hash(newPass);
                    ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
                    db.PROC_DOI_MAT_KHAU(kh.EMAIL, 0, pass, return_value);
                    int kq = int.Parse(string.Format("{0}", return_value.Value));
                    if (kq == 0)
                    {
                        Session["Message"] = "Đổi mật khẩu thành công!";
                        kh.MATKHAU = pass;
                        Session["KhachHang"] = kh;
                        return RedirectToAction("ThongTin");
                    }
                    else 
                    {
                        ViewData["LoiHome_DoiMK"] = "Xảy ra lỗi không xác định, vui lòng thử lại";
                    }
                }
                else
                {
                    ViewData["LoiHome_DoiMK"] = "Mật khẩu mới và xác thực mật khẩu không giống nhau";
                }

            }
            else
            {
                ViewData["LoiHome_DoiMK"] = "Mật khẩu cũ không đúng";
            }
            return View();
        }

        public ActionResult QuenMatKhau()
        {
            return View(); 
        }
        [HttpPost]
        public ActionResult QuenMatKhau(string email)
        {
            ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
            db.PROC_KIEM_TRA_EMAIL_KHACH_HANG(email, return_value);
            int kq = int.Parse(string.Format("{0}", return_value.Value));
            if (kq == 0)
            {
                Session["Email"] = email;
                return RedirectToAction("GuiMailMaBM", new { Email = email });
            } 
            else if (kq == 1)
            {
                ViewData["LoiQMK"] = "Email chưa được đăng ký, vui lòng kiểm tra!";
            }
            return View();


        }
        public ActionResult DoiMatKhau()
        {
            string email = (string)Session["Email"];
            if (email == null)
                return RedirectToAction("QuenMatKhau");
            else
                return View();
        }
        [HttpPost]
        public ActionResult DoiMatKhau(FormCollection fC)
        {
            string mk = (string)fC["passWord"];
            string cfmk = (string)fC["authPassWord"];
            string inputmaBaoMat = (string)fC["maBaoMat"];
            string maBaoMat = (string)Session["MaBaoMat"];



            if (mk != cfmk)
            {
                ViewData["LoiDoiMK"] = "Mật khẩu và xác nhận mật khẩu không giống nhau";
            }
            else if (maBaoMat != inputmaBaoMat)
            {
                ViewData["LoiDoiMK"] = "Mã bảo mật không chính xác";
            }
            else
            {
                string email = (string)Session["Email"];
                string pass = Encryptor.ComputeSha256Hash(mk);
                ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
                db.PROC_DOI_MAT_KHAU(email, 0, pass, return_value);
                int kq = int.Parse(string.Format("{0}", return_value.Value));
                if (kq == 0)
                {
                    return RedirectToAction("DoiMkXong");
                }
                else if (kq == 1)
                {
                    ViewData["LoiDoiMK"] = "Có lỗi không xác định xảy ra, vui lòng thử lại sau!";
                }
            }
            return View();
        }
        public ActionResult DoiMKXong()
        {
            string email = (string)Session["Email"];
            if (email == null)
                return RedirectToAction("DangNhap");
            else
            {
                Session["Email"] = null;
                Session["MaBaoMat"] = null;
                return View();
            }       
        }

        public ActionResult GuiMailMaBM(string Email)
        {
            if (Session["Email"] == null)
            {
                string baomat = CreatePassword(6);
                Session["MaBaoMat"] = baomat;
                BuildEmailTemplateForPassword(Email,baomat);
                return RedirectToAction("DoiMatKhau");
            }
            else
            {
                Email = (string)Session["Email"];
                string baomat = CreatePassword(6);
                Session["MaBaoMat"] = baomat;
                BuildEmailTemplateForPassword(Email,baomat);
                return RedirectToAction("DoiMatKhau");
            }
        }

        public void BuildEmailTemplateForPassword(string Email, string ranPass)
        {
            string body = System.IO.File.ReadAllText(HostingEnvironment.MapPath("~/Assets/template/") + "MailMaBaoMat" + ".cshtml");
            body = body.Replace("@ViewBag.MaBaoMat", ranPass);
            body = body.ToString();
            GuiEmail("Thông báo về mã bảo mật", body,Email);
        }
        public void GuiEmail(string subjectText, string bodyText, string sendTo)
        {
            string from, to, bcc, cc, subject, body;
            from = "hoainam11134@gmail.com";
            to = sendTo.Trim();
            bcc = "";
            cc = "";
            subject = subjectText;
            StringBuilder sb = new StringBuilder();
            sb.Append(bodyText);
            body = sb.ToString();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(from);
            mail.To.Add(new MailAddress(to));
            if (!string.IsNullOrEmpty(bcc))
            {
                mail.Bcc.Add(new MailAddress(bcc));
            }
            if (!string.IsNullOrEmpty(cc))
            {
                mail.CC.Add(new MailAddress(cc));
            }
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            SendMail(mail);
        }

        public static void SendMail(MailMessage mail)
        {
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential("hoainam11134@gmail.com", "hoainam0977529557asd161120");
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }
    }
}