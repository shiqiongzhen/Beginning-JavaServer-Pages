<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/4/29
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
    <form action="RegisterServlet" method="post">
        账号：<input type = "text" name = "username"><br>
        密码：<input type = "text" name = "password" ><br>
        <input type = "submit" value = "提交">
    </form>
</body>
</html>
