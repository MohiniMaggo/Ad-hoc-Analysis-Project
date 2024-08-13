
 -- TASK 1
 -- For Croma India product wise sales report for fiscal year 2021
 -- with parameters
 -- date, product name, varient,sold qty,gross price per item,
 -- total gross price
 
 
 
   select 
   s.date,
   p.product_code,
   p.product,
   p.variant,
   s.sold_quantity,
   g.gross_price,
   ROUND(g.gross_price*s.sold_quantity) as Total_gross_price
from fact_sales_monthly s
join dim_product p
on s.product_code=p.product_code
join fact_gross_price g
on  g.product_code=s.product_code
    AND
    g.fiscal_year=get_fiscal_year(date)
where customer_code =90002002 and 
get_fiscal_year(date)=2021 
limit 10000;
  
