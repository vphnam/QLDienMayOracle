using QLDienMay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLDienMay.Controllers
{
    public class HomeController : Controller
    {
        QLDienMayEntities db = new QLDienMayEntities();
        public List<DisplaySP> LayDsSp()
        {
            var sp = db.SANPHAMs.OrderBy(n => n.MASANPHAM).ToList();
            List<DisplaySP> lstDisSp = new List<DisplaySP>();
            foreach (var item in sp)
            {
                DisplaySP disSp = new DisplaySP();
                disSp.maSanPham = item.MASANPHAM;
                disSp.tenSanPham = item.TENSANPHAM;
                disSp.anhMinhHoa = item.ANHMINHHOA;
                disSp.donGia = item.DONGIA;
                disSp.maKhuyenMai = item.MAKHUYENMAI;
                if (disSp.maKhuyenMai != null)
                {
                    var km = db.KHUYENMAIs.Find(disSp.maKhuyenMai);
                    double phantramkm = (double)km.PHANTRAMKHUYENMAI;
                    disSp.giaKhuyenMai = (decimal)item.DONGIA - ((decimal)item.DONGIA * (decimal)phantramkm);
                }
                else
                    disSp.giaKhuyenMai = item.DONGIA;
                lstDisSp.Add(disSp);
            }
            return lstDisSp.OrderBy(n => n.maSanPham).ToList();
        }
        public List<DisplaySP> LayDsSpByMaDM(string maDm)
        {
            List<string> lstLoai = db.LOAIs.Where(n => n.MADANHMUC == maDm.Trim()).OrderBy(n => n.MALOAI).Select(n => n.MALOAI).ToList();
            List<SANPHAM> lstSP = db.SANPHAMs.ToList();
            List<DisplaySP> lstDisSp = new List<DisplaySP>();
            foreach (var sp in lstSP)
            {
                bool flag = sp.LOAIs.Select(n => n.MALOAI).Intersect(lstLoai).Any();
                if(flag == true)
                {
                    DisplaySP disSp = new DisplaySP();
                    disSp.maSanPham = sp.MASANPHAM;
                    disSp.tenSanPham = sp.TENSANPHAM;
                    disSp.anhMinhHoa = sp.ANHMINHHOA;
                    disSp.donGia = sp.DONGIA;
                    disSp.maKhuyenMai = sp.MAKHUYENMAI;
                    if (disSp.maKhuyenMai != null)
                    {
                        var km = db.KHUYENMAIs.Find(disSp.maKhuyenMai);
                        double phantramkm = (double)km.PHANTRAMKHUYENMAI;
                        disSp.giaKhuyenMai = (decimal)sp.DONGIA - ((decimal)sp.DONGIA * (decimal)phantramkm);
                    }
                    else
                        disSp.giaKhuyenMai = sp.DONGIA;
                    lstDisSp.Add(disSp);
                }
            }       
            
            return lstDisSp.OrderBy(n => n.maSanPham).ToList();
        }
        public ActionResult Index()
        {
            List<DisplaySP> lstDisMon = LayDsSp();
            return View(lstDisMon);
        }
        public ActionResult DanhMuc()
        {
            return PartialView(db.DANHMUCs.OrderBy(n => n.MADANHMUC).ToList());
        }
        public ActionResult Loai(string maDm)
        {
            return PartialView(db.LOAIs.Where(n => n.MADANHMUC == maDm).OrderBy(n => n.MALOAI).ToList());
        }
        [HttpGet]
        public ActionResult SortByDM(string maDm)
        {
            List<DisplaySP> lstDisMon = LayDsSpByMaDM(maDm);
            DANHMUC dm = db.DANHMUCs.Find(maDm.Trim());
            ViewBag.TenDM = dm.TENDANHMUC.ToString();
            return View(lstDisMon);
        }
        public ActionResult SortByLoai()
        {
            List<DisplaySP> lstDisMon = LayDsSp();
            return View(lstDisMon);
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}