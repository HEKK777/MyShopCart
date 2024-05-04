package com.shopcart.bean;

public class Product {
    //商品id
    private int id;
    //商品名称
    private String name;
    //商品价格
    private double price;
    //商品图片
    private String image;

    //构造方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name='" + name + '\'' + ", price=" + price + ", image='" + image + '\'' + '}';
    }
}
