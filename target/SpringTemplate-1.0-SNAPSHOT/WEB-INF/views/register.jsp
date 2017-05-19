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
            <a href="species">Species</a>
            <a href="species/add">Add a Species</a>
        </div>
        <form name="userForm" action="/user" method="post">
            First Name: <input title="First Name"
                               type="text"
                               id="fName"
                               name="fName"
                               onchange="checkName('fName', 'fNameWarn', 'First name')" /><br />
            <div id="fNameWarn" class="warn-box"></div>
            Last Name: <input title="Last Name"
                              type="text"
                              id="lName"
                              name="lName"
                              onchange="checkName('lName', 'lNameWarn', 'Last name')" /><br />
            <div id="lNameWarn" class="warn-box"></div>
            Email: <input title="Email"
                             id="email"
                             type="email"
                             name="email" onchange="checkEmail('email', 'emailWarn', 'Email')"><br />
            <div id="emailWarn" class="warn-box"></div>
            Username: <input title="Username"
                             id="username"
                             type="text"
                             name="username" onchange="checkUsername('username', 'usernameWarn', 'Username')"><br />
            <div id="usernameWarn" class="warn-box"></div>
            Password: <input title="Password"
                             id="firstPassword"
                             type="password"
                             name="firstPassword" onchange="checkPassword('firstPassword', 'firstPasswordWarn', 'Password')"><br />
            <div id="firstPasswordWarn" class="warn-box"></div>
            Confirm Password: <input title="Password"
                             id="secondPassword"
                             type="password"
                             name="secondPassword" onchange="checkMatchingPassword('firstPassword', 'secondPassword', 'secondPasswordWarn', 'Passwords')"><br />
            <div id="secondPasswordWarn" class="warn-box"></div>
            <input type="submit" name="Register" disabled />
        </form>
    </div>
</div>
<script>
    function checkName(nameId, warnId, fieldName){

        var namePattern = /[^a-zA-Z'-]/;
        var name = document.getElementById(nameId);
        var nameValue = name.value;

        var warnBox = document.getElementById(warnId);
        var warnHolder = document.createElement("div");
        warnHolder.className = 'warn-holder';
        var warning;

        if(nameValue.length < 2) {
            warning = document.createTextNode(fieldName + " must be at least 2 characters long.");
            name.value = '';
        } else if(nameValue.length > 30) {
            warning = document.createTextNode(fieldName + " must be no more than 30 characters long.");
            name.value = '';
        } else if(namePattern.test(nameValue)) {
            warning = document.createTextNode(fieldName + " cannot contain numbers or special characters.");
            name.value = '';
        } else {
            warning = '';
        }

        warnBox.innerHTML = '';
        warnHolder.appendChild(warning);
        warnBox.appendChild(warnHolder);
    }
    function checkEmail(emailId, warnId, fieldName) {
        var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var email = document.getElementById(emailId);
        var emailValue = email.value;

        var warnBox = document.getElementById(warnId);
        var warnHolder = document.createElement('div');
        warnHolder.className = 'warn-holder';
        var warning;

        if (emailPattern.test(emailValue)) {
            warning = '';
        } else {
            warning = document.createTextNode(fieldName + 'must be written like this: mytestemail@website.com');
            emailId.value = '';
        }

        warnBox.innerHTML = '';
        warnHolder.appendChild(warning);
        warnBox.appendChild(warnHolder);
    }
    function checkUsername(usernameId, warnId, fieldName) {

        var usernamePattern = new RegExp("^([a-zA-Z0-9])([a-zA-Z0-9][._]?)*([a-zA-Z0-9])$");
        var badCharacterPattern = new RegExp("([^a-zA-Z0-9_.])+");
        var badOrderPattern = new RegExp("(^[_.].*)|(.*[_.]$)");

        var username = document.getElementById(usernameId);
        var usernameValue = username.value;

        var warnBox = document.getElementById(warnId);
        var warnHolder = document.createElement("div");
        warnHolder.className = 'warn-holder';
        var warning;

        if (usernameValue.length < 2 || usernameValue.length > 45) { // not longer enough/too long
            warning = document.createTextNode(fieldName + 'must be at least 2 characters and less than 45');
            usernameId.value = '';
        } else if (badCharacterPattern.test(usernameValue)) { // has illegal characters
            warning = document.createTextNode(fieldName + ' must only include these characters: A-Z, 0-9, \'_\', or \'.\'');
            usernameId.value = ''
        } else if (badOrderPattern.test(usernameValue)) {
            warning = document.createTextNode(fieldName + 'cannot begin or end with \'_\' or \'.\'');
            usernameId.value = '';
        } else if (usernamePattern.test(usernameValue)) { // perfect!
            warning = '';
        } else {
            warning = document.createTextNode(fieldName + " has experience an unknown error. Please contact Sarah.")
        }

        warnBox.innerHTML = '';
        warnHolder.appendChild(warning);
        warnBox.appendChild(warnHolder);
    }
    function checkPassword(passwordId, warnId, fieldName) {

        var password = document.getElementById(passwordId);
        var passwordValue = password.value;

        var warnBox = document.getElementById(warnId);
        var warnHolder = document.createElement("div");
        warnHolder.className = 'warn-holder';
        var warning;

        if (passwordValue.length < 6 || passwordValue.length > 20) {
            warning = document.createTextNode(fieldName + ' must be between 6 and 20 characters long.');
            passwordId.value = '';
        } else if (passwordValue.length >= 6 && passwordValue.length <= 20) {
            warning = '';
        } else {
            warning = document.createTextNode(fieldName + " has experience an unknown error. Please contact Sarah.")
        }

        warnBox.innerHTML = '';
        warnHolder.appendChild(warning);
        warnBox.appendChild(warnHolder);
    }
    function checkMatchingPassword(firstPasswordId, secondPasswordId, warnId, fieldName) {

        var firstPassword = document.getElementById(firstPasswordId);
        var firstPasswordValue = firstPassword.value;

        var secondPassword = document.getElementById(secondPasswordId)
        var secondPasswordValue = secondPassword.value;

        var warnBox = document.getElementById(warnId);
        var warnHolder = document.createElement("div");
        warnHolder.className = 'warn-holder';
        var warning;

        if (firstPasswordValue === secondPasswordValue) {
            warning = '';
        } else {
            warning = document.createTextNode(fieldName + ' must match.');
        }

        warnBox.innerHTML = '';
        warnHolder.appendChild(warning);
        warnBox.appendChild(warnHolder);
    }
</script>
</body>
</html>