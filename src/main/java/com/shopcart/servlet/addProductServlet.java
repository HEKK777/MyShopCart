package com.shopcart.servlet;

import com.shopcart.bean.Product;
import com.shopcart.dao.ProductDao;
import com.shopcart.util.GetSqlSession;
import com.shopcart.util.GetSqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addProduct")
public class addProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        //日志对象
        final Logger LOGGER = LoggerFactory.getLogger(GetSqlSessionFactory.class);
        //获取新增商品信息
        String productName = request.getParameter("Name");
        double productPrice = Double.parseDouble(request.getParameter("Price"));
        String productImage = request.getParameter("Image");

        //商品对象
        Product product = new Product();
        product.setName(productName);
        product.setPrice(productPrice);
        product.setImage(productImage);

        //添加到数据库
        try {
            ProductDao.addProduct(product);
            LOGGER.info("添加商品成功");
        } catch (Exception e) {
            GetSqlSession.rollback();
            LOGGER.error("添加商品失败", e);
        } finally {
            GetSqlSession.commit();
        }
        //重定向到首页
        response.sendRedirect("/getAllProducts");
    }

}
