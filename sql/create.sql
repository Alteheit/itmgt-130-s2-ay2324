create database if not exists digitalcafe;
use digitalcafe; 
drop table if exists order_items;
drop table if exists orders;
drop table if exists customers;
drop table if exists employees;
drop table if exists products;

create table products
(
  id int primary key,
  sku varchar(50),
  name varchar(50),
  description text,
  unit_price numeric
);

create table employees
(id int primary key,
 first_name varchar(50),
 last_name varchar(50),
 hire_date datetime
);


create table customers
(id int primary key,
 first_name varchar(50),
 last_name varchar(50),
 rewards_points numeric,
 registration_date datetime
);

create table orders
(
 id int primary key,
 order_date datetime,
 customer_id int,
 constraint `fk_order_customer`
  foreign key (customer_id) references customers (id)
  on delete cascade
);

create table order_items
(
  id int primary key,
  order_id int,
  product_id int,
  quantity int,
  constraint `fk_order_item_order`
    foreign key (order_id) references orders (id)
    on delete cascade,
  constraint `fk_order_item_product`
    foreign key (product_id) references products (id)
    on delete cascade
);

insert into products
values (1,'AMERICANO','Americano','Diluted Black Coffee (a.k.a. Long Black)',140);

insert into products
values (2,'BREWED','Brewed Coffee','Just Coffee!',100);

insert into products
values (3,'CAPPUCCINO','Cappuccino','Frothy Coffee!',130);

insert into products
values (4,'DALGONA','Dalgona','Lockdown Coffee!',170);

insert into products
values (5,'ESPRESSO','Espresso','Strong black coffee!',100);

insert into products
values (6,'LATTE','Latte','Milky Coffee!',200);

insert into products
values (7,'MACCHIATO','Macchiato','Foam topped coffee!',190);

# customers

insert into customers
values (1, 'Robin','Padilla',0,'2022-06-01 00:00:00');

insert into customers
values (2, 'Loren','Legarda',0,'2022-06-01 00:00:00');

insert into customers
values (3, 'Raffy','Tulfo',0,'2022-06-01 00:00:00');

insert into customers
values (4, 'Sherwin','Gatchalian',0,'2022-06-01 00:00:00');

insert into customers
values (5, 'Francis','Escudero',0,'2022-06-01 00:00:00');

insert into customers
values (6, 'Mark','Villar',0,'2022-06-01 00:00:00');

insert into customers
values (7, 'Alan Peter','Cayetano',0,'2022-06-01 00:00:00');

insert into customers
values (8, 'Juan Miguel','Zubiri',0,'2022-06-01 00:00:00');

insert into customers
values (9, 'Joel','Villanueva',0,'2022-06-01 00:00:00');

insert into customers
values (10, 'JV','Ejercito',0,'2022-06-01 00:00:00');

insert into customers
values (11, 'Risa','Hontiveros',0,'2022-06-01 00:00:00');

insert into customers
values (12, 'Jinggoy','Estrada',0,'2022-06-01 00:00:00');

# orders
insert into orders
values(1001, '2022-07-01 00:00:00',6);

insert into order_items
values(10001,1001,5,1);

insert into orders
values(1002, '2022-07-01 00:00:00',2);

insert into order_items
values(10002,1002,5,2);

insert into order_items
values(10003,1002,1,1);

insert into orders
values(1003, '2022-07-01 00:00:00',10);

insert into order_items
values(10004,1003,5,2);

insert into order_items
values(10005,1003,2,1);

insert into orders
values(1004, '2022-07-01 00:00:00',6);

insert into order_items
values(10006,1004,5,2);

insert into order_items
values(10007,1004,2,1);

insert into order_items
values(10008,1004,2,1);

insert into orders
values(1005, '2022-07-01 00:00:00',2);

insert into order_items
values(10009,1005,5,1);

insert into order_items
values(10010,1005,2,1);

insert into order_items
values(10011,1005,2,1);

insert into orders
values(1006, '2022-07-02 00:00:00',3);

insert into order_items
values(10012,1006,5,3);

insert into order_items
values(10013,1006,2,3);

insert into orders
values(1007, '2022-07-02 00:00:00',4);

insert into order_items
values(10014,1007,5,2);

insert into order_items
values(10015,1007,1,1);

insert into orders
values(1008, '2022-07-02 00:00:00',11);

insert into order_items
values(10016,1008,1,2);

insert into order_items
values(10017,1008,2,1);

insert into order_items
values(10018,1008,3,1);

insert into order_items
values(10019,1008,4,1);

insert into order_items
values(10020,1008,5,1);

insert into orders
values(1009, '2022-07-03 00:00:00',5);

insert into order_items
values(10021,1009,1,1);

insert into order_items
values(10022,1009,2,1);

insert into order_items
values(10023,1009,4,1);

insert into order_items
values(10024,1009,5,1);

insert into orders
values(1010, '2022-07-03 00:00:00',4);

insert into order_items
values(10025,1010,1,1);

insert into order_items
values(10026,1010,2,1);

