package com.web.demo;
import com.web.demo.utils.JdbcUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String logname = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = JdbcUtils.getConnection();
            String sql="SELECT * FROM user where name=? and password= ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1,logname);
            pstmt.setString(2,password);
            if (logname.length()>0&&password.length()>0){
                ResultSet rs=pstmt.executeQuery();
                boolean m=rs.next();
                if (m==true){
                    //调用登录成功的方法
                    out.print(logname+"你好,登录成功！");
                }
                else{
                    out.println("你输入的用户名不存在,或密码错误");
                }
            }
            else{
                out.println("请输入用户名和密码");
            }
            con.close();
        }catch(Exception e){

        }
        out.flush();
        out.close();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}