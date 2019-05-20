<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="loginBean" class="com.web.demo.ch10.Login" scope="session"/>
<%@ page import="java.sql.*" %>
<%@ page import="com.web.demo.utils.JdbcMobile" %>
<HTML><HEAD><%@ include file="head.txt" %></HEAD><BODY>
<div align="center">
<%  if(loginBean==null){
        response.sendRedirect("login.jsp");//重定向到登录页面
    }
    else {
       boolean b =loginBean.getLogname()==null||
                  loginBean.getLogname().length()==0;
       if(b) response.sendRedirect("login.jsp");//重定向到登录页面
    }
    try{
        ResultSet rs;
        Connection con= JdbcMobile.getConnection();
        Statement sql=con.createStatement();
        String cdn= "SELECT id,mess,sum FROM orderform where logname= '"+loginBean.getLogname()+"'";
        rs=sql.executeQuery(cdn);
        out.print("<table border=2>");
        out.print("<tr>");
        out.print("<th width=100>"+"订单号");
        out.print("<th width=100>"+"信息");
        out.print("<th width=100>"+"价格");
        out.print("</TR>");
        while(rs.next()){
          out.print("<tr>");
          out.print("<td >"+rs.getString(1)+"</td>");
          out.print("<td >"+rs.getString(2)+"</td>");
          out.print("<td >"+rs.getString(3)+"</td>");
          out.print("</tr>") ;
        }
        out.print("</table>");
        con.close();
    }
    catch(SQLException e){
          out.print(e);
    }
 %>
</div>
</BODY></HTML>
