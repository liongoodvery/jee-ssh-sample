<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>list</title>
</head>
<body>
<div class="ret">
    <s:debug></s:debug>
    <table>
        <c:forEach items="${books}" var="book">
            <tr>
                <td> ${book.bookName}</td>
                <td> ${book.accessTime}</td>
                <td><a href="book_read?id=${book.id}">read</a></td>
            </tr>
        </c:forEach>
    </table>

    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/main.js"></script>
    <script></script>
</div>
</body>
</html>
