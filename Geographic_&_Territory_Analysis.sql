/* Geographic & Territory Analysis */

/* Territories Details */
select * from Territories

/* Which countries generate the most orders? */
select 
	t.Country,
	count(*) as TotalOrders
	from Sales s
	join Territories t
		on t.SalesTerritoryKey = s.TerritoryKey
group by t.Country
order by TotalOrders desc

/* Which countries purchase the highest quantity of products? */
select 
	t.Country,
	sum(s.OrderQuantity) as HighestQuantityPurchased
	from Sales s
	join Territories t
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.Country
order by HighestQuantityPurchased desc

/* Which continent contributes the highest number of orders? */
select 
	t.Continent,
	count(*) as TotalOrders
	from Sales s
	join Territories t
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.Continent
order by TotalOrders desc

/* Which continents purchased the highest quantity of products? */
select
	t.Continent,
	sum(s.OrderQuantity) as TotalOrders
	from Sales s
	join Territories t
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.Continent
order by TotalOrders desc

/* Which territories perform the best?(Top 10) */
select top 10
	t.SalesTerritoryKey,
	t.Region,
	t.Country,
	sum(s.OrderQuantity) as TotalOrders
	from Sales s
	join Territories t
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.SalesTerritoryKey,
	t.Region,
	t.Country
order by TotalOrders desc

/* Lowest Performing Territories */
select top 10
	t.SalesTerritoryKey,
	t.Region,
	t.Country,
	sum(s.OrderQuantity) as TotalOrders
	from Sales s
	join Territories t
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.SalesTerritoryKey,
	t.Region,
	t.Country
order by TotalOrders

/* Average Quantity per Territory */
select
	t.SalesTerritoryKey,
	t.Region,
	t.Country,
	avg(s.OrderQuantity) as AvgOrders
	from Sales s
	join Territories t
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.SalesTerritoryKey,
	t.Region,
	t.Country
order by AvgOrders desc

/* Orders by Region */
select
	t.Region,
	count(*) as TotalOrders
	from Territories t
	join Sales s
		on s.TerritoryKey = t.SalesTerritoryKey
group by t.Region
order by TotalOrders desc