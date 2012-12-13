using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BathProducts.Models.Products;
using BathProducts.Helper;
namespace BathProducts.Infrastructure.Repository {
    public interface IProductCatagoriesRepository {
        List<Models.Products.Catagory> GetProductCatagories();
        Models.Products.Catagory GetProductCatagories(int id);
    }

    public class ProductCatagoriesRepository : IProductCatagoriesRepository {


        public List<Models.Products.Catagory> GetProductCatagories() {
            return (new Catagory()).GetInParallel<Catagory>();

        }

        public Models.Products.Catagory GetProductCatagories(int id) {
            return (new Catagory()).Get<Catagory>(id);
        }
    }
}