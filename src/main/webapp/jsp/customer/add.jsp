<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <TITLE>添加客户</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</HEAD>
<BODY>
<FORM id="add_customer" name="add_customer"
      method=post>

    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
                              border=0></TD>
            <TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
                height=20></TD>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
                    src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
            <TD vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <TR>
                        <TD class=manageHead>当前位置：客户管理 &gt; 添加客户</TD>
                    </TR>
                    <TR>
                        <TD height=2></TD>
                    </TR>
                </TABLE>

                <TABLE cellSpacing=0 cellPadding=5 border=0>


                    <TR>
                        <td>客户名称：</td>
                        <td>
                            <INPUT class=textbox id="cust_name"
                                   style="WIDTH: 180px" maxLength=50 name="cust_name">
                        </td>
                        <td>客户级别 ：</td>
                        <td>
                            <select id="level" name="level.dict_id">
                                <option value="">-- 请选择 --</option>
                            </select>
                        </td>
                    </TR>

                    <TR>

                        <td>信息来源 ：</td>
                        <td>
                            <select id="source" name="source.dict_id">
                                <option value="">-- 请选择 --</option>
                            </select>
                        </td>
                        <td>联系人：</td>
                        <td>
                            <INPUT class=textbox id="cust_linkman"
                                   style="WIDTH: 180px" maxLength=50 name="cust_linkman">
                        </td>
                    </TR>

                    <TR>


                        <td>固定电话 ：</td>
                        <td>
                            <INPUT class=textbox id="cust_phone"
                                   style="WIDTH: 180px" maxLength=50 name="cust_phone">
                        </td>
                        <td>移动电话 ：</td>
                        <td>
                            <INPUT class=textbox id="cust_mobile"
                                   style="WIDTH: 180px" maxLength=50 name="cust_mobile">
                        </td>
                    </TR>

                    <TR>
                        <td>联系地址 ：</td>
                        <td>
                            <INPUT class=textbox id="cust_address"
                                   style="WIDTH: 180px" maxLength=50 name="cust_address">
                        </td>
                        <td>邮政编码 ：</td>
                        <td>
                            <INPUT class=textbox id="cust_zip"
                                   style="WIDTH: 180px" maxLength=50 name="cust_zip">
                        </td>
                    </TR>
                    <TR>
                        <td>客户传真 ：</td>
                        <td>
                            <INPUT class=textbox id="cust_fax"
                                   style="WIDTH: 180px" maxLength=50 name="cust_fax">
                        </td>
                        <td>客户网址 ：</td>
                        <td>
                            <INPUT class=textbox id="cust_website"
                                   style="WIDTH: 180px" maxLength=50 name="cust_website">
                        </td>
                    </TR>
                    <tr>
                        <td rowspan=2>
                            <INPUT class=button id="btn_add_customer" type="submit"
                                   value=" 保存 " name="btn_add_customer">
                            <INPUT class=button id="btn_reset_customer" type="reset"
                                   value=" reset " name="btn_add_customer">
                        </td>
                    </tr>

                    <tr>
                        <td rowspan=2 id="msg">
                        </td>
                    </tr>
                </TABLE>


            </TD>
            <TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
                <IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
                              border=0></TD>
            <TD align=middle width="100%"
                background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
</FORM>
<script>
    String.prototype.format = String.prototype.f = function () {
        var s = this,
                i = arguments.length;

        while (i--) {
            s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
        }
        return s;
    };
    var constants;
    var customer;
    if (!constants) {
        constants = new Constants();
    }

    if (!customer) {
        customer = new Customer();
    }
</script>
<script>
    $("#btn_add_customer").click(function () {
        console.log("btn_add_customer");
        let params = $("#add_customer").serialize();
        console.log(params);
        $.post('customer_save.action',params,function (data) {
            if (data.code==0) {
                $('#msg').html("succuess")
                $('#btn_reset_customer').click()
                setTimeout(function () {
                    $('#msg').html("")
                }, 1000);
                console.log("save success");
            }else {
                $('#msg').html("failed")
                console.log(data.msg);
            }
        },'json')
        return false;
    });

    customer.loadOptionByType(constants.TYPE_LEVEL, $('#level'))
    customer.loadOptionByType(constants.TYPE_SOURCE, $('#source'));
</script>
</BODY>
</HTML>
