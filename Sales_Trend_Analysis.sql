/* How many products were sold each year? */
Select
	YEAR(OrderDate) as OrderYear,
	sum(OrderQuantity) as TotalQuantity
	from Sales
group by Year(OrderDate)
order by OrderYear

/* Which months have the highest order volume? */
select 
	MONTH(OrderDate) OrderMonth,
	Count(*) TotalOrders
	from Sales
group by Month(OrderDate)
order by TotalOrders desc

/* Display the total quantity of products sold in each month */
select
	Month(OrderDate) OrderMonth,
	sum(OrderQuantity) as TotalQuantity
	from Sales
group by Month(OrderDate)
order by OrderMonth

/* Find the total number of orders placed in each quarter of the year. Display the results in quarter order. */
select * from Sales	
select
	cast(Quarter as varchar(Max)) as Quarter,
	count(*) as TotalOrders
	from Sales
group by cast(Quarter as varchar(Max))
order by cast(Quarter as varchar(Max))

/* Calculate the total quantity of products sold in each quarter. Display the quarters in ascending order */
select 
	cast(Quarter as varchar(max)) as Quarter,
	sum(OrderQuantity) as TotalQuantity
	from Sales
group by cast(Quarter as varchar(max))
order by cast(Quarter as varchar(max))

/* Display the total number of orders received from each territory. Show the territories with the highest number of orders first */
select 
	TerritoryKey,
	Count(*) as TotalOrders
	from Sales
group by TerritoryKey
order by TotalOrders desc

/* Find the total quantity of products sold in each territory. Display the territories in descending order of total quantity sold. */
select
	TerritoryKey,
	Sum(OrderQuantity) as TotalQuantity
	from Sales
group by TerritoryKey
order by TotalQuantity desc

/* Calculate the average order quantity for each year. Display the years in ascending order */
select
	year(OrderDate) as OrderYear,
	AVG(OrderQuantity) AvgOrderQuantity
	from Sales
group by Year(OrderDate)
order by OrderYear

/* Identify the top 5 territory that has placed the highest number of orders */
select top 5
	TerritoryKey,
	count(*) as TotalOrder
	from Sales
group by TerritoryKey
order by TotalOrder desc

