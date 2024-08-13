with forecast_error_table as(
select
*,
    SUM(forecast_quantity - sold_quantity) AS net_error,
    SUM((forecast_quantity - sold_quantity) * 100) / SUM(forecast_quantity) AS net_error_pct,
    SUM(ABS(forecast_quantity - sold_quantity)) AS abs_error,
    SUM(ABS(forecast_quantity - sold_quantity)) * 100 / SUM(forecast_quantity) AS abs_error_pct
from fact_act_est f
where f.fiscalyear=2021
group by customer_code
order by abs_error_pct desc)
select 
e.* ,
c.customer,
c.customer_code,
c.market,
if(abs_error_pct>100,0,(100-abs_error_pct)) as forecast_accuracy
from forecast_error_table e 
join dim_customer c
using (customer_code)
order by forecast_accuracy desc;


SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));