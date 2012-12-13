using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BathProducts.Models.Products;
using BathProducts.Helper;

/*Note Eager Loaded*/
namespace BathProducts.Models.ViewModels {

    public class BOFeatureSet : FeatureSet  {

        new public int? FeatureSet_Pk {
            get { return base.FeatureSet_Pk; }
            set {
                if (value != null) {
                    base.FeatureSet_Pk = value;
                    getFeatures();
                }
            }
        }

        public void getFeatures() {
            try {
                Features = (new Feature() {
                    Feature_Pk = base.FeatureSet_Pk
                }).Query<Feature>();
            }
            catch (Exception) {
                Features = new List<Feature>();
            }
        }
        public List<Feature> Features;

    }
}