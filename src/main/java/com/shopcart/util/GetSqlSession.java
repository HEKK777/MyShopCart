package com.shopcart.util;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GetSqlSession {

    private static final Logger LOGGER = LoggerFactory.getLogger(GetSqlSession.class);

    private static final ThreadLocal<SqlSession> tl = new ThreadLocal<>();

    /**
     * 获取SqlSession
     * @return sqlSession
     */
    public static SqlSession getSqlSession(){
        SqlSession sqlSession = tl.get();
        if (sqlSession == null){
            sqlSession = GetSqlSessionFactory.getSqlSessionFactory().openSession();
            tl.set(sqlSession);
        }
        LOGGER.info("获取SqlSession {}." , sqlSession.hashCode());
        return sqlSession;
    }

    public static void commit(){
        if (tl.get() != null){
            tl.get().commit();
            tl.get().close();
            tl.set(null);
            LOGGER.info("提交事务");
        }
    }

    public static void rollback(){
        if (tl.get() != null){
            tl.get().rollback();
            tl.get().close();
            tl.set(null);
            LOGGER.info("回滚事务");
        }
    }

}