using MVCStok.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCStok.Controllers
{
    public class UrunController : Controller
    {
        MvcDbStokEntities db=new MvcDbStokEntities();
        // GET: Urun
        public ActionResult Index()
        {
            var degerler=db.Urunler.ToList();
            return View(degerler);
        }
        public ActionResult UrunEkle()
        {
            List<SelectListItem> degerler=(from u in db.Kategoriler.ToList() 
                                           select new SelectListItem { 
                                               Text=u.KategoriAd,
                                               Value=u.KategoriId.ToString()
                                           }).ToList();
            ViewBag.dgr = degerler;
            return View();
        }
        [HttpPost]
        public ActionResult UrunEkle(Urunler urun)
        {
            db.Urunler.Add(urun);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}