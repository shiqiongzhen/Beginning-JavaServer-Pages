package com.web.demo.ch10;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.web.demo.utils.JdbcMobile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

//@WebServlet(name = "Servlet")
@WebServlet("/AdminOrderlist")
public class AdminOrderlist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONArray array = new JSONArray();
        try{
            int page = Integer.parseInt(request.getParameter("page_current"));
            int start = 0;
            int total=0;
            if (page > 0) {
                start = (page - 1) * 10;
            }
            Connection con= JdbcMobile.getConnection();
            String condition="SELECT * FROM orderform ORDER BY id LIMIT " + start + "," + 10;
            Statement sql=con.createStatement();
            ResultSet rs=sql.executeQuery(condition);
            // 获取列数
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            while (rs.next()) {
                JSONObject jsonObj = new JSONObject();
                // 遍历每一列
                for (int i = 1; i <= columnCount; i++) {
                    String columnName =metaData.getColumnLabel(i);
                    String value = rs.getString(columnName);
                    jsonObj.put(columnName, value);
                }
                array.add(jsonObj);
            }
            //获取总页数
            PreparedStatement ps = con.prepareStatement("SELECT count(*) AS total FROM orderform ");
            rs = ps.executeQuery();
            while (rs.next()) {
                total=rs.getInt("total");
            }
            con.close();
            System.out.println(array);
            PrintWriter out = response.getWriter();
            JSONArray data = new JSONArray();
            data.add(array);
            data.add(total);
            out.write(data.toJSONString());
            out.flush();
        }
        catch(SQLException exp){
            System.out.println(exp);
        }
    }
}
