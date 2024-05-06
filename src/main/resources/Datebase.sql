create schema shopcart;

use shopcart;

create table Product (
    id int primary key auto_increment,
    name varchar(255),
    price decimal(10,2),
    image varchar(255)
);

#插入初始数据
insert into Product (name, price, image) values ('白板笔',3,'PIC/白板笔.jpeg')
insert into Product (name, price, image) values ('胶水',5,'PIC/胶水.jpeg')
insert into Product (name, price, image) values ('川贝枇杷糖浆',23.15,'PIC/川贝枇杷糖浆.jpeg')
insert into Product (name, price, image) values ('充电宝',46,'PIC/充电宝.jpeg')
insert into Product (name, price, image) values ('空气净化器',599,'PIC/空气净化器.jpeg')
insert into Product (name, price, image) values ('碗',16,'PIC/碗.jpeg')
insert into Product (name, price, image) values ('剪刀',9.9,'PIC/剪刀.jpeg')

create table ShopCartList (
    product_id int primary key,
    product_name varchar(255),
    product_price decimal(10,2),
    product_quantity int
);

#测试
insert into ShopCartList (product_id, product_name, product_price, product_quantity) values (4, '充电宝', 46, 1) on duplicate key update product_quantity = product_quantity + 1;
#测试
update shopcartlist set product_quantity = case when product_quantity > 0 then product_quantity - 1 else 0 end where product_id = 4;
delete from ShopCartList where product_id = 4 and product_quantity = 0;


select * from product
select * from ShopCartList
