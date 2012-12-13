using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BathProducts.Controllers;
using BathProducts.Infrastructure.Repository;

namespace BathProductsTest.ControllerTests {

    [TestClass]
    public class FeatureSets {

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("FeatureSets"), TestCategory("Json"), TestCategory("BO")]
        public void FeatureSetsJsonListTest() {

            FeatureSetsController fs = new FeatureSetsController(new BOFeatureSetsRepository());
            var result = fs.GetFeatureSetsByItem(1);
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }
    }

    [TestClass]
    public class ProductCatagories {
        //Catagory
        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductCatagories"), TestCategory("Json"), TestCategory("BO")]
        public void ProductCatagoriesGetLinesTest() {

            ProductCatagoriesController pcat = new ProductCatagoriesController(new ProductCatagoriesRepository());
            var result = pcat.GetCatagories();
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }
    }

    [TestClass]
    public class ProductLines {

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductLines"), TestCategory("ViewResult"), TestCategory("BO")]
        public void ProductLinesIndexTest() {

            ProductLinesController pline = new ProductLinesController(new ProductLinesRepository());
            var result = pline.Index();
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.ActionResult));
        }

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductLines"), TestCategory("ViewResult"), TestCategory("BO")]
        public void ProductLinesDetailsTest() {

            ProductLinesController pline = new ProductLinesController(new ProductLinesRepository());
            var result = pline.Details(1);
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.ActionResult));
        }

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductLines"), TestCategory("Json"), TestCategory("BO")]
        public void ProductLinesGetLinesTest() {

            ProductLinesController pline = new ProductLinesController(new ProductLinesRepository());
            var result = pline.GetLines();
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }
}

    [TestClass]
    public class ProductItems {

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductItems"), TestCategory("ViewResult"), TestCategory("BO")]
        public void ProductItemsIndexTest() {

            ProductItemsController pitem = new ProductItemsController(new ProductItemsRepository());
            var result = pitem.Index();
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.ActionResult));
        }

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("EagerLoad"), TestCategory("ProductItems"), TestCategory("ViewResult"), TestCategory("BO")]
        public void ProductItemsGetProductItemsTest() {

            ProductItemsController pitem = new ProductItemsController(new ProductItemsRepository());
            var result = pitem.GetProductItems();
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductItems"), TestCategory("ViewResult"), TestCategory("BO")]
        public void ProductItemsDetailsTest() {

            ProductItemsController pitem = new ProductItemsController(new ProductItemsRepository());
            var result = pitem.Details(1);
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.ActionResult));
        }

        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductItems"), TestCategory("Json"), TestCategory("BO")]
        public void ProductItemsGetProductItemsByCatagoryTest() {

            ProductItemsController pitem = new ProductItemsController(new ProductItemsRepository());
            var result = pitem.GetProductItemsByCatagory(1);
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }
        /*
        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductItems"), TestCategory("Json"), TestCategory("BO")]
        public void GetProductBOItemsListTest() {

            ProductItemsController pitem = new ProductItemsController(new ProductItemsRepository());
            var result = pitem.GetProductBOItemsList("1", "2", "3");
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }
        */
        
        [TestMethod]
        [TestCategory("MVC"), TestCategory("Controller"), TestCategory("ProductItems"), TestCategory("Json"), TestCategory("BO")]
        public void ProductItemsGetProductItemsByLineTest() {

            ProductItemsController pitem = new ProductItemsController(new ProductItemsRepository());
            var result = pitem.GetProductItemsByLine(1);
            Assert.IsInstanceOfType(result, typeof(System.Web.Mvc.JsonResult));
        }

    }
}
