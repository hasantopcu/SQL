use salestransaction;
select   pii.ProductName , pii.ProductCategoryName ,di.CalendarYear , di.CalendarQuarter, di.MonthName , di.DayName ,  Quantity , fct.SalesAmount , fct.Cost , sp.StoreGeographyID ,ct.name as City , ct.id as CityCode
from
(
 (
  ( 
   (
	( dbo.FactSalesOrders as fct  left join dbo.DateInfo as di on fct.OrderDateID = di.DateKey)
		left join dbo.CustomerInfo as cs on fct.CustomerID = cs.CustomerID)
		  left join dbo.SalespersonInfo as sp on fct.SalesPersonID = sp.SalespersonID)
		    left join dbo.ProductInfo as pii on fct.ProductID = pii.ProductID)
			  left join dbo.cities as ct on cs.CustomerGeographyID = ct.id );


