package com.shopcart.servlet;

import com.shopcart.bean.ShopCart;
import com.shopcart.dao.ShopCartDao;
import com.shopcart.util.GetSqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getAllShopCart")
public class getAllShopCartServlet extends HttpServlet {
    //日志
    private static final Logger LOGGER = LoggerFactory.getLogger(getAllShopCartServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    //获取所有购物车信息
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ShopCart> ShopCartList = null;
        try {
            ShopCartList = ShopCartDao.getAllShopCarts();
        } catch (Exception e) {
            LOGGER.error("获取购物车列表失败失败", e);
            GetSqlSession.rollback();
        } finally {
            GetSqlSession.commit();
        }
        //发送至前台
        request.setAttribute("ShopCartList", ShopCartList);
        //转发至jsp页面
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }
}
