package com.web.demo;
import com.web.demo.utils.JdbcUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        try{
            Connection con= JdbcUtils.getConnection();
            String sql="INSERT INTO user VALUES(?,?)";
            PreparedStatement pstmt=con.prepareStatement(sql);
            if (name.length()>0&&password.length()>0){
                pstmt.setString(1,name);
                pstmt.setString(2,password);

                int m = pstmt.executeUpdate();
                if (m!=0){
                    //调用登录成功的方法
                    out.print(name+"注册成功");
                }
                else{
                    out.println("信息填写不完整或名字中有非法字符");
                }
            }
            else{
                out.println("请输入用户名和密码");
            }
            con.close();
        }
        catch (SQLException exp){
            out.println("该用户名已被注册");
        }
        out.flush();
        out.close();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
