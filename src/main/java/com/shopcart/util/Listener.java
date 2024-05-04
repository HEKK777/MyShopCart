package com.shopcart.util;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.DriverManager;

public class Listener implements ServletContextListener {
    // 启动Web服务时，打印日志
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.out.println("Web服务启动");
    }

    // 关闭Web服务时，关闭JDBC驱动和清理线程
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        System.out.println("Web服务关闭");
        try {
            while (DriverManager.getDrivers().hasMoreElements()) {
                DriverManager.deregisterDriver(DriverManager.getDrivers().nextElement());
            }
            System.out.println("关闭JDBC驱动成功");
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("清理线程停止");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
