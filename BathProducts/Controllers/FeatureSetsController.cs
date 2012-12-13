using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BathProducts.Infrastructure.Repository; 
namespace BathProducts.Controllers
{
    public class FeatureSetsController : Controller
    {
        //
        // GET: /FeatureSets/

        public FeatureSetsController(IBOFeatureSetsRepository _FeatureSetsService) {
            FeatureSetsService = _FeatureSetsService;
        }

        public IBOFeatureSetsRepository FeatureSetsService { get; private set; }


        //public ActionResult Index()
        //{
        //    return View();
        //}

        public JsonResult GetFeatureSetsByItem(int id) {
            return Json(FeatureSetsService.GetBOFeatureSetsByItem(id), JsonRequestBehavior.AllowGet);
        }

    }
}
