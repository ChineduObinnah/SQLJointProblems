/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select categories.name, products.name
 from categories
 inner join products on categories.CategoryID = products.CategoryID
 where categories.name = "computers";
 
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 select products.name, products.price, reviews.rating
 from products
 inner join reviews on reviews.ProductID = products.ProductID
 where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select employees.FirstName, Sum(sales.Quantity)
from employees
inner join sales on employees.EmployeeID = sales.EmployeeID
group by employees.FirstName
order by Sum(sales.quantity) desc
limit 5;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name,categories.Name
from departments
inner join categories on departments.DepartmentID = categories.DepartmentID
where categories.Name =  "Appliances" or categories.name= "Games";


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, sum(sales.Quantity), sum(sales.PricePerUnit*sales.Quantity)
from products
inner join sales on products.ProductID = sales.ProductID
where products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select p.Name, r.Reviewer, r.Rating, r.Comment from reviews as r
inner join products as p
on r.ProductID =p.ProductID
where p.Name like "%Visio%" and r.Rating =1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select e.EmployeeID, e.FirstName, e.LastName,
 p.Name as "Product", s.Quantity as "Quantity Sold" 
 from sales as s
 inner join employees as e
 on s.EmployeeID = e.EmployeeID
 inner join products as p
 on s.ProductID = p.ProductID; 

