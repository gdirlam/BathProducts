using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc; 
using System.ComponentModel.DataAnnotations;
using System.Web.Script.Serialization;
using BathProducts.Helper;


namespace BathProducts.Models {


	namespace Advertising{

			public class Special : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Special_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? SpecialsCatagory_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string SpecialText { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime? StartDate { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime? EndDate { get; set; }
				[AdditionalMetadata("ORM", true)]
				public bool? Shipping { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Catagory { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? itemkey { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? DiscountPer { get; set; }
				[AdditionalMetadata("ORM", true)]
				public decimal? DiscountAmount { get; set; }
				[AdditionalMetadata("ORM", true)]
				public decimal? OrderTotal { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Special() {
					this.OrmContext = new DataOrmContext {
						Create    = "Advertising.SpecialCreate"
						 , Read   = "Advertising.SpecialGet"
						 , Update = "Advertising.SpecialUpdate"
						 , Delete = "Advertising.SpecialDelete"
					};
				}
			}

			public class SpecialCatagory : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? SpecialsCatagory_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Description { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  SpecialCatagory() {
					this.OrmContext = new DataOrmContext {
						Create    = "Advertising.SpecialCatagoryCreate"
						 , Read   = "Advertising.SpecialCatagoryGet"
						 , Update = "Advertising.SpecialCatagoryUpdate"
						 , Delete = "Advertising.SpecialCatagoryDelete"
					};
				}
			}

	}				
				
	namespace dbo{

			public class ELMAH_Error : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public System.Guid ErrorId { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Application { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Host { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Type { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Source { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Message { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string User { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? StatusCode { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime TimeUtc { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Sequence { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string AllXml { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  ELMAH_Error() {
					this.OrmContext = new DataOrmContext {
						Create    = "dbo.ELMAH_ErrorCreate"
						 , Read   = "dbo.ELMAH_ErrorGet"
						 , Update = "dbo.ELMAH_ErrorUpdate"
						 , Delete = "dbo.ELMAH_ErrorDelete"
					};
				}
			}

	}				
				
	namespace Inventory{

			public class Replacement : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Replacement_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Item_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Amount { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime Date { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Replacement() {
					this.OrmContext = new DataOrmContext {
						Create    = "Inventory.ReplacementCreate"
						 , Read   = "Inventory.ReplacementGet"
						 , Update = "Inventory.ReplacementUpdate"
						 , Delete = "Inventory.ReplacementDelete"
					};
				}
			}

			public class Stock : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Inventory_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Item_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? CurrentAmount { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime LastUpdatedDate { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Stock() {
					this.OrmContext = new DataOrmContext {
						Create    = "Inventory.StockCreate"
						 , Read   = "Inventory.StockGet"
						 , Update = "Inventory.StockUpdate"
						 , Delete = "Inventory.StockDelete"
					};
				}
			}

	}				
				
	namespace Orders{

			public class Order : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Order_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Customer_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? ShipTo_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime? Date { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Complete { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string CustomerNote { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Order() {
					this.OrmContext = new DataOrmContext {
						Create    = "Orders.OrderCreate"
						 , Read   = "Orders.OrderGet"
						 , Update = "Orders.OrderUpdate"
						 , Delete = "Orders.OrderDelete"
					};
				}
			}

			public class OrderDetail : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? OrderDetail_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Order_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Customer_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Item_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Quantity { get; set; }
				[AdditionalMetadata("ORM", true)]
				public decimal Amount { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? DetailNo { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Complete { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  OrderDetail() {
					this.OrmContext = new DataOrmContext {
						Create    = "Orders.OrderDetailCreate"
						 , Read   = "Orders.OrderDetailGet"
						 , Update = "Orders.OrderDetailUpdate"
						 , Delete = "Orders.OrderDetailDelete"
					};
				}
			}

			public class Payment : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Payment_PK { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Order_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Customer_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public decimal? Amount { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string TransactionType { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Method_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string CCNumber { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string CCName { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string CCExpireation { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string SecurityNo { get; set; }
				[AdditionalMetadata("ORM", true)]
				public bool? Online { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Payment() {
					this.OrmContext = new DataOrmContext {
						Create    = "Orders.PaymentCreate"
						 , Read   = "Orders.PaymentGet"
						 , Update = "Orders.PaymentUpdate"
						 , Delete = "Orders.PaymentDelete"
					};
				}
			}

			public class Shipped : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Shipping_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Customer_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Order_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? ShipTo_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.DateTime? CompleteDate { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Complete { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Shipped() {
					this.OrmContext = new DataOrmContext {
						Create    = "Orders.ShippedCreate"
						 , Read   = "Orders.ShippedGet"
						 , Update = "Orders.ShippedUpdate"
						 , Delete = "Orders.ShippedDelete"
					};
				}
			}

			public class ShipTo : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? ShipTo_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Customer_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string LastName { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string FirstName { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Address { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Address2 { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string City { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string State { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Zip { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  ShipTo() {
					this.OrmContext = new DataOrmContext {
						Create    = "Orders.ShipToCreate"
						 , Read   = "Orders.ShipToGet"
						 , Update = "Orders.ShipToUpdate"
						 , Delete = "Orders.ShipToDelete"
					};
				}
			}

	}				
				
	namespace Products{

			public class Catagory : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Catagory_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Title { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Description { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Catagory() {
					this.OrmContext = new DataOrmContext {
						Create    = "Products.CatagoryCreate"
						 , Read   = "Products.CatagoryGet"
						 , Update = "Products.CatagoryUpdate"
						 , Delete = "Products.CatagoryDelete"
					};
				}
			}

			public class Feature : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Feature_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? FeatureSet_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Name { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Description { get; set; }
				[AdditionalMetadata("ORM", true)]
				public bool? Active { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Feature() {
					this.OrmContext = new DataOrmContext {
						Create    = "Products.FeatureCreate"
						 , Read   = "Products.FeatureGet"
						 , Update = "Products.FeatureUpdate"
						 , Delete = "Products.FeatureDelete"
					};
				}
			}

			public class FeatureSet : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? FeatureSet_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Item_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Title { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Description { get; set; }
				[AdditionalMetadata("ORM", true)]
				public bool? Active { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  FeatureSet() {
					this.OrmContext = new DataOrmContext {
						Create    = "Products.FeatureSetCreate"
						 , Read   = "Products.FeatureSetGet"
						 , Update = "Products.FeatureSetUpdate"
						 , Delete = "Products.FeatureSetDelete"
					};
				}
			}

			public class Item : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Item_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Name { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Description { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Line_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public int? Type_Fk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public decimal? Price { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Item() {
					this.OrmContext = new DataOrmContext {
						Create    = "Products.ItemCreate"
						 , Read   = "Products.ItemGet"
						 , Update = "Products.ItemUpdate"
						 , Delete = "Products.ItemDelete"
					};
				}
			}

			public class Line : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Line_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Title { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Description { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Line() {
					this.OrmContext = new DataOrmContext {
						Create    = "Products.LineCreate"
						 , Read   = "Products.LineGet"
						 , Update = "Products.LineUpdate"
						 , Delete = "Products.LineDelete"
					};
				}
			}

	}				
				
	namespace Profile{

			public class Customer : IOrmModel {


				[AdditionalMetadata("ORM", true)]
				[AdditionalMetadata("ORM_PrimaryKey", true)]
				public int? Customer_Pk { get; set; }
				[AdditionalMetadata("ORM", true)]
				public System.Guid? AspNet_UserId { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Email { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string LastName { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string FirstName { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Prefix { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Address { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Address2 { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string City { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string State { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Zip { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string PrimaryPhone { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string AltPhone { get; set; }
				[AdditionalMetadata("ORM", true)]
				public string Memo { get; set; }
				[AdditionalMetadata("ORM", true)]
				public bool? Active { get; set; }
				
				[ScriptIgnore]
				public DataOrmContext OrmContext { get; set; }
				public  Customer() {
					this.OrmContext = new DataOrmContext {
						Create    = "Profile.CustomerCreate"
						 , Read   = "Profile.CustomerGet"
						 , Update = "Profile.CustomerUpdate"
						 , Delete = "Profile.CustomerDelete"
					};
				}
			}

	}				
				
}