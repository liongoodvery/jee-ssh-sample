<%--
  Created by IntelliJ IDEA.
  User: lion
  Date: 3/7/17
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>regist</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/user_regist.action">
    <label for="user_code">用户账号:<input type="text" name="user_code" id="user_code"></label><span id="code_error"></span><br/>
    <label for="user_name">用户姓名:<input type="text" name="user_name" id="user_name"></label><span id="name_error"><br/>
    <label for="user_password">密码:<input type="text" name="user_password" id="user_password"><span id="password_error"></label><br/>
    <input type="submit">
</form>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script>
    $('#user_code').on('blur',function () {
        let params={"user_code": $(this).val()}
        let url="${pageContext.request.contextPath}/user_checkCode.action"

        $.post(url,params,function (data) {
            console.log(data)
        });
    })

</script>
</body>
</html>
