package com.shopcart.dao;

import com.shopcart.entity.Product;
import com.shopcart.mapper.ProductMapper;
import com.shopcart.util.GetSqlSession;
import com.shopcart.util.GetSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ProductDao {
    //获取所有商品
    public static List<Product> getAllProducts() {
        SqlSessionFactory factory = GetSqlSessionFactory.getSqlSessionFactory();
        SqlSession session = factory.openSession();
        ProductMapper mapper = session.getMapper(ProductMapper.class);
        List<Product> Products = mapper.getAllProducts();
        session.close();
        return Products;
    }

    //添加商品
    public static void addProduct(Product product) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        sqlSession.insert("com.shopcart.mapper.ProductMapper.addProduct", product);
        sqlSession.commit();
    }

    //根据id删除商品
    public static void deleteProduct(int id) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        sqlSession.delete("com.shopcart.mapper.ProductMapper.deleteProduct", id);
        sqlSession.commit();
    }

    //根据id查询商品
    public static Product getProductById(int id) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        Product product = sqlSession.selectOne("com.shopcart.mapper.ProductMapper.getProductById", id);
        sqlSession.commit();
        return product;
    }

    //修改商品
    public static void updateProduct(Product product) {
        SqlSession sqlSession = GetSqlSession.getSqlSession();
        sqlSession.update("com.shopcart.mapper.ProductMapper.updateProduct", product);
        sqlSession.commit();
    }
}

