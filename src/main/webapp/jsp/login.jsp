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
    <title>Login</title>
</head>
<body>

<FORM id="loginForm" name=form1  method=post>

    <DIV id=UpdatePanel1>
        <DIV id=div1
             style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>
        <DIV id=div2
             style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>


        <DIV>&nbsp;&nbsp; </DIV>
        <DIV>
            <TABLE cellSpacing=0 cellPadding=0 width=900 align=center border=0>
                <TBODY>
                <TR>
                    <TD style="HEIGHT: 105px"><IMG src="images/login_1.gif"
                                                   border=0></TD>
                </TR>
                <TR>
                    <TD background=images/login_2.jpg height=300>
                        <TABLE height=300 cellPadding=0 width=900 border=0>
                            <TBODY>
                            <TR>
                                <TD colSpan=2 height=35></TD>
                            </TR>
                            <TR>
                                <TD width=360></TD>
                                <TD>
                                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                                        <TBODY>
                                        <TR>
                                            <TD style="HEIGHT: 28px" width=80>登 录 名：</TD>
                                            <TD style="HEIGHT: 28px" width=150><INPUT id=txtName
                                                                                      style="WIDTH: 130px"
                                                                                      name="user_code"></TD>
                                            <TD style="HEIGHT: 28px" width=370><SPAN
                                                    id=RequiredFieldValidator3
                                                    style="FONT-WEIGHT: bold; VISIBILITY: hidden; COLOR: white">请输入登录名</SPAN>
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD style="HEIGHT: 28px">登录密码：</TD>
                                            <TD style="HEIGHT: 28px"><INPUT id=txtPwd style="WIDTH: 130px"
                                                                            type=password name="user_password"></TD>
                                            <TD style="HEIGHT: 28px"><SPAN id=RequiredFieldValidator4
                                                                           style="FONT-WEIGHT: bold; VISIBILITY: hidden; COLOR: white">请输入密码</SPAN>
                                            </TD>
                                        </TR>

                                        <TR>
                                            <TD style="HEIGHT: 18px"></TD>
                                            <TD style="HEIGHT: 18px"></TD>
                                            <TD style="HEIGHT: 18px"></TD>
                                        </TR>
                                        <TR>
                                            <TD></TD>
                                            <TD>

                                                <INPUT id="loginBtn"
                                                       style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px"
                                                       type=image src="images/login_button.gif" name=btn>

                                            </TD>
                                        </TR>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                    </TD>
                </TR>
                <TR>
                    <TD><IMG src="images/login_3.jpg"
                             border=0></TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV>
    </DIV>


</FORM>
<script>
    let contentLoader = new ContentLoader();

    $('#loginBtn').click(function () {
        console.log("loginBtn");
        $.post('user_login.action', $('#loginForm').serialize(), function (data) {
                    if (data.code == 0) {
                        $('#content').load('jsp/welcome.jsp')
                    }
                },
                'json' // I expect a JSON response
        );
        return false;
    });

    $('#customer_add').click(function () {
        console.log("customer_add");
        contentLoader.loadAddCustomer();
    })

    $('#customer_list').click(function () {
        console.log("customer_list");
        $.get("customer_list.action",function (data) {
            console.log($(data));
            $('#content').html($(data).filter('form'));
        })
    })
</script>
</body>
</html>
