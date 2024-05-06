package com.shopcart.servlet;

import com.shopcart.dao.ShopCartDao;
import com.shopcart.util.GetSqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/removeFromCart")
public class removeFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        final Logger LOGGER = LoggerFactory.getLogger(removeFromCartServlet.class);
        //获取要删除的商品id
        int id = Integer.parseInt(request.getParameter("product_id"));

        try {
            ShopCartDao.updateShopCart(id);
            LOGGER.info("删除成功");
        } catch (Exception e) {
            GetSqlSession.rollback();
            LOGGER.error("删除失败", e);
        } finally {
            GetSqlSession.commit();
        }
        response.sendRedirect("/getAllShopCart");
    }
}
