package com.shopcart.mapper;

import com.shopcart.entity.ShopCart;

import java.util.List;

public interface ShopCartMapper {
    //获取购物车列表
    List<ShopCart> getAllShopCart();

    //添加购物车
    void insertShopCart(ShopCart shopCart);

    //删除商品
    void updateShopCart(int id);
}
