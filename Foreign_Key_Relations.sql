/* Creating Foreign Key Relationship */

/* Sales -> Products */
Alter table Sales 
add constraint FK_Sales_Products
foreign key (ProductKey)
references Products(ProductKey)

/*Sales -> Customers */
Alter table Sales
add constraint FK_Sales_Customers
foreign key (CustomerKey)
references Customer(CustomerKey)

/* Sales -> Territories */
Alter table Sales
add constraint FK_Sales_Territories
foreign key (TerritoryKey)
references Territories(SalesTerritoryKey)

/* Product -> Product Subcategories */
Alter table Products
add constraint FK_Product_Subcategories
foreign key (ProductSubcategoryKey)
references [Product Subcategories] (ProductSubcategoryKey)

/* Product Subcategories -> Product Categories */
Alter table [Product Subcategories]
add constraint FK_Subcategories_Categories
foreign key (ProductCategoryKey)
references [Product Categories](ProductCategoryKey)

