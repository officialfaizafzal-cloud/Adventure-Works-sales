/* Executive Business Insights */
select * from Products
select * from Sales

/* Which products generate the highest sales volume?(Top 10) */
select Top 10
	p.ProductName,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s
	join Products p
		on p.ProductKey = s.ProductKey
group by p.ProductName
order by TotalQuantitySold desc

/* Which products have the lowest sales?(Bottom 10) */
select top 10
	p.ProductName,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s 
	join Products p 
		on s.ProductKey = p.ProductKey
group by p.ProductName
order by TotalQuantitySold 

/* Who are the most valuable customers by purchase quantity?(Top 10 Customers) */
select Top 10
	CONCAT(c.FirstName,' ',c.LastName) as CustomerName,
	sum(s.OrderQuantity) as TotalPurchasedQty
	from Customer c
	join Sales s
		on s.CustomerKey = c.CustomerKey
group by c.FirstName,
	c.LastName
order by TotalPurchasedQty desc

/* Top 10 Countries */
select top 10
	t.Country,
	sum(s.OrderQuantity) as TotalOrders
	from Territories t
	join Sales s
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.Country
order by TotalOrders desc

/* Highest Selling Category */
select top 10
	pc.CategoryName,
	sum(s.OrderQuantity) as TotalProductSold
	from Sales s
	join Products p
		on p.ProductKey = s.ProductKey
	join [Product Subcategories] ps
		on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
	join [Product Categories] pc
		on pc.ProductCategoryKey = ps.ProductCategoryKey
group by pc.CategoryName
order by TotalProductSold desc

/* Highest Selling Subcategory */
select top 10
	ps.SubcategoryName,
	sum(s.OrderQuantity) as TotalProductSold
	from Sales s
	join Products p
		on p.ProductKey = s.ProductKey
	join [Product Subcategories] ps
		on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
group by ps.SubcategoryName
order by TotalProductSold desc

/* Products Never Ordered */
select
	p.ProductName
	from Products p
	left join Sales s
		on p.ProductKey = s.ProductKey
where p.ProductKey is null

