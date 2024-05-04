package com.shopcart.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;

public class GetSqlSessionFactory {

    //日志对象
    private static final Logger LOGGER = LoggerFactory.getLogger(GetSqlSessionFactory.class);

    //SqlSessionFactory 实例
    private static SqlSessionFactory sqlSessionFactory;

    //构造方法私有化
    private GetSqlSessionFactory() {

    }

    //获取SqlSessionFactory实例
    synchronized public static SqlSessionFactory getSqlSessionFactory() {
        if (sqlSessionFactory == null) {
            //获取资源文件流
            String resource = "mybatis-config.xml";
            InputStream inputStream = null;
            try {
                inputStream = Resources.getResourceAsStream(resource);
            } catch (IOException e) {
                LOGGER.error("获取资源时发生错误:", e);
            }
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        }
        return sqlSessionFactory;
    }
}
