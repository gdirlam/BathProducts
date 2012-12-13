using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BathProducts.Infrastructure.Repository; 

namespace BathProducts.Controllers {
    public class ProductLinesController : Controller    {

        public ProductLinesController(IProductLinesRepository _ProductLinesService) {
            ProductLinesService = _ProductLinesService;
        }

        public IProductLinesRepository ProductLinesService { get; private set; }

        public ViewResult Index() {
            return View(ProductLinesService.GetProductLines()); 
        }

        public ViewResult Details(int id) {
            return View(ProductLinesService.GetProductLine(id));
        }

        public JsonResult GetLines() {
            return Json(ProductLinesService.GetProductLines(), JsonRequestBehavior.AllowGet);
        }

    }
}
