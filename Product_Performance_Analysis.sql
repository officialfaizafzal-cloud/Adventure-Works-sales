/* Which products sold the highest quantity? */
select top 10
	p.ProductName,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s
	inner join Products p on
	s.ProductKey = p.ProductKey
group by p.ProductName
order by TotalQuantitySold desc

/* Which products sold the least? */
select top 10
	p.ProductName,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s 
	inner join Products p
	on s.ProductKey = p.ProductKey
group by p.ProductName
order by TotalQuantitySold asc

/* Which product category performs the best? */
select 
	pc.CategoryName,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s
	inner join Products P
		on P.ProductKey = s.ProductKey
	inner join [Product Subcategories] ps 
		on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
	inner join [Product Categories] pc
		on pc.ProductCategoryKey = ps.ProductCategoryKey
group by pc.CategoryName
order by TotalQuantitySold desc

/* Which subcategory contributes the most sales? */
select
	ps.SubcategoryName,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s
	join Products p 
		on s.ProductKey = p.ProductKey
	join [Product Subcategories] ps
		on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
group by ps.SubcategoryName
order by TotalQuantitySold desc

/* Which products appear in the most orders? */
select
	p.ProductName,
	count(*) as TotalOrders
	from Sales s 
	join Products p
		on s.ProductKey = p.ProductKey
group by p.ProductName
order by TotalOrders desc

/* What is the average quantity ordered for each product? */
select 
	p.ProductName,
	avg(OrderQuantity) as AvgOrderQuantity
	from Sales s
	join Products p
		on p.ProductKey = s.ProductKey
group by p.ProductName
order by AvgOrderQuantity desc

/* Which products have never been sold? */
select
	p.ProductName
	from Products p
	left join Sales s
		on s.ProductKey = p.ProductKey
where s.ProductKey is null

/* Which product colors sell the most? */
select
	p.ProductColor,
	sum(s.OrderQuantity) as TotalQuantitySold
	from sales s
	inner join products p
		on s.ProductKey = p.ProductKey
group by p.ProductColor
order by TotalQuantitySold desc

/* Which product sizes are most popular? */
select
	p.ProductSize,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s
	join Products p
		on s.ProductKey	= p.ProductKey
group by p.ProductSize
order by TotalQuantitySold desc

/* Which product styles sell the most? */
select
	p.ProductStyle,
	sum(s.OrderQuantity) as TotalQuantitySold
	from Sales s
	join Products p
		on s.ProductKey = p.ProductKey
group by p.ProductStyle
order by TotalQuantitySold desc