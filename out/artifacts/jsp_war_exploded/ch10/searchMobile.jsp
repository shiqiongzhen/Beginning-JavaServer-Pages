<%@ page contentType="text/html;charset=UTF-8" %>
<HTML><HEAD><%@ include file="head.txt" %></HEAD>
<BODY bgcolor=#55BBDD><font size=2>
<div align="center">
<br>查询时可以输入手机的版本号或手机名称及价格。<br>
手机名称支持模糊查询。
<br>输入价格是在2个值之间的价格，格式是：价格1-价格2<br>
例如 3987-8976 
<FORM action="searchByConditionServlet" Method="post" >
   <br>输入查询信息:<Input type=text name="searchMess"><br>
   <Input type =radio name="radio" value="mobile_version">手机版本号
   <Input type =radio name="radio" value="mobile_name" checked="ok">手机名称
   <Input type =radio name="radio" value="mobile_price">手机价格
   <br><Input type=submit name="g" value="提交">
</Form>
</div>
</Font></BODY></HTML>
