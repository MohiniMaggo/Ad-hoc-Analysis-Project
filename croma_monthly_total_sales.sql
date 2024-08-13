-- TASK 2
-- Gross monthly sales for croma
-- with parameters
-- Month, Total gross sales amount to croma in this monthly

select 
s.date,
sum(g.gross_price*s.sold_quantity) as total_gross_price
from 
fact_sales_monthly s
join fact_gross_price g
on s.product_code=g.product_code and
   g.fiscal_year=get_fiscal_year(s.date)
where customer_code=90002002
group by date
order by date asc
limit 10000