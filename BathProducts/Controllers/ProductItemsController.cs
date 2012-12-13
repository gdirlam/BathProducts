using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BathProducts.Infrastructure.Repository; 

namespace BathProducts.Controllers {
    public class ProductItemsController : Controller    {

        public ProductItemsController(IProductItemsRepository _ProductItemsService) {
            ProductItemsService = _ProductItemsService;
        }

        public IProductItemsRepository ProductItemsService { get; private set; }

        public ViewResult Index() {
            return View(ProductItemsService.GetProductItems()); 
        }

        public ViewResult Details(int id) {
            return View(ProductItemsService.GetProductItem(id));
        }
        
        public JsonResult GetProductItem(int id) {
            return Json(ProductItemsService.GetProductItem(id), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductBOItemsList() {
            var ids = Request.QueryString["keys"].Split( ',' );
            return Json(ProductItemsService.GetProductBOItemsList(ids), JsonRequestBehavior.AllowGet);
        }        
        
        public JsonResult GetProductItemsByCatagory(int id ) {
            return Json(ProductItemsService.GetProductItemsByCatagory(id), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductItemsByLine(int id) {
            return Json(ProductItemsService.GetProductItemsByLine(id), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductItems() {
            return Json(ProductItemsService.GetProductItems(), JsonRequestBehavior.AllowGet);
        }

    }
}
