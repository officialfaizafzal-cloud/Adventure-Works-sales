/* Customer Analysis */

/* All Customers */
select * from Customer

/* Which customers place the most orders? */
select
	c.CustomerKey,
	c.FirstName,
	c.LastName,
	Count(*) as TotalOrders
	from Customer c
	join Sales s
		on s.CustomerKey = c.CustomerKey
group by c.CustomerKey,
	c.FirstName,
	c.LastName
order by TotalOrders Desc

/* Top 10 Customers by Quantity Purchased */
select top 10
	c.CustomerKey,
	c.FirstName,
	c.LastName,
	sum(s.OrderQuantity) as TotalQuantityPurchased
	from Customer c
	join Sales s
		on c.CustomerKey = s.CustomerKey
group by c.CustomerKey,
	c.FirstName,
	c.LastName
order by TotalQuantityPurchased desc

/* Which countries have the most customers? */
select 
	t.Country,
	count(Distinct c.CustomerKey) as TotalCustomer
	from Customer c
	join Sales s
		on c.CustomerKey = s.CustomerKey
	join Territories t
		on t.SalesTerritoryKey = s.TerritoryKey
group by t.Country
order by TotalCustomer desc

/* Which occupations are most common among customers? */
select 
	Occupation,
	count(*) as TotalCustomer
	from Customer
group by Occupation
order by TotalCustomer desc

/* What is the gender distribution of customers? */
select 
	Gender,
	count(*) as TotalCustomers
	from Customer
group by Gender
order by TotalCustomers desc

/* Customer Distribution by Marital Status */
select
	MaritalStatus,
	Count(*) as TotalCustomers
	from Customer
group by MaritalStatus
order by TotalCustomers desc

/* Customers by Education Level */
select 
	EducationLevel,
	count(*) as TotalCustomers
	from Customer
group by EducationLevel
order by TotalCustomers desc

/* Customers by Income Group */
select
	cast(AnnualIncome as varchar(max)) as AnnualIncome,
	count(*) as TotalCustomers
	from Customer
group by cast(AnnualIncome as varchar(max))
Order by cast(replace(
				replace(cast(AnnualIncome as varchar(max)),
				'$',''),
				',',
				''
				) as Int) 
				desc

/* Which customers usually buy larger quantities per order? */
select 
	c.CustomerKey,
	c.FirstName,
	c.LastName,
	avg(s.OrderQuantity) as AvgPurchasedPerOrder
	from Customer c
	inner join Sales s
		on c.CustomerKey = s.CustomerKey
group by c.CustomerKey,
	c.FirstName,
	c.LastName
Order by AvgPurchasedPerOrder desc

/* Which customers have made only one purchase? */
select 
	c.CustomerKey,
	Concat(c.Firstname,' ', c.LastName) as CustomerName,
	count(*) as TotalOrders
	from Customer c
	join Sales s
		on c.CustomerKey = s.CustomerKey
group by c.CustomerKey,
	c.FirstName,
	c.LastName
having count(*) = 1
order by c.CustomerKey

