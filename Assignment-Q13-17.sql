--display empname,terriroty name,group,saleslastyear salesquota,bonus
use AdventureWorks2022;
select * from Sales.SalesPerson
select * from Sales.SalesTerritory
select * from Person.Person

Select(SELECT CONCAT_ws(' ',firstname,lastname) FROM Person.Person p 
       	 where p.BusinessEntityID=ss.BusinessEntityID) fullname,
	   (select [Group] from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) grp,
	   (select SalesLastYear from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID),
	   (select SalesQuota from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID),
	   (select Bonus from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) bonus
	   from Sales.SalesPerson ss;

--display empname,terriroty name,group,saleslastyear salesquota,bonus from Germeny and UK
Select(SELECT CONCAT_ws(' ',firstname,lastname) FROM Person.Person p 
       	 where p.BusinessEntityID=ss.BusinessEntityID) empname,
	   (select  [Group] from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) grp,
	   (select Name from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) cname,
	   (select SalesLastYear from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) slast,
	   (select SalesQuota from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) squota,
	   (select Bonus from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) bonus
FROM Sales.SalesPerson ss
WHERE ss.TerritoryID IN 
(SELECT TerritoryID 
FROM Sales.SalesTerritory 
WHERE Name IN ('Germany', 'United Kingdom'));

--find all employees who worked in all North America territory
Select(SELECT CONCAT_ws(' ',firstname,lastname) FROM Person.Person p 
       	 where p.BusinessEntityID=ss.BusinessEntityID) empname,
	   (select  [Group] from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) grp,
	   (select Name from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) cname,
	   (select SalesLastYear from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) slast,
	   (select SalesQuota from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) squota,
	   (select Bonus from Sales.SalesTerritory st
	   where st.TerritoryID=ss.TerritoryID) bonus
FROM Sales.SalesPerson ss
WHERE ss.TerritoryID IN 
(SELECT TerritoryID 
FROM Sales.SalesTerritory 
WHERE [Group] = 'North America');

--find the product detail in cart
select * from Sales.ShoppingCartItem
select *from Production.Product

select * from Production.Product
where ProductID in
(select ProductID
from Sales.ShoppingCartItem);

--find the product with special offer
select * from Sales.SpecialOffer;
select * from Sales.SpecialOfferProduct;
select * from Production.Product


select
p.productid,
p.name as prodname,
sop.specialofferid
from production.product p,
Sales.SpecialOfferProduct sop
where p.ProductID = sop.ProductID;

select (select FirstName from Person.Person p where p.BusinessEntityID=pcc.BusinessEntityID)fname,
(select CardNumber from Sales.CreditCard cc where cc.CreditCardID=pcc.CreditCardID)cno,
(select ExpMonth from Sales.CreditCard cc where cc.CreditCardID=pcc.CreditCardID)expm,
(select ExpYear from Sales.CreditCard cc where cc.CreditCardID=pcc.CreditCardID)expy
from Sales.PersonCreditCard pcc 
where pcc.CreditCardID in (select CreditCardID from sales.CreditCard crd where ExpMonth = 11 and ExpYear =2008)