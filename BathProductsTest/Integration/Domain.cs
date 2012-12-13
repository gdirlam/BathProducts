using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BathProducts.Models.Products;
using BathProducts.Helper;
namespace BathProductsTest.Integration {
    [TestClass]
    public class Domain {

        [TestMethod]
        [TestCategory("Non-functional"), TestCategory("Integration"), TestCategory("Orm")]
        public void ConnectionString() {
            string connectionstring = DataExtensions_Accessor.Connstring();
            Console.WriteLine("value: {0}", connectionstring);
            Assert.IsFalse(string.IsNullOrEmpty(connectionstring));
        }
        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm")]
        public void PrimaryKey() {
            int keyval = 100;
            BathProducts.Models.Orders.Order O = new BathProducts.Models.Orders.Order() { Order_Pk = keyval };
            var key = O.PrimaryKey();
            Assert.AreEqual(key.Value, 100);
        }
        [TestMethod]
        [TestCategory("Non-functional"), TestCategory("Integration")]
        public void CacheSettoOff() {
            //if the application is caching, certain test may yeild inconclusive results.
            Line line = new Line();
            Assert.AreEqual(line.CacheStatus(), false);
        }

    }
}
