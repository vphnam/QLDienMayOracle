using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLDienMay.Models
{
    public class GioHang
    {
        QLDienMayEntities db = new QLDienMayEntities();
        public string maSp { get; set; }
        public string tenSp { get; set; }
        public string anhMinhHoa { get; set; }
        public decimal donGia { get; set; }
        public int soLuong { get; set; }
        public decimal thanhTien
        {
            get { return soLuong * donGia; }
        }
        public GioHang(string id, int sl)
        {
            maSp = id;
            SANPHAM sp = db.SANPHAMs.Find(id.Trim());
            tenSp = sp.TENSANPHAM;
            anhMinhHoa = sp.ANHMINHHOA;
            if (sp.MAKHUYENMAI != null)
            {
                KHUYENMAI km = db.KHUYENMAIs.Find(sp.MAKHUYENMAI);
                donGia = (decimal)sp.DONGIA - ((decimal)sp.DONGIA * (decimal)km.PHANTRAMKHUYENMAI);

            }
            else
            {
                donGia = (decimal)sp.DONGIA;
            }
            soLuong = sl;
        }
    }
}