package com.shopcart.mapper;

import com.shopcart.bean.ShopCart;

import java.util.List;

public interface ShopCartMapper {
    List<ShopCart> getAllShopCart();
    void insertShopCart(ShopCart shopCart);
}
