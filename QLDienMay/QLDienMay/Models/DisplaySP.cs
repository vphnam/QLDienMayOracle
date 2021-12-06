using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLDienMay.Models
{
    public class DisplaySP
    {
        public DisplaySP()
        {
        }
        public string maSanPham { get; set; }
        public string tenSanPham { get; set; }
        public string anhMinhHoa { get; set; }
        public decimal donGia { get; set; }
        public string maKhuyenMai { get; set; }
        public decimal giaKhuyenMai { get; set; }
    }
}