<%--
  Created by IntelliJ IDEA.
  User: Sarah Guarino
  Date: 5/15/2017
  Time: 7:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Lemonade</title>
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
        <div class="item-holder">
            <c:forEach var="thisSpecies" items="${speciesListEL}">
                <div class="item-block">
                    <div class="item-image"
                         style="background-image: url('${thisSpecies.picturelink}');">
                        <div class="item-name">${thisSpecies.speciesname}</div>
                    </div>
                    <div class="item-price">${thisSpecies.price}</div>
                    <div class="item-desc">
                            ${thisSpecies.description}
                    </div>
                    <br /><br />
                    <h3>Captive Care</h3>
                    <b>Experience Needed:</b> ${thisSpecies.experiencelevel}<br />
                    <b>Temperatures:</b> ${thisSpecies.temps}<br />
                    <b>Humidity:</b> ${thisSpecies.humidity}<br />
                    <b>Diet:</b> ${thisSpecies.diet}<br />
                    <br />
                    <h3>In The Wild</h3>
                    <b>Native Region:</b> ${thisSpecies.region}<br />
                    <b>Habitat:</b> ${thisSpecies.habitat}
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
