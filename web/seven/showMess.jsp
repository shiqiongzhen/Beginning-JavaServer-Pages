<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019/4/18
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.web.demo.MessBoard" %>
<jsp:useBean id="board" class="com.web.demo.MessBoard" scope="application"></jsp:useBean>
<jsp:useBean id="look" class="com.web.demo.ShowRecordByPage" scope="session"/>
<jsp:setProperty name="look" property="tableName" value="messboard"/>
<jsp:setProperty name="look" property="pageSize" value="3"/>
<jsp:getProperty  name= "look" property="tableName"/>表的记录将被分页显示。
<br>共有 <jsp:getProperty name="look" property="pageAllCount"/> 页，
每页最多显示<jsp:getProperty  name="look"  property="pageSize" />条记录。
<jsp:setProperty  name= "look"  property="showPage"  />
<jsp:getProperty  name= "look"  property="presentPageResult" />
<BR>单击“前一页”或“后一页”按纽查看记录（当前显示第
<jsp:getProperty  name= "look"  property="showPage" /> 页）。
<html>
<head>
    <title>showMess</title>
</head>
<body bgcolor="pink">
    <%--<jsp:getProperty name="board" property="allMessage"/>--%>
    <Table>
        <tr><td><form action="">
            <input type=hidden name="showPage" value="<%=look.getShowPage()-1 %>" >
            <input type=submit name="g" value="前一页">
        </form>
        </td>
            <td><form action="">
                <input type=hidden name="showPage" value="<%=look.getShowPage()+1 %>" >
                <input type=submit name="g" value="后一页">
            </form>
            </td>
        </tr>
    </Table>
    <a href="inputMess.jsp">我要留言</a>
</body>
</html>