insert into order_items
values(10027,1010,4,1);

insert into order_items
values(10028,1010,5,1);

insert into orders
values(1011, '2022-07-03 00:00:00',3);

insert into order_items
values(10029,1011,6,1);

insert into order_items
values(10030,1011,7,1);

insert into order_items
values(10031,1011,1,1);

insert into order_items
values(10032,1011,5,3);

insert into orders
values(1012, '2022-07-04 00:00:00',5);

insert into order_items
values(10033,1012,6,1);

insert into order_items
values(10034,1012,7,1);

insert into order_items
values(10035,1012,1,1);

insert into order_items
values(10036,1012,5,3);

insert into orders
values(1013, '2022-07-04 00:00:00',4);

insert into order_items
values(10037,1013,1,1);

insert into order_items
values(10038,1013,2,1);

insert into order_items
values(10039,1013,3,1);

insert into order_items
values(10040,1013,5,2);

insert into orders
values(1014, '2022-07-04 00:00:00',12);

insert into order_items
values(10041,1014,1,1);

insert into order_items
values(10042,1014,2,1);

insert into order_items
values(10043,1014,3,1);

insert into order_items
values(10044,1014,5,2);

insert into orders
values(1015, '2022-07-05 00:00:00',7);

insert into order_items
values(10045,1015,1,1);

insert into order_items
values(10046,1015,2,1);

insert into order_items
values(10047,1015,3,1);

insert into order_items
values(10048,1015,5,2);

insert into orders
values(1016, '2022-07-05 00:00:00',8);

insert into order_items
values(10049,1016,1,1);

insert into order_items
values(10050,1016,2,1);

insert into order_items
values(10051,1016,3,1);

insert into order_items
values(10052,1016,5,2);

insert into orders
values(1017, '2022-07-05 00:00:00',4);

insert into order_items
values(10053,1017,1,1);

insert into order_items
values(10054,1017,2,1);

insert into order_items
values(10055,1017,3,1);

insert into order_items
values(10056,1017,5,2);

insert into orders
values(1018, '2022-07-06 00:00:00',10);

insert into order_items
values(10057,1018,1,1);

insert into order_items
values(10058,1018,2,1);

insert into order_items
values(10059,1018,3,1);

insert into order_items
values(10060,1018,5,2);

insert into orders
values(1019, '2022-07-06 00:00:00',7);

insert into order_items
values(10061,1019,1,1);

insert into order_items
values(10062,1019,2,1);

insert into order_items
values(10063,1019,3,1);

insert into order_items
values(10064,1019,5,2);

insert into orders
values(1020, '2022-07-06 00:00:00',10);

insert into order_items
values(10065,1020,1,1);

insert into order_items
values(10066,1020,2,1);

insert into order_items
values(10067,1020,3,1);

insert into order_items
values(10068,1020,5,2);

insert into orders
values(1021, '2022-07-07 00:00:00',9);

insert into order_items
values(10069,1021,1,1);

insert into order_items
values(10070,1021,2,1);

insert into order_items
values(10071,1021,3,1);

insert into order_items
values(10072,1021,5,2);

insert into orders
values(1022, '2022-07-07 00:00:00',4);

insert into order_items
values(10073,1022,1,1);

insert into order_items
values(10074,1022,2,1);

insert into order_items
values(10075,1022,3,1);

insert into order_items
values(10076,1022,5,2);

insert into orders
values(1023, '2022-07-07 00:00:00',9);

insert into order_items
values(10077,1023,1,1);

insert into order_items
values(10078,1023,2,1);

insert into order_items
values(10079,1023,3,1);

insert into order_items
values(10080,1023,5,2);

insert into orders
values(1024, '2022-07-08 00:00:00',4);

insert into order_items
values(10081,1024,1,1);

insert into order_items
values(10082,1024,2,1);

insert into order_items
values(10083,1024,3,1);

insert into order_items
values(10084,1024,5,2);

insert into orders
values(1025, '2022-07-08 00:00:00',10);

insert into order_items
values(10085,1025,1,1);

insert into order_items
values(10086,1025,2,1);

insert into order_items
values(10087,1025,3,1);

insert into order_items
values(10088,1025,5,2);

insert into orders
values(1026, '2022-07-08 00:00:00',9);

insert into order_items
values(10089,1026,1,1);

insert into order_items
values(10090,1026,2,1);

insert into order_items
values(10091,1026,3,1);

insert into order_items
values(10092,1026,5,2);

insert into orders
values(1027, '2022-07-09 00:00:00',4);

insert into order_items
values(10093,1027,1,1);

insert into order_items
values(10094,1027,2,1);

insert into order_items
values(10095,1027,3,1);

insert into order_items
values(10096,1027,5,2);

insert into orders
values(1028, '2022-07-09 00:00:00',1);

insert into order_items
values(10097,1028,1,1);

insert into order_items
values(10098,1028,2,1);

insert into order_items
values(10099,1028,3,1);

insert into order_items
values(10100,1028,5,2);




