package com.shopcart.dao;

import com.shopcart.bean.Product;
import com.shopcart.mapper.ProductMapper;
import com.shopcart.util.GetSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ProductDao {
    public static List<Product> getAllProducts() {
        SqlSessionFactory factory = GetSqlSessionFactory.getSqlSessionFactory();
        SqlSession session = factory.openSession();
        ProductMapper mapper = session.getMapper(ProductMapper.class);
        List<Product> Products = mapper.getAllProducts();
        session.close();
        return Products;
    }
}
