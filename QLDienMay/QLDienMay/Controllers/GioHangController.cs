using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLDienMay.Models;
using QLHTFastFood.NganLuongAPI;

namespace QLDienMay.Controllers
{
    public class GioHangController : Controller
    {
        QLDienMayEntities db = new QLDienMayEntities();
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["GioHang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(string maSanPham, int soLuong, string strURL)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.Find(n => n.maSp == maSanPham.Trim());

            if (sanpham == null)
            {
                sanpham = new GioHang(maSanPham.Trim(), soLuong);
                lstGiohang.Add(sanpham);
                int x = lstGiohang.Sum(n => n.soLuong);
                Session["GioHang"] = lstGiohang;
                Session["SoLuong"] = x;
                Session["Message"] = "Them vao gio hang thanh cong";
                return Redirect(strURL);
            }
            else
            {
                sanpham.soLuong = sanpham.soLuong + soLuong;
                int x = lstGiohang.Sum(n => n.soLuong);
                Session["GioHang"] = lstGiohang;
                Session["SoLuong"] = x;
                Session["Message"] = "Them vao gio hang thanh cong";
                return Redirect(strURL);
            }
        }
        private int TongSoLuong()
        {
            int TongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                TongSoLuong = lstGioHang.Sum(n => n.soLuong);
            }
            return TongSoLuong;
        }
        private decimal TongTien()
        {
            decimal tongTien = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tongTien = lstGiohang.Sum(n => n.thanhTien);
            }
            return tongTien;
        }
        private decimal TongTienKM(string voucher)
        {
            VOUCHER vc = db.VOUCHERs.SingleOrDefault(n => n.MAVOUCHER == voucher.Trim());
            decimal tongTien = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tongTien = lstGiohang.Sum(n => n.thanhTien);
                tongTien = tongTien - (tongTien * vc.PHANTRAMKHUYENMAI);
            }
            return tongTien;
        }
        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("GioHangTrong");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGiohang);
        }
        public ActionResult GioHangTrong()
        {
            return View();
        }
        public ActionResult XoaSpTrongGio(string maSanPham)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.maSp == maSanPham);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.maSp == maSanPham);
                int sl = lstGiohang.Sum(n => n.soLuong);
                Session["SoLuong"] = sl;
                Session["GioHang"] = lstGiohang;
                Session["Message"] = "Xoa san pham trong gio hang thanh cong";
                return RedirectToAction("GioHang");
            }
            if (lstGiohang.Count == 0)
                return RedirectToAction("Index", "Home");
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaGioHang()
        {
            List<GioHang> lstGioHang = Laygiohang();
            lstGioHang.Clear();
            Session["SoLuong"] = 0;
            Session["GioHang"] = lstGioHang;
            Session["Message"] = "Xoa gio hang thanh cong";
            return RedirectToAction("GioHang");
        }

        public ActionResult CapNhatGioHang(string maSanPham, int soLuongCapNhat)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.maSp == maSanPham);
            if (sanpham == null)
            {
                sanpham = new GioHang(maSanPham, soLuongCapNhat);
                lstGiohang.Add(sanpham);
                int x = lstGiohang.Sum(n => n.soLuong);
                Session["SoLuong"] = x;
                Session["GioHang"] = lstGiohang;
                Session["Message"] = "Cap nhat san pham trong gio hang thanh cong";
            }
            else
            {
                sanpham.soLuong = soLuongCapNhat;
                int x = lstGiohang.Sum(n => n.soLuong);
                Session["SoLuong"] = x;
                Session["GioHang"] = lstGiohang;
                Session["Message"] = "Cap nhat san pham trong gio hang thanh cong";
            }
            return RedirectToAction("Giohang");
        }
        public ActionResult ApDungVoucher(string voucher)
        {
            if (voucher != null)
            {
                VOUCHER vc = db.VOUCHERs.SingleOrDefault(n => n.MAVOUCHER == voucher.Trim());
                if (vc == null)
                {
                    Session["Message"] = "Voucher khong hop le";
                    return RedirectToAction("DatHang");
                }
                else
                {
                    DateTime today = DateTime.Now;
                    DateTime ngayBd = vc.NGAYBATDAU;
                    DateTime ngayKt = vc.NGAYKETTHUC;
                    if (today <= ngayBd && today >= ngayKt)
                    {
                        Session["Message"] = "Voucher da qua han hoac chua the dung";
                    }
                    else
                    {
                        Session["Voucher"] = vc;
                        Session["Message"] = "Ap dung voucher thanh cong";
                    }
                }
            }
            else
            {
                Session["Message"] = "Voucher khong hop le";
            }
            return RedirectToAction("DatHang");
        }
        public ActionResult DatHang()
        {
            if (Session["KhachHang"] == null)
                return RedirectToAction("DangNhap", "KhachHang");
            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.TongSoLuong = TongSoLuong();

            decimal tongTien = TongTien();
            ViewBag.TongTien = tongTien;
            if (Session["Voucher"] != null)
            {
                VOUCHER vc = Session["Voucher"] as VOUCHER;
                decimal tongHoaDon = TongTienKM(vc.MAVOUCHER);
                ViewBag.TongHoaDon = tongHoaDon;
                ViewBag.TienKM = tongTien - tongHoaDon;
                Session["TongDonHang"] = tongHoaDon;
            }
            else
            {
                Session["TongDonHang"] = tongTien;
            }

            KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
            ViewData["KhachHang"] = kh;

            List<CUAHANG> cuaHangs = db.CUAHANGs.Where(n => n.THANHPHO == kh.THANHPHO1.MATHANHPHO).ToList();
            ViewData["CuaHang"] = cuaHangs;

            return View(lstGiohang);
        }

        [HttpPost]
        public ActionResult DatHang(string cuaHang, string paymentMethod, string bankcode)
        {
            KHACHHANG kh = Session["KhachHang"] as KHACHHANG;
            List<GioHang> gh = Laygiohang();

            if (cuaHang == null)
            {
                ViewData["LoiDH_CH"] = "Vui lòng chọn cửa hàng!";
            }
            else if (paymentMethod == null)
            {
                ViewData["LoiDH_Payment"] = "Vui lòng chọn phương thức thanh toán!";
            }
            else
            {
                if (paymentMethod == "CASH")
                {


                        string maVc;
                        if (Session["Voucher"] != null)
                        {
                            VOUCHER vc = Session["Voucher"] as VOUCHER;
                            maVc = vc.MAVOUCHER;
                        }
                        else
                            maVc = null;
                        decimal tongDon = (decimal)Session["TongDonHang"];
                        ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
                        ObjectParameter return_madh = new ObjectParameter("mA_DON", typeof(string));
                        db.PROC_TAO_DON_HANG(kh.MAKHACHHANG, cuaHang, maVc, tongDon, return_madh, return_value);
                        int kq = int.Parse(string.Format("{0}", return_value.Value));
                        if (kq == 1)
                        {
                            Session["Message"] = "Loi input";
                        }
                        else if (kq == 2)
                            ViewData["LoiDH_Voucher"] = "Lỗi voucher, vui lòng thử áp dụng lại hoặc dùng voucher khác";
                        else if (kq == 3)
                            ViewData["LoiDH_KH"] = "Không xác định được thông tin khách hàng, vui lòng đăng nhập lại";
                        else if (kq == -1)
                            Session["Message"] = "Loi khong xac dinh";
                        else
                        {
                            string maDh = return_madh.Value.ToString().Trim();
                            foreach (GioHang item in gh)
                            {
                                ObjectParameter return_value2 = new ObjectParameter("rETURN_VALUE", typeof(int));
                                db.PROC_THEM_CHI_TIET_DON_HANG(maDh, item.maSp, item.soLuong, item.donGia, item.thanhTien, return_value2);
                                int kq2 = int.Parse(string.Format("{0}", return_value2.Value));
                                if (kq2 == -1)
                                {
                                    Session["Message"] = "Loi khong xac dinh, vui long lien he tong dai de duoc ho tro";
                                    return View();
                                }    
                            }
                            Session["Message"] = "Dat hang thanh cong";
                            return RedirectToAction("DatHangThanhCong");
                        }
                    
                }
                else
                {
                    try
                    {
                        string maVc;
                        if (Session["Voucher"] != null)
                        {
                            VOUCHER vc = Session["Voucher"] as VOUCHER;
                            maVc = vc.MAVOUCHER;
                        }
                        else
                            maVc = null;
                        decimal tongDon = (decimal)Session["TongDonHang"];
                        ObjectParameter return_value = new ObjectParameter("rETURN_VALUE", typeof(int));
                        ObjectParameter return_madh = new ObjectParameter("rETURN_ID", typeof(string));
                        db.PROC_TAO_DON_HANG(kh.MAKHACHHANG, cuaHang, maVc, tongDon, return_value, return_madh);
                        int kq = int.Parse(string.Format("{0}", return_value.Value));
                        if (kq == 1)
                        {
                            Session["Message"] = "Loi input";
                        }
                        else if (kq == 2)
                            ViewData["LoiDH_Voucher"] = "Lỗi voucher, vui lòng thử áp dụng lại hoặc dùng voucher khác";
                        else if (kq == 3)
                            ViewData["LoiDH_KH"] = "Không xác định được thông tin khách hàng, vui lòng đăng nhập lại";
                        else if (kq == -1)
                            Session["Message"] = "Loi khong xac dinh";
                        else
                        {
                            string maDh = return_madh.Value.ToString();
                            foreach (GioHang item in gh)
                            {
                                ObjectParameter return_value3 = new ObjectParameter("rETURN_VALUE", typeof(int));
                                db.PROC_THEM_CHI_TIET_DON_HANG(maDh, item.maSp, item.soLuong, item.donGia, item.thanhTien, return_value3);
                                int kq3 = int.Parse(string.Format("{0}", return_value3.Value));
                                if (kq3 == -1)
                                {
                                    Session["Message"] = "Loi khong xac dinh, vui long lien he tong dai de duoc ho tro";
                                }
                            }
                            var merchantId = ConfigurationManager.AppSettings["MerchantId"].ToString();
                            var merchantPassword = ConfigurationManager.AppSettings["MerchantPassword"].ToString();
                            var merchantEmail = ConfigurationManager.AppSettings["MerchantEmail"].ToString();

                            RequestInfo info = new RequestInfo();
                            info.Merchant_id = merchantId;
                            info.Merchant_password = merchantPassword;
                            info.Receiver_email = merchantEmail;

                            info.cur_code = "vnd";
                            info.bank_code = bankcode;

                            info.Order_code = maDh;
                            info.Total_amount = tongDon.ToString();

                            info.fee_shipping = "0";
                            info.Discount_amount = "0";
                            info.order_description = "Thanh toán đơn hàng tại DienMay NT";
                            info.return_url = "http://localhost:64992/" + "GioHang/DatHangThanhCong";
                            info.cancel_url = "http://localhost:64992/" + "GioHang/DatHang";

                            info.Buyer_fullname = kh.TENKHACHHANG;
                            info.Buyer_email = kh.EMAIL;
                            info.Buyer_mobile = kh.SDT;

                            APICheckoutV3 objNLChecout = new APICheckoutV3();
                            ResponseInfo result = objNLChecout.GetUrlCheckout(info, paymentMethod);

                            if (result.Error_code == "00")
                            {
                                Session["GioHang"] = null;
                                Session["SoLuong"] = null;
                                Session["TongDonHang"] = null;
                                Session["Message"] = "Dat hang thanh cong";
                                return Redirect(result.Checkout_url);
                            }
                            else
                            {
                                return View();
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        return View();


                    }

                }
            }
            return View();
        }
        public ActionResult DatHangThanhCong()
        {
            return View();
        }
    }
}