<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/main.css">
    <LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
    <title>Crm</title>
</head>
<body>

<header id="top">
    <FORM id=form1 name=form1 action="" method=post>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
            <TBODY>
            <TR>
                <TD width=10><IMG src="images/new_001.jpg" border=0></TD>
                <TD background=images/new_002.jpg><FONT size=5><B>客户关系管理系统v1.0</B></FONT></TD>
                <TD background=images/new_002.jpg>
                    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                        <TBODY>
                        <TR>
                            <TD align=right height=35></TD>
                        </TR>
                        <TR>
                            <TD height=35 align="right">
                                新增客户
                                <A href="#" target=_top><FONT color=red>修改密码</FONT></A>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <A href="${ pageContext.request.contextPath }/user_exit.action" target=_top>
                                    <FONT color=red>
                                        安全退出
                                    </FONT>
                                </A>
                            </TD>
                        </TR>
                        </TBODY>
                    </TABLE>
                </TD>
                <TD width=10><IMG src="images/new_003.jpg" border=0></TD>
            </TR>
            </TBODY>
        </TABLE>
    </FORM>
</header>

<aside id="menu">
    <FORM id=menuform name=menuform action=YHMenu.aspx method=post>
        <TABLE cellSpacing=0 cellPadding=0 width=210 border=0>
            <TBODY>
            <TR>
                <TD width=15><IMG src="images/new_005.jpg" border=0></TD>
                <TD align=middle width=180 background=images/new_006.jpg
                    height=35><B>人力资源 －功能菜单</B></TD>
                <TD width=15><IMG src="images/new_007.jpg" border=0></TD>
            </TR>
            </TBODY>
        </TABLE>
        <TABLE cellSpacing=0 cellPadding=0 width=210 border=0>
            <TBODY>
            <TR>
                <TD width=15 background=images/new_008.jpg></TD>
                <TD vAlign=top width=180 bgColor=#ffffff>
                    <TABLE cellSpacing=0 cellPadding=3 width=165 align=center border=0>
                        <TBODY>
                        <TR>
                            <TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN
                                    class=span id=table_1Span>＋</SPAN> 客户管理
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
                                       cellPadding=2 width=155 align=center border=0>
                                    <TBODY>
                                    <TR id="customer_add">
                                        <TD class=menuSmall><A class=style2 href="#">－ 新增客户</A></TD>
                                    </TR>
                                    <TR id="customer_list">
                                        <TD class=menuSmall>
                                            <A class=style2
                                               href="#">－ 客户列表</A>
                                        </TD>
                                    </TR>

                                    </TBODY>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD background=images/new_027.jpg height=1></TD>
                        </TR>
                        <TR>
                            <TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN
                                    class=span id=table_2Span>＋</SPAN> 联系人管理
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
                                       cellPadding=2 width=155 align=center border=0>
                                    <TBODY>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="linkmanServlet?method=add"
                                                               target=main>－ 新增联系人</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="linkmanServlet?method=list"
                                                               target=main>－联系人列表</A></TD>
                                    </TR>

                                    </TBODY>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD background=images/new_027.jpg height=1></TD>
                        </TR>
                        <TR>
                            <TD class=mainMenu onClick="MenuDisplay('table_5');"><SPAN
                                    class=span id=table_5Span>＋</SPAN> 客户拜访管理
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <TABLE id=table_5 style="DISPLAY: none" cellSpacing=0
                                       cellPadding=2 width=155 align=center border=0>
                                    <TBODY>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－新增客户拜访</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－客户拜访列表</A></TD>
                                    </TR>

                                    </TBODY>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD background=images/new_027.jpg height=1></TD>
                        </TR>
                        <TR>
                            <TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN
                                    class=span id=table_3Span>＋</SPAN> 综合查询
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <TABLE id=table_3 style="DISPLAY: none" cellSpacing=0
                                       cellPadding=2 width=155 align=center border=0>
                                    <TBODY>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－ 客户信息查询</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－ 联系人信息查询</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－ 客户拜访记录查询</A></TD>
                                    </TR>
                                    </TBODY>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD background=images/new_027.jpg height=1></TD>
                        </TR>
                        <TR>
                            <TD class=mainMenu onClick="MenuDisplay('table_4');"><SPAN
                                    class=span id=table_4Span>＋</SPAN> 统计分析
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <TABLE id=table_4 style="DISPLAY: none" cellSpacing=0
                                       cellPadding=2 width=155 align=center border=0>
                                    <TBODY>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－客户行业统计</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－客户来源统计</A></TD>
                                    </TR>

                                    </TBODY>
                                </TABLE>
                            </TD>
                        </TR>
                        <TR>
                            <TD background=images/new_027.jpg height=1></TD>
                        </TR>
                        <TR>
                            <TD class=mainMenu onClick="MenuDisplay('table_6');"><SPAN
                                    class=span id=table_6Span>＋</SPAN>系统管理
                            </TD>
                        </TR>
                        <TR>
                            <TD>
                                <TABLE id=table_6 style="DISPLAY: none" cellSpacing=0
                                       cellPadding=2 width=155 align=center border=0>
                                    <TBODY>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－角色管理</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－用户管理</A></TD>
                                    </TR>
                                    <TR>
                                        <TD class=menuSmall><A class=style2 href="#"
                                                               target=main>－数据字典</A></TD>
                                    </TR>
                                    </TBODY>
                                </TABLE>
                            </TD>
                        </TR>
                        </TBODY>
                    </TABLE>
                </TD>
                <TD width=15 background=images/new_009.jpg></TD>
            </TR>
            </TBODY>
        </TABLE>
        <TABLE cellSpacing=0 cellPadding=0 width=210 border=0>
            <TBODY>
            <TR>
                <TD width=15><IMG src="images/new_010.jpg" border=0></TD>
                <TD align=middle width=180 background=images/new_011.jpg
                    height=15></TD>
                <TD width=15><IMG src="images/new_012.jpg" border=0></TD>
            </TR>
            </TBODY>
        </TABLE>
    </FORM>

</aside>


<div id="content">

</div>
<script src="js/jquery-3.1.1.js"></script>
<script src="js/main.js"></script>

<script>
    $('#content').load('jsp/login.jsp');
</script>



</body>
</html>