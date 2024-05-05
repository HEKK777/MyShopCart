package com.shopcart.servlet;

import com.shopcart.bean.Product;
import com.shopcart.dao.ProductDao;
import com.shopcart.util.GetSqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getProductById")
public class getProductByIdServlet extends HttpServlet {
    //日志记录器
    private static final Logger LOGGER = LoggerFactory.getLogger(getProductByIdServlet.class);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Product product = null;
        int id = Integer.parseInt(request.getParameter("edit_id"));

        try {
            product = ProductDao.getProductById(id);
        } catch (Exception e) {
            LOGGER.error("获取商品信息失败", e);
            GetSqlSession.rollback();
        } finally {
            GetSqlSession.commit();
        }
        System.out.println(product);
        //发送至前台
        request.setAttribute("product", product);
        request.getRequestDispatcher("/getAllProducts").forward(request, response);
    }
}
