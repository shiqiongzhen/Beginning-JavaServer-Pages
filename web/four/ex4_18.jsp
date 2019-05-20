<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/4/7
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>猜英文字母</title>
</head>
<body>
    <%--随机分给了你一个1-100之间的数，猜猜！--%>
    随机分给了你一个a-z之间的数，猜猜！
    <%
//        int num =(int)(Math.random()*100)+1;
        char a[]=new char[26];
        int m=0;
        for(char i='a';i<='z';i++){
            a[m]=i;
            m++;
        }
        int randomIndex=(int)(Math.random()*a.length);
        char ch=a[randomIndex];
        session.setAttribute("count",new Integer(0));
//        session.setAttribute("save",new Integer(num));
        session.setAttribute("save",new Character(ch));
    %>
<br><a href="guess.jsp">去猜测这个数</a>
</body>
</html>
