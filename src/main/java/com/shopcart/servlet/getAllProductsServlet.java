package com.shopcart.servlet;

import com.shopcart.bean.Product;
import com.shopcart.dao.ProductDao;
import com.shopcart.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "getAllProducts",value = "/getAllProducts",loadOnStartup = 1)
public class getAllProductsServlet extends HttpServlet {
    private static final Logger LOGGER = LoggerFactory.getLogger(getAllProductsServlet.class);


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = null;
        try {
            list = ProductDao.getAllProducts();
        }catch (Exception e) {
            LOGGER.error("获取产品信息失败", e);
            GetSqlSession.rollback();
        }finally {
            GetSqlSession.commit();
        }
        System.out.println(list);
        //发送至前台
        request.setAttribute("lists",list);
        //转发至jsp页面
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
