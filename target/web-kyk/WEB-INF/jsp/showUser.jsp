<%--
  Created by IntelliJ IDEA.
  User: Zhangxq
  Date: 2016/7/16
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户信息列表</title>
</head>
<body>

    <c:if test="${!empty userList}">
        <c:forEach var="user" items="${userList}">
            id:${user.id}&nbsp;&nbsp; 姓名：${user.userName} &nbsp;&nbsp;手机号：${user.userPhone} &nbsp;&nbsp;邮箱：${user.userEmail} &nbsp;&nbsp;<br>
        </c:forEach>
    </c:if>


    <form name="form1" action="/user/addUser" method="post">
      属性添加：  <input type="text" name="name"/>
        <input type="text" name="hobby"/>
        <button type="submit">提交</button>
    </form>

    <form name="form2" action="/user/addUserByUser" method="post">
       对象添加：
        名称：<input  name="userName"/>
        电话：<input  name="userPhone"/>
        <button type="submit">提交</button>
    </form>

    <form name="form3" action="/user/updateUserByUser" method="post">
        对象修改：
        id:<input  name="id"/>
        名称：<input  name="userName"/>
        电话：<input  name="userPhone"/>
        <button type="submit">提交</button>
    </form>
</body>
</html>
