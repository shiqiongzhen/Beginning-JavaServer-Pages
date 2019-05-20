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
@WebServlet("/AdminProductAdd")
public class AdminProductAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONArray array = new JSONArray();
        PreparedStatement pstm = null;
        String result="";
        try{
            String mobile_version = request.getParameter("mobile_version");
            String mobile_name = request.getParameter("mobile_name");
            String mobile_made = request.getParameter("mobile_made");
            String mobile_price = request.getParameter("mobile_price");
            String mobile_mess = request.getParameter("mobile_mess");
            String mobile_pic = request.getParameter("mobile_pic");
            Connection con= JdbcMobile.getConnection();
            String sql = "INSERT INTO mobileform (mobile_version,mobile_name,mobile_made,mobile_price,mobile_mess,mobile_pic) VALUES (?,?,?,?,?,?)";
//            String sql = "INSERT INTO user" + "(logname, password, phone, address, realname) VALUES"+ "(?,?,?,?)";
            pstm = con.prepareStatement(sql);
            pstm.setString(1,mobile_version);
            pstm.setString(2,mobile_name);
            pstm.setString(3,mobile_made);
            pstm.setString(4,mobile_price);
            pstm.setString(5,mobile_mess);
            pstm.setString(6,mobile_pic);
            pstm.executeUpdate();
            con.close();
            String data = "添加成功";
            OutputStream outputStream = response.getOutputStream();
            //将字符转换成字节数组，指定以UTF-8编码进行转换
            byte[] dataByteArr = data.getBytes("UTF-8");
            outputStream.write(dataByteArr);
        }
        catch(SQLException exp){
            String data = "产品不唯一";
            OutputStream outputStream = response.getOutputStream();
            //将字符转换成字节数组，指定以UTF-8编码进行转换
            byte[] dataByteArr = data.getBytes("UTF-8");
            outputStream.write(dataByteArr);
            exp.printStackTrace();
        }
    }
}
