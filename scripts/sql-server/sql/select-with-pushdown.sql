SELECT
  p.ProductID,
  p.Name ProductName,
  p.ProductLine,
  p.SafetyStockLevel, 
  p.SellStartDate,
  p.SellEndDate,
  ((d.OrderQty * d.UnitPrice) * (1.0 - d.UnitPriceDiscount)) TotalSalesAmt
FROM
  dbo.Product_HDFS p
RIGHT JOIN
  Sales.SalesOrderDetail d 
  ON p.ProductID = d.ProductID
WHERE
  p.ProductID > 50
ORDER BY 
  p.ProductID
OPTION (
  FORCE EXTERNALPUSHDOWN
);