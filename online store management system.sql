CREATE DATABASE Shafi_Organic_Skincare_Store;
USE Shafi_Organic_Skincare_Store;

-- Customers Table
CREATE TABLE  Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE  Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    total_amount DECIMAL(10,2),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY(order_id) REFERENCES Orders(order_id)
);
INSERT INTO Customers (first_name, last_name, email, phone, address, city, state, country, postal_code) VALUES
('Aarav','Sharma','aarav.sharma@email.com','9876543210','12 Green Street','Chennai','Tamil Nadu','India','600001'),
('Diya','Patel','diya.patel@email.com','9876543211','45 Rose Avenue','Mumbai','Maharashtra','India','400001'),
('Rohan','Kumar','rohan.kumar@email.com','9876543212','78 Blue Lane','Delhi','Delhi','India','110001'),
('Ananya','Singh','ananya.singh@email.com','9876543213','23 Red Street','Bengaluru','Karnataka','India','560001'),
('Ishaan','Gupta','ishaan.gupta@email.com','9876543214','56 Yellow Road','Hyderabad','Telangana','India','500001'),
('Sanya','Mehta','sanya.mehta@email.com','9876543215','34 White Street','Pune','Maharashtra','India','411001'),
('Karan','Reddy','karan.reddy@email.com','9876543216','89 Orange Avenue','Chennai','Tamil Nadu','India','600002'),
('Tara','Joshi','tara.joshi@email.com','9876543217','12 Violet Street','Mumbai','Maharashtra','India','400002'),
('Vivaan','Chopra','vivaan.chopra@email.com','9876543218','67 Pink Lane','Delhi','Delhi','India','110002'),
('Meera','Shah','meera.shah@email.com','9876543219','90 Green Avenue','Bengaluru','Karnataka','India','560002'),
('Aditya','Rao','aditya.rao@email.com','9876543220','21 Maple Street','Kolkata','West Bengal','India','700001'),
('Nisha','Verma','nisha.verma@email.com','9876543221','33 Pine Avenue','Chennai','Tamil Nadu','India','600003'),
('Kabir','Malik','kabir.malik@email.com','9876543222','44 Cedar Road','Mumbai','Maharashtra','India','400003'),
('Priya','Kapoor','priya.kapoor@email.com','9876543223','55 Birch Lane','Delhi','Delhi','India','110003'),
('Arjun','Singh','arjun.singh@email.com','9876543224','66 Elm Street','Bengaluru','Karnataka','India','560003'),
('Sara','Gupta','sara.gupta@email.com','9876543225','77 Oak Avenue','Hyderabad','Telangana','India','500002'),
('Dev','Shah','dev.shah@email.com','9876543226','88 Spruce Road','Pune','Maharashtra','India','411002'),
('Rhea','Chatterjee','rhea.chatterjee@email.com','9876543227','99 Willow Lane','Chennai','Tamil Nadu','India','600004'),
('Ankit','Patel','ankit.patel@email.com','9876543228','12 Magnolia Street','Mumbai','Maharashtra','India','400004'),
('Kiara','Reddy','kiara.reddy@email.com','9876543229','23 Jasmine Avenue','Delhi','Delhi','India','110004'),
('Neil','Mehta','neil.mehta@email.com','9876543230','34 Tulip Road','Bengaluru','Karnataka','India','560004'),
('Alisha','Singh','alisha.singh@email.com','9876543231','45 Lily Lane','Hyderabad','Telangana','India','500003'),
('Sahil','Gupta','sahil.gupta@email.com','9876543232','56 Orchid Street','Pune','Maharashtra','India','411003'),
('Tanya','Shah','tanya.shah@email.com','9876543233','67 Rosewood Avenue','Chennai','Tamil Nadu','India','600005'),
('Ishan','Rao','ishan.rao@email.com','9876543234','78 Cedar Lane','Mumbai','Maharashtra','India','400005'),
('Mira','Kapoor','mira.kapoor@email.com','9876543235','89 Pine Street','Delhi','Delhi','India','110005'),
('Reyansh','Singh','reyansh.singh@email.com','9876543236','90 Maple Road','Bengaluru','Karnataka','India','560005'),
('Aanya','Gupta','aanya.gupta@email.com','9876543237','21 Oak Lane','Hyderabad','Telangana','India','500004'),
('Kabir','Shah','kabir.shah@email.com','9876543238','32 Elm Street','Pune','Maharashtra','India','411004'),
('Tara','Reddy','tara.reddy@email.com','9876543239','43 Spruce Avenue','Chennai','Tamil Nadu','India','600006');

