<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/3/26
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="RestTag" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="CircleTag" %>
<html>
<head>
    <title>练习六</title>
</head>
<body>
<h3>以下是调用Rest.tag文件的效果：</h3>
<RestTag:Rect numberA="5" numberB="6"></RestTag:Rect>
<%=RectMessage%>
<%=RectArea%>
<h3>以下是调用Circle.tag文件的效果：</h3>
<CircleTag:Circle number="5"/>
<%=CircleMessage%>
<%=CircleArea%>
</body>
</html>
