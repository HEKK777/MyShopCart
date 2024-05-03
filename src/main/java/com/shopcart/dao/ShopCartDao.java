package com.shopcart.dao;

import com.shopcart.bean.ShopCart;
import com.shopcart.mapper.ShopCartMapper;
import com.shopcart.util.GetSqlSession;
import com.shopcart.util.GetSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ShopCartDao {
    public static List<ShopCart> getAllShopCarts(){
        SqlSessionFactory factory = GetSqlSessionFactory.getSqlSessionFactory();
        SqlSession session = factory.openSession();
        ShopCartMapper mapper = session.getMapper(ShopCartMapper.class);
        List<ShopCart> shopCarts = mapper.getAllShopCart();
        session.close();
        return shopCarts;
    }

    public static void insertShopCart(ShopCart shopCart) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        sqlSession.insert("com.shopcart.mapper.ShopCartMapper.insertShopCart", shopCart);
        sqlSession.commit();
    }
}

