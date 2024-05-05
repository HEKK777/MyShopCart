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

@WebServlet("/editProduct")
public class editProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        final Logger LOGGER = LoggerFactory.getLogger(removeFromCartServlet.class);
        //获取要编辑的商品id
        int id = Integer.parseInt(request.getParameter("id"));
        //获取编辑完成的商品名称
        String name = request.getParameter("name");
        //获取要编辑完成的商品价格
        double price = Double.parseDouble(request.getParameter("price"));
        //获取编辑完成的商品图片
        String image = request.getParameter("image");

        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setPrice(price);
        product.setImage(image);

        try {
            ProductDao.updateProduct(product);
            System.out.println("编辑商品成功！");
        } catch (Exception e) {
            GetSqlSession.rollback();
            LOGGER.error("编辑商品失败！", e);
        } finally {
            GetSqlSession.commit();
        }
        response.sendRedirect("/getAllProducts");
    }
}
