<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/3/18
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="" method="get" name="form">
    <input type="text" name="number" value=""><br>
   <input type="submit" value="送出" name="submit"><br>
</form>
<%
    String a=request.getParameter("number");
    if(a==null){
        a="1";
    }
    try {
        double number=Integer.parseInt(a);
        out.print(a+"的平方根："+Math.sqrt(number));
    }catch (NumberFormatException e){
        out.print("请输入数字字符");
    }
%>
