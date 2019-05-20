package com.web.demo.ch10;

import com.alibaba.fastjson.JSONArray;
import com.web.demo.utils.JdbcMobile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@WebServlet(name = "Servlet")
@WebServlet("/AdminOrderAdd")
public class AdminOderAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONArray array = new JSONArray();
        PreparedStatement pstm = null;
        String result="";
        try{
            String logname = request.getParameter("logname");
            String mess = request.getParameter("mess");
            String sum = request.getParameter("sum");
            Connection con= JdbcMobile.getConnection();
            String sql = "INSERT INTO orderform (logname,mess,sum) VALUES (?,?,?)";
//            String sql = "INSERT INTO user" + "(logname, password, phone, address, realname) VALUES"+ "(?,?,?,?)";
            pstm = con.prepareStatement(sql);
            pstm.setString(1,logname);
            pstm.setString(2,mess);
            pstm.setString(3,sum);
            pstm.executeUpdate();
            con.close();
            String data = "添加成功";
            OutputStream outputStream = response.getOutputStream();
            //将字符转换成字节数组，指定以UTF-8编码进行转换
            byte[] dataByteArr = data.getBytes("UTF-8");
            outputStream.write(dataByteArr);
        }
        catch(SQLException exp){
            String data = "用户名不唯一";
            OutputStream outputStream = response.getOutputStream();
            //将字符转换成字节数组，指定以UTF-8编码进行转换
            byte[] dataByteArr = data.getBytes("UTF-8");
            outputStream.write(dataByteArr);
            exp.printStackTrace();
        }
    }
}
