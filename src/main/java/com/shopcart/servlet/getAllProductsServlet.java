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
import java.util.List;

@WebServlet(name = "getAllProducts", value = "/getAllProducts", loadOnStartup = 1)
public class getAllProductsServlet extends HttpServlet {
    //日志记录器
    private static final Logger LOGGER = LoggerFactory.getLogger(getAllProductsServlet.class);
    //产品列表
    List<Product> list = null;

    //初始化方法获取产品列表
    @Override
    public void init() {
        try {
            list = ProductDao.getAllProducts();
        } catch (Exception e) {
            LOGGER.error("获取产品信息失败", e);
            GetSqlSession.rollback();
        } finally {
            GetSqlSession.commit();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    //处理get请求
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //发送至前台
        request.setAttribute("lists", list);
        //转发至jsp页面
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
