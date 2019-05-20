<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/4/7
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="guessNumber"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String str=request.getParameter("guessNumber");
        if(str==null) str="*";
        if(str.length()==0) str="*";
    %>
    <guessNumber:Guess number="<%=str%>"></guessNumber:Guess>
    当前猜测结果为：<%=message%><br>
   <%
    if(message.toString().startsWith("你猜对了")){%>
        <br><a href="ex4_18.jsp">重新获得随机数</a>
    <%}
    else {%>
        <br>输入你的猜测：
        <form action="" method="get" name="form">
            <input type="text" name="guessNumber">
            <input type="submit" value="送出" name="submit">
        </form>
    <%}
%>
</body>
</html>
