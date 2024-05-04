package com.shopcart.mapper;

import com.shopcart.bean.Product;

import java.util.List;

public interface ProductMapper {
    //获取所有商品
    List<Product> getAllProducts();
}