INSERT INTO Products (name, description, price, stock_quantity, category) VALUES
('Aloe Vera Face Cream','Hydrating aloe vera face cream',499.00,100,'Face Care'),
('Vitamin C Serum','Brightening serum with vitamin C',699.00,150,'Face Care'),
('Herbal Shampoo','Natural herbal shampoo for hair',299.00,200,'Hair Care'),
('Lavender Body Lotion','Soothing lavender body lotion',399.00,180,'Body Care'),
('Tea Tree Face Wash','Anti-acne face wash with tea tree',249.00,150,'Face Care'),
('Rose Water Toner','Refreshing rose water toner',199.00,120,'Face Care'),
('Charcoal Face Mask','Detoxifying charcoal face mask',349.00,100,'Face Care'),
('Sandalwood Soap','Natural sandalwood soap bar',149.00,250,'Body Care'),
('Coconut Hair Oil','Nourishing coconut hair oil',399.00,200,'Hair Care'),
('Neem Face Scrub','Exfoliating neem face scrub',299.00,150,'Face Care'),
('Honey Lip Balm','Moisturizing honey lip balm',99.00,300,'Lip Care'),
('Shea Butter Cream','Rich moisturizing cream',449.00,100,'Body Care'),
('Almond Body Scrub','Exfoliating almond body scrub',399.00,120,'Body Care'),
('Aloe Vera Gel','Soothing aloe vera gel',299.00,150,'Face Care'),
('Cucumber Eye Gel','Refreshing eye gel',199.00,100,'Face Care'),
('Lavender Bath Salt','Relaxing bath salts',349.00,80,'Body Care'),
('Neem Hair Oil','Anti-dandruff hair oil',399.00,200,'Hair Care'),
('Green Tea Face Mask','Brightening green tea mask',349.00,100,'Face Care'),
('Argan Hair Serum','Repairing hair serum',499.00,150,'Hair Care'),
('Rose Body Mist','Refreshing body mist',249.00,180,'Body Care'),
('Sandalwood Face Pack','Cooling face pack',349.00,100,'Face Care'),
('Cocoa Butter Cream','Moisturizing body cream',399.00,120,'Body Care'),
('Aloe Lip Scrub','Gentle lip scrub',149.00,200,'Lip Care'),
('Vitamin E Face Oil','Nourishing face oil',499.00,100,'Face Care'),
('Rose Face Cream','Hydrating rose face cream',449.00,120,'Face Care'),
('Herbal Hair Mask','Strengthening hair mask',399.00,150,'Hair Care'),
('Neem Soap','Natural neem soap',149.00,250,'Body Care'),
('Coconut Body Lotion','Moisturizing body lotion',399.00,180,'Body Care'),
('Honey Face Wash','Gentle honey face wash',249.00,150,'Face Care'),
('Aloe Hair Mask','Nourishing aloe hair mask',399.00,120,'Hair Care'),
('Lavender Face Mist','Refreshing face mist',199.00,100,'Face Care');

INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1,'2025-12-01 10:30:00','Delivered',1198.00),
(2,'2025-12-02 11:00:00','Pending',948.00),
(3,'2025-12-03 14:15:00','Delivered',549.00),
(4,'2025-12-04 09:45:00','Cancelled',699.00),
(5,'2025-12-05 13:20:00','Delivered',798.00),
(6,'2025-12-06 16:00:00','Delivered',649.00),
(7,'2025-12-07 12:30:00','Pending',499.00),
(8,'2025-12-08 14:50:00','Delivered',1098.00),
(9,'2025-12-09 10:15:00','Delivered',399.00),
(10,'2025-12-10 15:45:00','Cancelled',599.00),
(11,'2025-12-11 11:20:00','Delivered',899.00),
(12,'2025-12-12 13:10:00','Pending',499.00),
(13,'2025-12-13 10:30:00','Delivered',799.00),
(14,'2025-12-14 12:45:00','Delivered',699.00),
(15,'2025-12-15 09:50:00','Pending',549.00),
(16,'2025-12-16 14:30:00','Delivered',1198.00),
(17,'2025-12-17 16:20:00','Delivered',899.00),
(18,'2025-12-18 11:10:00','Cancelled',499.00),
(19,'2025-12-19 13:30:00','Delivered',649.00),
(20,'2025-12-20 15:40:00','Pending',799.00),
(21,'2025-12-21 10:50:00','Delivered',549.00),
(22,'2025-12-22 12:10:00','Delivered',1098.00),
(23,'2025-12-23 14:00:00','Cancelled',399.00),
(24,'2025-12-24 16:30:00','Delivered',699.00),
(25,'2025-12-25 11:40:00','Pending',798.00),
(26,'2025-12-26 13:50:00','Delivered',649.00),
(27,'2025-12-27 15:10:00','Delivered',499.00),
(28,'2025-12-28 10:30:00','Cancelled',1098.00),
(29,'2025-12-29 12:20:00','Delivered',399.00),
(30,'2025-12-30 14:40:00','Delivered',599.00);

INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES
(1,1,1,499.00),
(1,2,1,699.00),
(2,3,2,598.00),
(2,5,1,350.00),
(3,4,1,549.00),
(4,2,1,699.00),
(5,1,2,998.00),
(6,6,1,199.00),
(6,7,1,450.00),
(7,8,1,499.00),
(8,9,2,798.00),
(9,10,1,399.00),
(10,11,2,598.00),
(11,12,2,898.00),
(12,13,1,499.00),
(13,14,1,799.00),
(14,15,1,699.00),
(15,16,1,549.00),
(16,1,1,499.00),
(16,2,1,699.00),
(17,3,1,499.00),
(18,4,1,499.00),
(19,5,1,649.00),
(20,6,2,799.00),
(21,7,1,549.00),
(22,8,2,1098.00),
(23,9,1,399.00),
(24,10,1,699.00),
(25,1,1,499.00),
(26,2,1,649.00),
(27,3,1,499.00),
(28,4,2,1098.00),
(29,5,1,399.00),
(30,6,1,599.00);

INSERT INTO Payments (order_id, payment_date, amount, payment_method, status) VALUES
(1,'2025-12-01 11:00:00',1198.00,'Credit Card','Completed'),
(2,'2025-12-02 11:30:00',948.00,'UPI','Pending'),
(3,'2025-12-03 15:00:00',549.00,'Debit Card','Completed'),
(4,'2025-12-04 10:00:00',699.00,'Net Banking','Cancelled'),
(5,'2025-12-05 14:00:00',798.00,'Cash on Delivery','Completed'),
(6,'2025-12-06 16:30:00',649.00,'Credit Card','Completed'),
(7,'2025-12-07 13:00:00',499.00,'UPI','Pending'),
(8,'2025-12-08 15:20:00',1098.00,'Debit Card','Completed'),
(9,'2025-12-09 10:45:00',399.00,'Net Banking','Completed'),
(10,'2025-12-10 16:10:00',599.00,'Cash on Delivery','Cancelled'),
(11,'2025-12-11 12:00:00',899.00,'Credit Card','Completed'),
(12,'2025-12-12 13:40:00',499.00,'UPI','Pending'),
(13,'2025-12-13 11:00:00',799.00,'Debit Card','Completed'),
(14,'2025-12-14 13:15:00',699.00,'Net Banking','Completed'),
(15,'2025-12-15 10:00:00',549.00,'Cash on Delivery','Pending'),
(16,'2025-12-16 14:50:00',1198.00,'Credit Card','Completed'),
(17,'2025-12-17 16:40:00',899.00,'UPI','Completed'),
(18,'2025-12-18 11:30:00',499.00,'Debit Card','Cancelled'),
(19,'2025-12-19 14:00:00',649.00,'Net Banking','Completed'),
(20,'2025-12-20 16:20:00',799.00,'Cash on Delivery','Pending'),
(21,'2025-12-21 11:10:00',549.00,'Credit Card','Completed'),
(22,'2025-12-22 12:40:00',1098.00,'UPI','Completed'),
(23,'2025-12-23 14:20:00',399.00,'Debit Card','Cancelled'),
(24,'2025-12-24 16:50:00',699.00,'Net Banking','Completed'),
(25,'2025-12-25 12:10:00',798.00,'Cash on Delivery','Pending'),
(26,'2025-12-26 14:30:00',649.00,'Credit Card','Completed'),
(27,'2025-12-27 15:50:00',499.00,'UPI','Completed'),
(28,'2025-12-28 11:20:00',1098.00,'Debit Card','Cancelled'),
(29,'2025-12-29 12:50:00',399.00,'Net Banking','Completed'),
(30,'2025-12-30 15:10:00',599.00,'Cash on Delivery','Completed');

