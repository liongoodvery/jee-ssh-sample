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
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/user_regist.action">
    <label for="user_code">用户账号:<input type="text" name="user_code" id="user_code"></label><span id="code_error"></span><br/>
    <label for="user_name">用户姓名:<input type="text" name="user_name" id="user_name"></label><span id="name_error"></span><br/>
    <label for="user_password">密码:<input type="text" name="user_password" id="user_password"></label><span
        id="password_error"></span><br/>
    <input id="submit" type="submit">
</form>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
<script>


    class Invalidator {
        checkCode() {
            console.log("checkCode");
            let params = {"user_code": $('#user_code').val()}
            let url = "${pageContext.request.contextPath}/user_checkCode.action"

            $.post(url, params, function (data) {
                let $codeError = $('#code_error');
                if (data && data == 'yes') {
                    $codeError.addClass('error').text("this code already registed");
                } else {
                    $codeError.removeClass('error').text("");
                }
            });

        }

        checkName() {
            console.log("checkName");
            if (!$('#user_name').val()) {
                $('#name_error').addClass('error').text("user name can not be empty");
            } else {
                $('#name_error').removeClass('error').text("");
            }

        }

        checkPassword() {
            console.log("checkPassword");
            if (!$('#user_password').val()) {
                $('#password_error').addClass('error').text("password can not be empty");
            } else {
                $('#password_error').removeClass('error').text("");
            }
        }

        checkEmpty() {
            console.log("checkEmpty");
            $('#user_code, #user_name, #user_password').each(function (index, obj) {
                console.log(index + '=' + obj)
                if (!$(obj).val()) {
                    if (!$(obj).parent().next().hasClass("error")) {
                        $(obj).parent().next().addClass("error").text("required");
                    } else {
                        $(obj).parent().next().removeClass("error").text("");
                    }
                }
            });
        }
    }

    const invalidator = new Invalidator();
    $('#user_code').on('blur', function () {
        invalidator.checkCode();
    });
    $('#user_name').on('blur', function () {
        invalidator.checkName();
    });

    $('#user_password').on('blur', function () {
        invalidator.checkPassword();
    });

    $('form').on("submit", function () {
        invalidator.checkEmpty();
        console.log("submit error=" + $('.error').length);
        return $('.error').length;
    })

</script>
</body>
</html>
