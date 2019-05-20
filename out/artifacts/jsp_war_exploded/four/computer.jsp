<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
字符串的长度为：
<%
    String str=request.getParameter("str");
    str.toCharArray();
    int len=str.length();
%>
<%= len %>
</body>
</html>

