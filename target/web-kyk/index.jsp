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
<script type="text/javascript" src="/js/jquery.min.js"></script>

<script>
    $(document).ready(function(){
        // start load my js functions
        //init();
    });
    function postSimpleData() {

        $.ajax({
            type: "POST",
            url: "/AjaxUser/testUpdate",
            //contentType: "application/json", //必须有
//            contentType:"application/x-www-form-urlencoded ",
//            dataType: "json", //表示返回值类型，不必须'
//            data: JSON.stringify({ "foo":"foovalue","bar":"barvalue"}),  //相当于 //// data: "{'str1':'foovalue', 'str2':'barvalue'}",
            data: { "foo":"foovalue","bar":"barvalue"},
            error:function(data){
                alert("出错了！！:"+data.msg);
            },
            success: function (jsonResult) {
                alert(jsonResult);
            }
        });

    }

    function postObjectData() {

        $.ajax({
            type: "POST",
            url: "/AjaxUser/testUpObject",
            //contentType: "application/json", //必须有
            //dataType: "json", //表示返回值类型，不必须'

            data: { "userName":"userNamevalue","userPhone":"userPhonevalue"},  //相当于 //data: "{'str1':'foovalue', 'str2':'barvalue'}",
            error:function(data){
                alert("出错了！！:"+data.msg);
            },
            success: function (jsonResult) {
                alert(jsonResult);
            }
        });

    }
    function login(){
        $.ajax({
            url: "/AjaxUser/login",
            type: "POST",
            contentType: "application/json",
//            dataType: "json",
            data: JSON.stringify({
                userName:"127.0.0.1",
                userPhone:"4",
                userEmail:"1111@123.com",
                userPwd:"thePWD"
            }),
            async: false,//默认是true）如上：false为同步，这个Ajax请求将整个浏览器锁死，
            success: function(data) {
                var ss = JSON.stringify(data);
                //$("#result").val(ss);
                console.log(ss);
            }
        });
    }

</script>

<head>
    <title>首页</title>
</head>
<body>




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
    <button type="button" onclick="postSimpleData()">ajax</button>
    <button type="button" onclick="postObjectData()">ajaxObject</button>
    <button type="button" onclick="login()">login</button>

</form>
</body>
</html>
