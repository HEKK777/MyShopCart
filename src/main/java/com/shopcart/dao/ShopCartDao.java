package com.shopcart.dao;

import com.shopcart.entity.ShopCart;
import com.shopcart.mapper.ShopCartMapper;
import com.shopcart.util.GetSqlSession;
import com.shopcart.util.GetSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ShopCartDao {
    //获取所有购物车信息
    public static List<ShopCart> getAllShopCarts() {
        SqlSessionFactory factory = GetSqlSessionFactory.getSqlSessionFactory();
        SqlSession session = factory.openSession();
        ShopCartMapper mapper = session.getMapper(ShopCartMapper.class);
        List<ShopCart> shopCarts = mapper.getAllShopCart();
        session.close();
        return shopCarts;
    }

    //添加至购物车
    public static void insertShopCart(ShopCart shopCart) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        sqlSession.insert("com.shopcart.mapper.ShopCartMapper.insertShopCart", shopCart);
        sqlSession.commit();
    }

    //删除商品
    public static void updateShopCart(int id) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        sqlSession.update("com.shopcart.mapper.ShopCartMapper.updateShopCart", id);
        sqlSession.commit();
    }
}

