/* Rank all products based on total quantity sold */
select
    p.ProductName,
    sum(s.OrderQuantity) as TotalQuantitySold,
    rank() over(
        order by sum(s.OrderQuantity) desc
    ) as ProductRank
from Sales s
join Products p
    on s.ProductKey = p.ProductKey
group by p.ProductName;


/* Which product is the best-selling in every category? */
with ProductSales as
(
    select
        pc.CategoryName,
        p.ProductName,
        SUM(s.OrderQuantity) AS TotalQuantity,
        ROW_NUMBER() OVER(
            partition by pc.CategoryName
            order by SUM(s.OrderQuantity) DESC
        ) as RN
    from Sales s
    join Products p
        on s.ProductKey = p.ProductKey
    join [Product Subcategories] ps 
        on ps.ProductSubCategoryKey = p.ProductSubcategoryKey
    Join [Product Categories] pc
        on pc.ProductCategoryKey = ps.ProductCategoryKey
    group by
        pc.CategoryName,
        p.ProductName
)
select *
from ProductSales
where RN = 1;


/* Rank Customers */
select
    concat(c.FirstName,' ',c.LastName) AS CustomerName,
    sum(s.OrderQuantity) AS TotalQuantity,
    DENSE_RANK() over(
        order by SUM(s.OrderQuantity) DESC
    ) as CustomerRank
from Sales s
join Customer c
    on s.CustomerKey=c.CustomerKey
group by
    c.FirstName,
    c.LastName


/* Monthly Sales Trend */
select
    YEAR(OrderDate) as OrderYear,
    MONTH(OrderDate) as OrderMonth,
    SUM(OrderQuantity) as TotalQuantity
from Sales
group by
    YEAR(OrderDate),
    MONTH(OrderDate)
order by
    OrderYear,
    OrderMonth;


/* Compare Current Month with Previous Month */
with MonthlySales as
(
select
    YEAR(OrderDate) as OrderYear,
    MONTH(OrderDate) as OrderMonth,
    SUM(OrderQuantity) as TotalQuantity
from Sales
group by
    YEAR(OrderDate),
    MONTH(OrderDate)
)

select *,
LAG(TotalQuantity) over(
order by
OrderYear,
OrderMonth
) PreviousMonth
from MonthlySales;


/* Running Quantity */
select
    OrderDate,
    SUM(OrderQuantity) as DailyQuantity,

    SUM(SUM(OrderQuantity))
    over(
    order  by OrderDate
    ) as RunningTotal
from Sales
group by OrderDate
order by OrderDate;


/* Order Size Classification */
select
    OrderNumber,
    OrderQuantity,
    case
        when OrderQuantity>=5 then 'High'
        when OrderQuantity>=3 then 'Medium'
        else 'Low'
    end as OrderSize
from Sales;


/* Customers Above Average Purchase */
with CustomerSales as
(
select
CustomerKey,
SUM(OrderQuantity) TotalQuantity
from Sales
group by CustomerKey
)

select *
from CustomerSales
where TotalQuantity>
(
select AVG(TotalQuantity)
from CustomerSales
);


/* Top 3 Products in Each Category */
with RankedProducts as
(
select
pc.CategoryName,
p.ProductName,
SUM(s.OrderQuantity) TotalQuantity,

ROW_NUMBER() over(
partition by pc.CategoryName
order by SUM(s.OrderQuantity) DESC
) Ranking

from Sales s
join Products p
    on s.ProductKey=p.ProductKey
join [Product Subcategories] ps
    on ps.ProductSubcategoryKey = p.ProductSubcategoryKey
join [Product Categories] pc 
    on pc.ProductCategoryKey = ps.ProductCategoryKey

group by
pc.CategoryName,
p.ProductName
)

select *
from RankedProducts
where Ranking<=3;


/* Highest Selling Month Every Year */
with MonthlySales as
(
select
YEAR(OrderDate) OrderYear,
MONTH(OrderDate) OrderMonth,
SUM(OrderQuantity) TotalQuantity

from Sales

group by
YEAR(OrderDate),
MONTH(OrderDate)
)

select *
from
(
select *,
ROW_NUMBER() over(
partition by OrderYear
order by TotalQuantity DESC
) RN

from MonthlySales
)t

where RN=1;