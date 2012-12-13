using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BathProducts.Models.Products;
using BathProducts.Helper; 
namespace BathProducts.Infrastructure.Repository {

        public interface IProductLinesRepository{
            List<Models.Products.Line> GetProductLines();
            Models.Products.Line GetProductLine(int id);
        }

        public class ProductLinesRepository : IProductLinesRepository {
            public List<Models.Products.Line> GetProductLines() {
                return  (new Line()).GetInParallel<Line>();
            }

            public Models.Products.Line GetProductLine(int id) {
                return (new Line()).Get<Line>(id);
            }
        }
}