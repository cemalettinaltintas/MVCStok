using MVCStok.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCStok.Controllers
{
    public class KategoriController : Controller
    {
        MvcDbStokEntities context=new MvcDbStokEntities();
        // GET: Kategori
        public ActionResult Index()
        {
            var kategoriler=context.Kategoriler.ToList();
            return View(kategoriler);
        }

        [HttpGet]
        public ActionResult KategoriGetir()
        {
            return View();
        }
        [HttpPost]
        public ActionResult KategoriEkle(Kategoriler kategori)
        {
            context.Kategoriler.Add(kategori);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KategoriSil(int id)
        {
            var kategori=context.Kategoriler.Find(id);
            context.Kategoriler.Remove(kategori);
            context.SaveChanges();
            return RedirectToAction("Index");   
        }
    }
}