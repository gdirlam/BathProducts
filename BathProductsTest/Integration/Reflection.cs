using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BathProducts.Helper;
using BathProducts.Models.Products;
using BathProducts.Models.ViewModels;


namespace BathProductsTest.Integration {
    [TestClass]
    public class Reflection {

        [TestMethod]
        [TestCategory("Reflection")]
        public void ProcessName() {
            string processName = ReflectionHelper.GetProcessName(this);
            Assert.IsFalse(string.IsNullOrEmpty(processName));
        }

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Reflection")]
        public void GetProperty() {
            BathProducts.Models.Orders.Order O = new BathProducts.Models.Orders.Order() { Complete = "1" };
            var prop = (string)O.GetProperty("Complete");
            Assert.IsInstanceOfType(prop, typeof(string));
        }

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Reflection")]
        public void SetProperty() {
            BathProducts.Models.Orders.Order O = new BathProducts.Models.Orders.Order();
            O.SetProperty("Complete", "1");
            var prop = (string)O.GetProperty("Complete");
            Assert.IsInstanceOfType(prop, typeof(string));
        }


    }
}
