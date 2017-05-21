<%--
  Created by IntelliJ IDEA.
  User: Sarah Guarino
  Date: 5/20/2017
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Lemonade - Admin Panel</title>
    <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
    <div class="title-row">Welcome to Lemonade!</div>
    <div class="col-2 flav flav-1"></div><div class="col-2 flav flav-2"></div><div class="col-2 flav flav-3"></div><div class="col-2 flav flav-4"></div><div class="col-2 flav flav-5"></div><div class="col-1 flav flav-6"></div>
    <div class="page-guts">
        <div class="menu">
            <a href="${pageContext.request.contextPath}">Home</a>
            <a href="${pageContext.request.contextPath}/species">Species</a>
            <a href="${pageContext.request.contextPath}/admin">Admin</a>
        </div>
        <table>
            <c:forEach var="thisSpecies" items="${speciesListEL}">
                <tr>
                    <td>
                            ${thisSpecies.speciesname}
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/action=editSpecies?id=${thisSpecies.speciesid}">[edit]</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/action=deleteSpecies?id=${thisSpecies.speciesid}">[delete]</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <a href="${pageContext.request.contextPath}/admin/addSpecies">[Add A Species]</a>
    </div>
</div>
</body>
</html>
