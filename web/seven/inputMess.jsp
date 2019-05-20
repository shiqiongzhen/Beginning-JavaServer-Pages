<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/4/18
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.web.demo.MessBoard" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.web.demo.utils.JdbcUtils" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<jsp:useBean id="board" class="com.web.demo.MessBoard" scope="application"></jsp:useBean>
<html>
<head>
    <title>inputMess</title>
</head>
<body>
    <form action="" method="post" name="form">
        输入你的名字：<br><input type="text" name="name">
        <br>输入你的留言标题：<br><input type="text" name="title">
        <br>输入你的留言：<br><textarea name="content" rows="10" cols="36" wrap="physical"></textarea>
        <br><input type="submit" value="提交信息" name="submit">
    </form>
    <jsp:setProperty name="board" property="*"/>
    <%
        if(board.getName()!=null&&board.getTitle()!=null&&board.getContent()!=null){
            try {
                String name = board.getName();
                String title = board.getTitle();
                String content = board.getContent();
                System.out.println(name+title+content);
                Connection con = JdbcUtils.getConnection();
                String sql ="INSERT INTO messboard VALUES (?,?,?)";
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1,name);
                preparedStatement.setString(2,title);
                preparedStatement.setString(3,content);
                boolean execute = preparedStatement.execute();
                System.out.println(execute);
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <a href="showMess.jsp">查看留言板</a>
</body>
</html>
