package com.shopcart.mapper;

import com.shopcart.entity.Product;

import java.util.List;

public interface ProductMapper {
    //获取所有商品
    List<Product> getAllProducts();

    //添加商品
    void addProduct(Product product);

    //删除商品
    void deleteProduct(int id);

    //查询商品
    Product getProductById(int id);

    //更新商品
    void updateProduct(Product product);
}
