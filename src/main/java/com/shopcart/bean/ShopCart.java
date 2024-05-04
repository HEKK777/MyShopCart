package com.shopcart.bean;

public class ShopCart {
    //商品id
    private int product_id;
    //商品名称
    private String product_name;
    //商品价格
    private double product_price;
    //商品数量
    private int product_quantity;

    //构造方法
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    @Override
    public String toString() {
        return "ShopCart{" +
                "product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", product_price=" + product_price +
                ", product_quantity=" + product_quantity +
                '}';
    }
}

