using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BathProducts.Infrastructure.Repository;

namespace BathProductsTest.Infrastructure.Repository {
    [TestClass]
    public class ProductItems {
       
        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("EagerLoad"), TestCategory("Orm")]
        public void GetProductItems() {
            IProductItemsRepository repository = new ProductItemsRepository();
            var results = repository.GetProductItems();
            Assert.IsTrue(results.Count > 0);
        }

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("EagerLoad"), TestCategory("Orm")]
        public void GetProductBOItemsList() {
            IProductItemsRepository repository = new ProductItemsRepository();
            var results = repository.GetProductBOItemsList("1","2","3");
            foreach (BathProducts.Models.ViewModels.BOItem item in results) {
                Console.WriteLine("value: {0} - {1}", item.Name, item.Description );            
            }
            Assert.IsTrue(results.Count > 0);
        }

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("Orm")]
        public void GetProductItem() {
            IProductItemsRepository repository = new ProductItemsRepository();
            var results = repository.GetProductItem(1);
            Console.WriteLine("value: {0}", results.Name );
            Assert.IsNotNull(results.Item_Pk );
        }

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("Orm")]
        public void GetProductItemsByCatagory() {
            IProductItemsRepository repository = new ProductItemsRepository();
            var results = repository.GetProductItemsByCatagory(1);
            Assert.IsTrue(results.Count > 0);
        }

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("Orm")]
        public void GetProductItemsByLine() {
            IProductItemsRepository repository = new ProductItemsRepository();
            var results = repository.GetProductItemsByLine(1);
            Assert.IsTrue(results.Count > 0);
        }

    }


    [TestClass]
    public class ProductLines {

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("Orm")]
        public void GetProductLines() {
             IProductLinesRepository repository = new ProductLinesRepository();
            var results = repository.GetProductLines();
            Assert.IsTrue(results.Count > 0);
        }

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("Orm")]
        public void GetProductLine() {
            IProductLinesRepository repository = new ProductLinesRepository();
            var results = repository.GetProductLine(1);
            Console.WriteLine("value: {0}", results.Title );
            Assert.IsNotNull(results.Line_Pk );
        }
    }

    [TestClass]
    public class FeatureSets {

        [TestMethod]
        [TestCategory("Domain"), TestCategory("Integration"), TestCategory("Orm")]
        public void GetBOFeatureSetsByItem() {
            IBOFeatureSetsRepository repository = new BOFeatureSetsRepository();
            var results = repository.GetBOFeatureSetsByItem(1);
            Assert.IsTrue(results.Count > 0);
        }


    } 
}
