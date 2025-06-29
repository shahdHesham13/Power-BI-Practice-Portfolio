CREATE VIEW vw_FactOrderDetails AS
SELECT od.SalesOrderID AS OrderID
      ,od.SalesOrderDetailID AS OrderDetailID 
      ,od.ProductID
      ,od.OrderQty
      ,od.UnitPrice 
      ,od.LineTotal 

	  ,CAST(o.OrderDate AS DATE) OrderDate
      ,CAST(o.DueDate   AS DATE) DueDate
      ,CAST(o.ShipDate  AS DATE) ShipDate

      ,o.[Status] StatusID
      ,o.OnlineOrderFlag
      ,o.CustomerID
      ,o.SalesPersonID
      ,o.TerritoryID 
      ,o.ShipMethodID 
       
      ,(CAST(od.LineTotal AS DECIMAL(18,5)) / o.SubTotal) * o.TaxAmt AS TaxAmt
      ,(CAST(od.LineTotal AS DECIMAL(18,5)) / o.SubTotal) * o.Freight AS Freight
      ,(CAST(od.LineTotal AS DECIMAL(18,5)) / o.SubTotal) * o.TotalDue AS TotalDue 
FROM Sales.SalesOrderDetail od
LEFT JOIN Sales.SalesOrderHeader o ON o.SalesOrderID = od.SalesOrderID