-- Query

-- list all customers.

select * from customers;

-- display all products priced above 400.

select name, price from products where price > 400;


-- retrieve all orders with status “pending”.

select * from orders where status='pending';

--  show all completed payments.

select * from payments where status='completed';

-- list all products in the “face care” category.

select name, category from products where category='face care';

-- show each customer’s name along with their orders and total amount.

select c.first_name, c.last_name, o.order_id, o.total_amount, o.status
from customers c
join orders o on c.customer_id = o.customer_id;


-- show all order details including product name, quantity, and price.

select o.order_id, p.name, od.quantity, od.price
from orderdetails od
join products p on od.product_id = p.product_id
join orders o on od.order_id = o.order_id;

-- show all payments along with the customer name and payment status.

select c.first_name, c.last_name, p.amount, p.payment_method, p.status
from payments p
join orders o on p.order_id = o.order_id
join customers c on o.customer_id = c.customer_id;

-- calculate the total amount spent by each customer.

select c.first_name, c.last_name, sum(o.total_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id;


-- show each product and the total quantity sold.

select p.name, sum(od.quantity) as total_quantity
from orderdetails od
join products p on od.product_id = p.product_id
group by p.product_id;

-- find the total revenue from all completed payments.

select sum(amount) as total_revenue
from payments
where status='completed';

-- calculate the average order amount.

select avg(total_amount) as avg_order
from orders;


-- count the number of customers in each city.

select city, count(*) as total_customers
from customers
group by city;

-- find the maximum and minimum product price.

select max(price) as max_price, min(price) as min_price
from products;


-- count the number of orders for each status.

select status, count(*) as total_orders
from orders
group by status;

-- for each order, calculate the total number of items purchased.

select o.order_id, sum(od.quantity) as total_items
from orders o
join orderdetails od on o.order_id = od.order_id
group by o.order_id;


-- find customers who have not placed any orders.

select * from customers 
where customer_id not in (select customer_id from orders);


-- list the top 5 most expensive products.

select name, price 
from products
order by price desc
limit 5;


-- show the total revenue generated per day.

select date(payment_date) as payment_day, sum(amount) as daily_revenue
from payments
where status='completed'
group by date(payment_date)
order by payment_day;


-- list customers who have placed more than one order.

select customer_id, count(order_id) as orders_count
from orders
group by customer_id
order by orders_count desc;

-- update the stock quantity after a sale for a specific order (order_id = 1).

select p.product_id, p.name, p.stock_quantity
from products p
join orderdetails od on p.product_id = od.product_id
where od.order_id = 1;

-- change the status of a specific order (order_id = 2) to “delivered”.

select order_id, customer_id, status, total_amount
from orders
where order_id = 2;

-- delete related payments first
delete from payments
where order_id in (select order_id from orders where status='Cancelled');


-- insert a new product into the products table.

insert into products (name, description, price, stock_quantity, category)
values ('saffron face cream','luxury face cream with saffron',799.00,50,'face care');


-- insert a new customer into the customers table.

insert into customers (first_name, last_name, email, phone, city, state, country)
values ('riya','verma','riya.verma@email.com','9876543240','jaipur','rajasthan','India');