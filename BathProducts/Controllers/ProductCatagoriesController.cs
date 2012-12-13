using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BathProducts.Infrastructure.Repository; 

namespace BathProducts.Controllers
{
    public class ProductCatagoriesController : Controller
    {
        //
        // GET: /ProductCatagories/
        //ProductCatagoriesRepository
        public ProductCatagoriesController(IProductCatagoriesRepository _ProductCatagoriesService) {
            ProductCatagoriesService = _ProductCatagoriesService;
        }
        public IProductCatagoriesRepository ProductCatagoriesService { get; private set; }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetCatagories() {
            return Json(ProductCatagoriesService.GetProductCatagories(), JsonRequestBehavior.AllowGet);
        }

    }
}
