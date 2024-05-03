create schema shopcart

use shopcart;

create Table Product (
    id int primary key auto_increment,
    name varchar(255),
    price decimal(10,2),
    image varchar(255)
)

insert into Product (name, price, image) values ('白板笔',3,'PIC/白板笔.jpeg')
insert into Product (name, price, image) values ('胶水',5,'PIC/胶水.jpeg')
insert into Product (name, price, image) values ('川贝枇杷糖浆',23.15,'PIC/川贝枇杷糖浆.jpeg')
insert into Product (name, price, image) values ('充电宝',46,'PIC/充电宝.jpeg')
insert into Product (name, price, image) values ('空气净化器',599,'PIC/空气净化器.jpeg')
insert into Product (name, price, image) values ('碗',16,'PIC/碗.jpeg')
insert into Product (name, price, image) values ('剪刀',9.9,'PIC/剪刀.jpeg')

create table ShopCartList (
    id int primary key auto_increment,
    product_name varchar(255),
    product_price decimal(10,2)
)

select * from product
select * from ShopCartList
