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
    
    public partial class PHANHOI
    {
        public string MAPHANHOI { get; set; }
        public string MAKHACHHANG { get; set; }
        public string NOIDUNG { get; set; }
        public string TRANGTHAI { get; set; }
    
        public virtual KHACHHANG KHACHHANG { get; set; }
    }
}
