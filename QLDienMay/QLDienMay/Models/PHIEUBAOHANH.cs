//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLDienMay.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PHIEUBAOHANH
    {
        public string MAPHIEUBH { get; set; }
        public string MASANPHAM { get; set; }
        public string MAKHACHHANG { get; set; }
        public string MADONHANG { get; set; }
        public System.DateTime NGAYTAO { get; set; }
        public System.DateTime NGAYHETHAN { get; set; }
        public string TRANGTHAI { get; set; }
    
        public virtual DONHANG DONHANG { get; set; }
        public virtual KHACHHANG KHACHHANG { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}
