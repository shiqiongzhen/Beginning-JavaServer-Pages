<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.web.demo.utils.JdbcMobile" %>
<HTML><HEAD><%@ include file="head.txt" %></HEAD>
<BODY bgcolor=cyan><font size=2>
<div align="center">
<h2>选择某类手机<br>分页显示这类手机</h2>
<%
      Statement sql;
      ResultSet rs;
      try {
        Connection con= JdbcMobile.getConnection();
        sql=con.createStatement();
        //读取mobileClassify表，获得分类：  
        rs=sql.executeQuery("SELECT * FROM mobileClassify  ");
        out.print("<form action='queryServlet' method ='post'>") ;
        out.print("<select name='fenleiNumber'>") ;
        while(rs.next()){
           int id = rs.getInt(1);
           String mobileCategory = rs.getString(2);
           out.print("<option value ="+id+">"+mobileCategory+"</option>");
        }  
        out.print("</select>");
        out.print("<input type ='submit' value ='提交'>");  
        out.print("</form>");
        con.close();
     }
     catch(SQLException e){ 
        out.print(e);
     }
%>
</div></font>
</BODY></HTML>
