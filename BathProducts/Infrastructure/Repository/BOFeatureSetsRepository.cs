using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BathProducts.Models.ViewModels;
using BathProducts.Models.Products;
using BathProducts.Helper; 

namespace BathProducts.Infrastructure.Repository {

    public interface IBOFeatureSetsRepository{
        List<BOFeatureSet> GetBOFeatureSetsByItem(int item_Fk);
    }

    public class BOFeatureSetsRepository : IBOFeatureSetsRepository {

        public List<BOFeatureSet> GetBOFeatureSetsByItem(int item_Fk) {
            List<BOFeatureSet> items = (new BOFeatureSet() {
                Item_Fk = item_Fk
            }).Query<BOFeatureSet>();
            return items; 
        }
    }

}