using MVCStok.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCStok.Controllers
{
    public class MusteriController : Controller
    {
        MvcDbStokEntities db=new MvcDbStokEntities(); 
        // GET: Musteri
        public ActionResult Index()
        {
            var musteteriler=db.Musteriler.Where(x=>x.Durum==true).ToList();
            return View(musteteriler);
        }

        public ActionResult MusteriEkle()
        {
            return View();
        }
        [HttpPost]
        public ActionResult MusteriEkle(Musteriler musteri)
        {
            musteri.Durum = true;
            db.Musteriler.Add(musteri);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}