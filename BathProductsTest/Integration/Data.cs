using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BathProducts.Models.Products;
using System.Threading.Tasks;
using BathProducts.Helper;
using BathProducts.Models.ViewModels;

namespace BathProductsTest.Integration {
    [TestClass]
    public class Data {

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Benchmark")]
        public void DataAccessOther_List() {

            List<FeatureSet> featureSets = (new FeatureSet()).GetCollection<FeatureSet>(); //.ConvertAll<Line>(obj => (Line)obj);
            featureSets.ForEach(fs => {
                Console.WriteLine("line {0} title:{1}", fs.FeatureSet_Pk, fs.Title );
            });

            Console.WriteLine("tested {0} rows", featureSets.Count.ToString());
            Assert.IsTrue(featureSets.Count > 0);
        }


        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Benchmark")]
        public void DataAccess_List() {

            Line line = new Line();
            List<Line> lines = line.GetCollection<Line>();
            lines.ForEach(ln => {
                Console.WriteLine("line {0} title:{1}", ln.Line_Pk.ToString(), ln.Title);
            });

            Console.WriteLine("tested {0} rows", lines.Count.ToString());
            Assert.IsTrue(lines.Count > 0);
        }

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Benchmark")]
        public void DataAccess_GenericSingleGet() {
            Line line = new Line();
            line = line.Get<Line>(1);
            Console.WriteLine("line {0} title:{1}", line.Line_Pk.ToString(), line.Title);
            Assert.AreEqual(line.Title, "Lemongrass and Lavender");
        }

 

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Benchmark")]
        public void DataAccess_IOrmModelSingleGet() {
            Line line = new Line();
            line = (Line)line.Get<Line>(1);

            Assert.AreEqual(line.Title, "Lemongrass and Lavender");
        }

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Benchmark")]
        public void DataAccess_Collections() {
            /*
                        Parallel.ForEach(Enumerable.Range(1, 100), i => {
                            Line line = new Line();
                            List<Line> lines = line.GetCollection().ConvertAll<Line>(obj => (Line)obj);
                            Console.WriteLine("tested {0} rows", lines.Count.ToString());
                        });
                        Assert.IsTrue(true);
            */
            //Line line = new Line();
            List<Line> lines = (new Line()).GetCollection<Line>();//.ConvertAll<Line>(obj => (Line)obj);
            lines.ForEach(ln => {
                Console.WriteLine("line {0} title:{1}", ln.Line_Pk.ToString(), ln.Title);
            });

            Console.WriteLine("tested {0} rows", lines.Count.ToString());
            Assert.IsTrue(lines.Count > 0);


        }

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Parallel"), TestCategory("Benchmark")]
        public void DataAccess_ParallelCollectionsGenerics() {
            Line line = new Line();
            List<Line> lines = line.GetInParallel<Line>();
            lines.ForEach(ln => {
                Console.WriteLine("line {0} title:{1}", ln.Line_Pk.ToString(), ln.Title);
            });
            Console.WriteLine("tested {0} rows", lines.Count.ToString());
            Assert.IsTrue(lines.Count > 0);
            line = null;
        }

        [TestMethod]
        [TestCategory("Integration"), TestCategory("Orm"), TestCategory("Parallel"), TestCategory("Benchmark")]
        public void DataAccess_ParallelCollections() {
            Line line = new Line();
            List<Line> lines = line.GetInParallel<Line>().ConvertAll<Line>(obj => (Line)obj);
            lines.ForEach(ln => {
                Console.WriteLine("line {0} title:{1}", ln.Line_Pk.ToString(), ln.Title);
            });
            Console.WriteLine("tested {0} rows", lines.Count.ToString());
            Assert.IsTrue(lines.Count > 0);
            line = null;
        }


        [TestMethod]
        [TestCategory("Integration"), TestCategory("Reflection")]
        public void QueryUseGeneric() {
            Line line = new Line() { Line_Pk=1 };
            List<Line> lines = line.Query<Line>();
            lines.ForEach(ln => {
                Console.WriteLine("line {0} title:{1}", ln.Line_Pk.ToString(), ln.Title);
            });
            Console.WriteLine("tested {0} rows", lines.Count.ToString());
            Assert.IsTrue(lines.Count > 0);
            line = null;
        }


    }
}
