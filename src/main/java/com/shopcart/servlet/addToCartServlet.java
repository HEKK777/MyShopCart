package com.shopcart.servlet;

import com.shopcart.dao.ShopCartDao;
import com.shopcart.entity.ShopCart;
import com.shopcart.util.GetSqlSession;
import com.shopcart.util.GetSqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addToCart")
public class addToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        //日志对象
        final Logger LOGGER = LoggerFactory.getLogger(GetSqlSessionFactory.class);
        //获取商品信息和价格
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("price"));
        int quantity = 1;

        //购物车对象
        ShopCart shopCart = new ShopCart();
        shopCart.setProduct_id(productId);
        shopCart.setProduct_name(productName);
        shopCart.setProduct_price(productPrice);
        shopCart.setProduct_quantity(quantity);

        //添加到购物车
        try {
            ShopCartDao.insertShopCart(shopCart);
            LOGGER.info("添加到购物车成功！");
        } catch (Exception e) {
            GetSqlSession.rollback();
            LOGGER.error("添加到购物车失败！", e);
        } finally {
            GetSqlSession.commit();
        }

        //重定向到首页
        response.sendRedirect("/getAllProducts");
    }
}
