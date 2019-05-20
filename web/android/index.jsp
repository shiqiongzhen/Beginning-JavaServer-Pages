<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/4/27
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
登录演示<br>

<form action="LoginServlet" method="post">
    账号：<input type = "text" name = "username"><br>
    密码：<input type = "text" name = "password" ><br>
    <input type = "submit" value = "提交">
</form>

</body>
</html>
