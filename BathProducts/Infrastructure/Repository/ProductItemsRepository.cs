using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BathProducts.Models.Products;
using BathProducts.Helper;
using BathProducts.Models.ViewModels;

namespace BathProducts.Infrastructure.Repository {

    public interface IProductItemsRepository {
        List<BOItem> GetProductItems();
        BOItem GetProductItem(int id);
        List<BOItem> GetProductBOItemsList(params string[] ids); 
        List<Models.Products.Item> GetProductItemsByCatagory(int type_Fk);
        List<Models.Products.Item> GetProductItemsByLine(int line_Fk);
    }

    public class ProductItemsRepository : IProductItemsRepository {

        public List<BOItem> GetProductBOItemsList(params string[] ids) {
            List<BOItem> result = new List<BOItem>();
            foreach (string id_string in ids) {
                int id = 0;
                var foo = int.TryParse( id_string, out id);
                result.Add(
                        (new Item()).Get<BOItem>(id)
                    );
            }
            return result;
        }
        
        public List<BOItem> GetProductItems() {
            List<BOItem> result = (new Item()).GetCollection<BOItem>();
            return result; 
        }

        public BOItem GetProductItem(int id) {
            BOItem retval = (new Item()).Get<BOItem>(id);
            return retval;
        }

        public List<Item> GetProductItemsByCatagory(int type_Fk) {
            List<Item> items = (new Item() {
                Type_Fk = type_Fk
            }).Query<Item>();
            return items; 
        }

        public List<Item> GetProductItemsByLine(int line_Fk) {
            List<Item> items = (new Item() {
                Line_Fk = line_Fk
            }).Query<Item>();
            return items; 
        }

    }
                


}