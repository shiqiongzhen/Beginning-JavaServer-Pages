<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/3/18
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>param动作标记</title>
</head>
<body>
<H2>param动作标记</H2>
<H3>作业要求：p37 习题7，求梯形面积</H3><HR><BR>

<jsp:include page="paramTag_trapezoid.jsp">
    <jsp:param name="top" value="8"></jsp:param>
    <jsp:param name="bottom" value="13"></jsp:param>
    <jsp:param name="height" value="7"></jsp:param>
</jsp:include>
</body>
</html>
