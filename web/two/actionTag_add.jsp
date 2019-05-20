<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/3/18
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="" method="get" name="form">
    <input type="text" name="number" value="">
    <input type="submit" value="提交" name="submit">
</form>
<%
    String a=request.getParameter("number");
    if(a==null){
        a="0";
    }
    try {
        int number=Integer.parseInt(a);
        int sum=0;
        for(int i=0;i<=number;i++){
            sum+=i;
        }
        out.print("1~"+a+"的累加和为："+sum);
    }catch (NumberFormatException e){
        out.print("请输入数字字符");
    }
%>
