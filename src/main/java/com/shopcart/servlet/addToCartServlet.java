package com.shopcart.servlet;

import com.shopcart.bean.ShopCart;
import com.shopcart.dao.ShopCartDao;
import com.shopcart.util.GetSqlSession;
import com.shopcart.util.GetSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addToCart")
public class addToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        final Logger LOGGER = LoggerFactory.getLogger(GetSqlSessionFactory.class);
        //获取商品信息和价格
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("price"));

        ShopCart shopCart = new ShopCart();
        shopCart.setProduct_name(productName);
        shopCart.setProduct_price(productPrice);

        try {
            ShopCartDao.insertShopCart(shopCart);
            System.out.println("添加到购物车成功！");
        } catch (Exception e) {
            GetSqlSession.rollback();
            LOGGER.error("添加到购物车失败！", e);
        } finally {
            GetSqlSession.commit();
        }
    }
}
