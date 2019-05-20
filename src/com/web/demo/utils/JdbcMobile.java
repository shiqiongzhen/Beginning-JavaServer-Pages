package com.web.demo.utils;

import java.sql.*;

public class JdbcMobile {
    private static String url ="jdbc:mysql://127.0.0.1:3306/mobileshop?serverTimezone=GMT&useSSL=false";
    private static String username="root";
    private static String password="root";
    private static String driverName="com.mysql.cj.jdbc.Driver";

    // static静态代码块里面代码，会在类加载到内存的时候立刻执行
    static {
        //1.注册驱动
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     * @return
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        //2.获取连接
        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }


    public static void close(Connection connection, PreparedStatement prepareStatement, ResultSet resultSet) {
        //5.释放资源 connection prepareStatement resultSet
        if(resultSet!=null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(prepareStatement!=null) {
            try {
                prepareStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(connection!=null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
