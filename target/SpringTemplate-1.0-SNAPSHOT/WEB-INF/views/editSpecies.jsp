<%--
  Created by IntelliJ IDEA.
  User: Sarah Guarino
  Date: 5/20/2017
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Species</title>
    <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
    <div class="title-row">Register An Account</div>
    <div class="col-2 flav flav-1"></div><div class="col-2 flav flav-2"></div><div class="col-2 flav flav-3"></div><div class="col-2 flav flav-4"></div><div class="col-2 flav flav-5"></div><div class="col-1 flav flav-6"></div>
    <div class="page-guts">
        <div class="menu">
            <a href="${pageContext.request.contextPath}">Home</a>
            <a href="${pageContext.request.contextPath}/species">Species</a>
            <a href="${pageContext.request.contextPath}/admin">Admin</a>
        </div>
        <form action="${pageContext.request.contextPath}/admin/speciesEdited" method="post">
            <div class="form-item">
                <div class="form-label">Species Name</div>
                <input title="Species Name" type="text" name="speciesname"
                       value="${editSpecies.speciesname}"/>
            </div>
            <div class="form-item">
                <div class="form-label">Picture Link</div>
                <input title="Picture Link" type="text" name="picturelink"
                       value="${editSpecies.picturelink}"/>
            </div>
            <div class="form-item">
                <div class="form-label">Temperature</div>
                <input title="Temp" type="text" name="temps"
                       value="${editSpecies.temps}">
            </div>
            <div class="form-item">
                <div class="form-label">Humidity</div>
                <input title="Humidity" type="text" name="humidity"
                       value="${editSpecies.humidity}" />
            </div>
            <div class="form-item">
                <div class="form-label">Price</div>
                <input type="number" min="0" max="100000" step="any"
                       title="Price" name="price"
                       value="${editSpecies.price}"/>
            </div>
            <div class="form-item">
                <div class="form-label">Diet</div>
                <input title="Diet" type="text" name="diet"
                       value="${editSpecies.diet}" />
            </div>
            <div class="form-item">
                <div class="form-label">Experience Required</div>
                <input title="Experience Level" type="text" name="experiencelevel"
                       value="${editSpecies.experiencelevel}">
            </div>
            <div class="form-item">
                <div class="form-label">Size</div>
                <input title="Size" type="text" name="size"
                       value="${editSpecies.size}" />
            </div>
            <div class="form-item">
                <div class="form-label">Region</div>
                <input title="Region" type="text" name="region"
                       value="${editSpecies.region}" />
            </div>
            <div class="form-item">
                <div class="form-label">Habitat</div>
                <input title="Habitat" type="text" name="habitat"
                       value="${editSpecies.habitat}" />
            </div>
            <div class="form-item">
                <div class="form-label">Description</div><br />
                <textarea title="Description" name="description" cols="50" rows="20">${editSpecies.description}</textarea>
            </div>
            <input type="submit" name="Edit This Species"/>
        </form>
    </div>
</div>
</body>
</html>
