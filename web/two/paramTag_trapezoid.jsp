<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/3/18
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String top=request.getParameter("top");
    String bottom=request.getParameter("bottom");
    String height=request.getParameter("height");
    Float result=(Float.parseFloat(top)+Float.parseFloat(bottom))*Float.parseFloat(height)/2;
    out.print("梯形的上底为："+top+",");
    out.print("梯形的下底为："+bottom+",");
    out.println("梯形的高为："+height+"<br/>");
    out.print("得出梯形的面积为："+result);
%>
<%--<p>梯形的结果为：<% = result %></p>--%>
</body>
</html>
