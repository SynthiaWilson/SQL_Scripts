-- Select * from  products;
Select * from products where price = 1400;
Select * from products where price = 11.99 or price = 13.99;
Select * from products where NOT price = 11.99;
Select * from products order by price DESC;
Select * from employees where MiddleInitial is Null;
Select distinct price from products;
-- Select * from employees where FirstName Like "J%";
Select Name from products where Name = "Macbook";
 Select * from products where OnSale = true;
Select ROUND(AVG(price),2) AS 'Average Price'  from products;
Select * from employees where MiddleInitial is Null and Title = "Geek Squad";
------------- Page 2 of exercise ---------------------------------------------
Select * from products Where StockLevel BETWEEN 500 AND 1200 order by price;
--- joins--------------------------------------------------------------------
-- joins: select all the computers from the products table:
 -- using the products table and the categories table, return the product name and the category name


Select products.Name, categories.Name 
from products
JOIN categories on products.CategoryID = categories.CategoryID
WHERE categories.CategoryID=  1;

-- Another way
Select products.Name, categories.Name
from products, categories
 where products.CategoryID= Categories.CategoryID AND categories.CategoryID = 1;

-- joins: find all product names, product prices, and products ratings that have a rating of 5

SELECT products.Name, products.Price, reviews.Rating from products, reviews
where products.productID = reviews.ProductID and rating   = 5;

-- joins: find the employee with the most total quantity sold.  use the sum() function and group by

Select employees.FirstName, employees.LastName , SUM(Quantity)  AS S from sales, employees
WHERE sales.EmployeeID = employees.EmployeeID
 group by employees.EmployeeID order by S DESC LIMIT 1;

-- First try...
-- Select sales.EmployeeID, employees.LastName, Quantity from sales,employees
-- where sales.EmployeeID = employees.EmployeeID  group by Employees.EmployeeID;


-- joins: find the name of the department, and the name of the category for Appliances and Games

select departments.Name, categories.Name from departments, categories
where departments.departmentID = categories.DepartmentID and categoryID = '1' or categoryID = '2';

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
SELECT * from products where Name = "Eagles: Hotel California";

SELECT * from sales;

Select products.Name,  SUM(sales.Quantity), sum((PricePerUnit*Quantity)) from sales, products
WHERE sales.ProductID = products.ProductID AND Name = "Eagles: Hotel California";

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT * FROM reviews;

SELECT Products.Name, Reviewer, Rating, Comment 
FROM Products, Reviews
WHERE Products.ProductID = Reviews.ProductID AND Products.Name = "Visio TV" LIMIT 1;

-- EXTRA
-- Your goal is to write a query that serves as an employee sales report.
-- This query should return the employeeID, the employee's first and last name, the name of each product, 
-- how many of that product they sold */

SELECT EmployeeID from employees  GROUP BY EmployeeID;

SELECT *  FROM sales;

-- SELECT salesID, sales.ProductID, EmployeeID, Quantity
-- SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Quantity
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Quantity, SalesID, products.ProductID, products.Name

from employees
INNER JOIN sales ON sales.EmployeeID = employees.EmployeeID 
  JOIN products ON products.ProductID AND sales.productID
  group by employees.EmployeeID, products.ProductID;
  
 -- JOIN employees ON sales.EmployeeID = employees.EmployeeID;

