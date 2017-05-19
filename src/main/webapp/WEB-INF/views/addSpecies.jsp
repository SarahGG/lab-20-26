<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Lemonade</title>
    <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
    <div class="title-row">Register An Account</div>
    <div class="col-2 flav flav-1"></div><div class="col-2 flav flav-2"></div><div class="col-2 flav flav-3"></div><div class="col-2 flav flav-4"></div><div class="col-2 flav flav-5"></div><div class="col-1 flav flav-6"></div>
    <div class="page-guts">
        <div class="menu">
            <a href="/">Home</a>
            <a href="/species">Species</a>
            <a href="">Add a Species</a>
        </div>
        <p>
        <form action="/species/added" method="post">
            Species Name: <input title="Species Name" type="text" name="speciesname" /><br />
            Picture Link: <input title="Picture Link" type="text" name="picturelink" /><br />
            Temp: <input title="Temp" type="text" name="temps"> <br />
            Humidity: <input title="Humidity" type="text" name="humidity" /><br />
            Diet: <input title="Diet" type="text" name="diet" /><br />
            Experience Level: <input title="Experience Level" type="text" name="experiencelevel"> <br />
            Size: <input title="Size" type="text" name="size" /><br />
            Region: <input title="Region" type="text" name="region" /><br />
            Habitat: <input title="Habitat" type="text" name="habitat"> <br />
            Description: <textarea title="Description" name="description" cols="50" rows="20"></textarea>
            <input type="submit" name="Add Species"/>
        </form>
        </p>
    </div>
</div>
</body>
</html>