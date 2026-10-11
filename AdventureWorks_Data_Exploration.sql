/* ALl Sales */
select * from Sales

/* Top 10 Sales */
select top 10 * from Sales

/* Top 10 Products */
select top 10 * from Products

/* Total Customers */
select * from Customer

/* Top 10 Customers */
select top 10 customerkey,firstname from Customer
select top 10 customerkey, concat(FirstName,' ', lastname) as Fullname from Customer

/* Top 10 Territories */
select top 10 * from Territories

/* Product Categories */
select * from [Product Categories]

/* Top 10 Product Sub Categories */
select top 10 * from [Product Subcategories]

/* Displaying the Order Number, Order Date, and Order Quantity from the Sales table */
select OrderNumber, OrderDate, OrderQuantity from Sales

/* Displaying the Product Name, Product Color, and Product Price from the Products table */
select ProductName, ProductColor, ProductPrice from Products

/* Displaying the First Name and Last Name of all customers */
select FirstName, LastName from Customer


/* Displaying all orders placed on after January 1, 2016 */
select * from Sales where OrderDate >= '2016-01-01'

/* Displaying all orders placed before January 1, 2016 */
select * from Sales where orderdate <= '2016-01-01'

/* Displaying all sales where the order quantity is greater than 2 */
select * from sales where OrderQuantity > 2

/* Displaying all products that belong to the Bikes category (Bike SubCategoryKey =1) */
select * from Products where ProductSubCategoryKey = 1

/* Displaying all customers whose annual income is equal or greate than $50000 */
select * from customer where cast(
		replace(
			replace(cast(AnnualIncome as Varchar(Max)),'$',''),
			',',
			''
) as Int ) >= '50000'

/* Displaying all sales where the order quantity is exactly 1 */
select * from sales where OrderQuantity = 1

/* Displaying all products whose color is Black */
select * from Products where ProductColor = 'Black'

/* Displaying all products with a price greater than 1000 */
select * from Products where ProductPrice > 1000

/* Displaying all sales records, showing the latest orders first */
select * from Sales order by orderdate desc

/* Displaying all sales records, showing the oldest orders first */
select * from Sales order by OrderDate asc

/* Displaying all sales records, sorted by the highest order quantity */
select * from Sales order by OrderQuantity desc

/* Displaying all products sorted by price from highest to lowest */
select * from Products order by ProductPrice desc

/* Displaying all products sorted alphabetically by product name */
select * from Products order by ProductName asc

/* Displaying all customers sorted by salary and then by first name */
select * from Customer order by cast(
    replace(
		replace(cast(AnnualIncome as Varchar(Max)),'$',''),
		',',
		'') as Int
) desc, FirstName asc

/* Displaying all sales records sorted by order date (latest first) and order quantity (highest first) */
select * from Sales order by OrderDate desc, OrderQuantity desc

/* Finding the total number of orders */
select count(*) as TotalOrders from Sales

/* Finding the total quantity of products ordered */
select sum(OrderQuantity) as TotalQuantity from Sales

/* Finding the average order quantity */
select avg(orderquantity) as AvgQuantity from Sales

/* Finding the highest order quantity */
select max(OrderQuantity) as HighestOrdQuanity from Sales

/* Finding the lowest order quantity */
select min(orderQuantity) as MinOrdQuantity from Sales

/* Finding the total number of customers */
select count(*) as TotalCustomer from Customer

/* Finding the total number of products */
select count(*) as TotalProducts from Products

/* Finding the average product price */
select avg(productPrice) as AvgProductPrice from Products

/* Finding the most expensive product */
select max(ProductPrice) as HighestPrice from Products

/* Find the least expensive product */
select min(ProductPrice) as LeastPrice from Products

/* Find the total value of all product prices */
select sum(ProductPrice) as TotalVal from Products

/* Find the average product cost */
select avg(ProductCost) as AvgProductCost from Products

