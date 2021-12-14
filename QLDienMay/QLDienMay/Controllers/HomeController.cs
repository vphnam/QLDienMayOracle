using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLDienMay.Models;

namespace QLDienMay.Controllers
{
    public class HomeController : Controller
    {
        QLDienMayEntities db = new QLDienMayEntities();
        ///QLDienMayEntities db = new QLDienMayEntities("name=QLDienMayEntities1");
        
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
                    disSp.giaKhuyenMai = 0;
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
                        disSp.giaKhuyenMai = 0;
                    lstDisSp.Add(disSp);
                }
            }       
            
            return lstDisSp.OrderBy(n => n.maSanPham).ToList();
        }
        public List<DisplaySP> LayDsSpByMaLoai(string maLoai)
        {
            List<SANPHAM> lstSP = db.SANPHAMs.ToList();
            List<DisplaySP> lstDisSp = new List<DisplaySP>();
            foreach (var sp in lstSP)
            {
                bool flag = false;
                foreach(var loai in sp.LOAIs.Select(n => n.MALOAI))
                {
                    if (loai == maLoai) 
                    {
                        flag = true;
                        continue;
                    }
                }
                if (flag == true)
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
                        disSp.giaKhuyenMai = 0;
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
        public ActionResult SortByDM(string id)
        {
            DANHMUC dm = db.DANHMUCs.SingleOrDefault(n => n.MADANHMUC == id.Trim());
            List<DisplaySP> lstDisMon = LayDsSpByMaDM(id.Trim());
            
            return View(lstDisMon);
        }
        public ActionResult SortByLoai(string id)
        {
            LOAI loai = db.LOAIs.SingleOrDefault(n => n.MALOAI == id.Trim());

            List<DisplaySP> lstDisMon = LayDsSpByMaLoai(id.Trim());
            return View(lstDisMon);
        }
        public ActionResult Detail(string id)
        {
            SANPHAM sp = db.SANPHAMs.Find(id.Trim());
            List<string> lst = sp.LOAIs.Select(n => n.MALOAI).ToList();
            LOAI loai = db.LOAIs.Find(lst[0]);


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
                disSp.giaKhuyenMai = 0;

            ViewData["lstDacDiem"] = db.DACDIEMNOIBATs.Where(n => n.MASANPHAM == id.Trim()).ToList();
            ViewData["lstTinhNang"] = db.TINHNANGs.Where(n => n.MASANPHAM == id.Trim()).ToList();
            ViewData["lstThongSo"] = db.THONGSOKITHUATs.Where(n => n.MASANPHAM == id.Trim()).ToList();

            List<DisplaySP> lstSp = LayDsSpByMaDM(loai.MADANHMUC);

            ViewData["lstSP"] = lstSp.OrderBy(n => n.maSanPham).Take(3).ToList();
            ViewData["TenDm"] = loai.DANHMUC.TENDANHMUC;
            ViewBag.MaDanhMuc = loai.DANHMUC.MADANHMUC;
            return View(disSp);
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}