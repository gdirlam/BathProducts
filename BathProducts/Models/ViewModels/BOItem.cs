using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BathProducts.Models.Products;
using BathProducts.Helper;

/*Note Eager Loads Children*/
namespace BathProducts.Models.ViewModels {
    public class BOItem : BathProducts.Models.Products.Item {
        new public int? Item_Pk { 
            get { return base.Item_Pk; } 
            set {
                if (value != null) {
                    base.Item_Pk = value;
                    getFeatureSets();
                }
            } 
        }

        public void getFeatureSets() {
            try {
                FeatureSets = (new FeatureSet() {
                    Item_Fk = base.Item_Pk
                }).Query<BOFeatureSet>();
            }
            catch (Exception) {
                FeatureSets = new List<BOFeatureSet>();
            }
        }
        public List<BOFeatureSet> FeatureSets;

    }
}