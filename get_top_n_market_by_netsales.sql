CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_n_market_by_netsales`(
in_fiscal_year int,
in_top_n INT
)
BEGIN
select
market,
round(sum(net_sales)/1000000,2) as net_sales_mln
from gdb0041.net_sales
where in_fiscal_year=in_fiscal_year
group by market
order by net_sales_mln desc
limit in_top_n;
END