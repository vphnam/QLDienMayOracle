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
        QLDienMayEntities database = new QLDienMayEntities();
        // GET: Shop
        public ActionResult Index()
        {
            return View(database.SANPHAMs.OrderBy(n => n.MASANPHAM).ToList());
        }

        public ActionResult TuLanh()
        {
            return View(database.SANPHAMs.ToList());
        }
        public ActionResult TiVi()
        {
            return View(database.SANPHAMs.ToList());
        }

        public ActionResult Detail(int id)
        {
            return View();
        }
    }
}