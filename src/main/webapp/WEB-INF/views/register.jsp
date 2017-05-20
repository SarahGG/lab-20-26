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
            <input type="submit" id="registerButton" name="Register" disabled />
        </form>
    </div>
</div>
<script>
    document.emailIsGood = false;
    document.usernameIsGood = false;
    document.passwordIsGood = false;
    document.confirmPasswordIsGood = false;

    function enableButton() {

        console.log("this happened!");

        var submitButton = document.getElementById("registerButton");
        if ((document.emailIsGood === true) &&
            (document.usernameIsGood === true) &&
            (document.passwordIsGood === true) &&
            (document.confirmPasswordIsGood === true)) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
            console.log(document.emailIsGood);
            console.log(document.usernameIsGood);
            console.log(document.passwordIsGood);
            console.log(document.confirmPasswordIsGood);
        }

    }

    function checkName(nameId, warnId, fieldName){

        var namePattern = /[^a-zA-Z'-]/;
        var name = document.getElementById(nameId);
        var nameValue = name.value;

        if(nameValue.length < 2) {
            printWarning(name, warnId, fieldName + " must be at least 2 characters long.");
        } else if(nameValue.length > 30) {
            printWarning(name, warnId, fieldName + " must be no more than 30 characters long.");
        } else if(namePattern.test(nameValue)) {
            printWarning(name, warnId, fieldName + " cannot contain numbers or special characters.");
        } else {
            cleanWarning(warnId)
        }
    }
    function checkEmail(emailId, warnId, fieldName) {
        var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var email = document.getElementById(emailId);
        var emailValue = email.value;

        if (emailPattern.test(emailValue)) {
            cleanWarning(warnId);
            document.emailIsGood = true;
        } else {
            printWarning(email, warnId, fieldName + ' must be written like this: mytestemail@website.com');
            document.emailIsGood = false;
        }

        enableButton();
    }
    function checkUsername(usernameId, warnId, fieldName) {

        var usernamePattern = new RegExp("^([a-zA-Z0-9])([a-zA-Z0-9][._]?)*([a-zA-Z0-9])$");
        var badCharacterPattern = new RegExp("([^a-zA-Z0-9_.])+");
        var badOrderPattern = new RegExp("(^[_.].*)|(.*[_.]$)");

        var username = document.getElementById(usernameId);
        var usernameValue = username.value;

        if (usernameValue.length < 2 || usernameValue.length > 45) { // not longer enough/too long
            printWarning(username, warnId, fieldName + ' must be at least 2 characters and less than 45');
            document.usernameIsGood = false;
        } else if (badCharacterPattern.test(usernameValue)) { // has illegal characters
            printWarning(username, warnId, fieldName + ' must only include these characters: A-Z, 0-9, \'_\', or \'.\'');
            document.usernameIsGood = false;
        } else if (badOrderPattern.test(usernameValue)) {
            printWarning(username, warnId, fieldName + ' cannot begin or end with \'_\' or \'.\'');
            document.usernameIsGood = false;
        } else if (usernamePattern.test(usernameValue)) { // perfect!
            cleanWarning(warnId);
            document.usernameIsGood = true;
        } else {
            warning = document.createTextNode(fieldName + " has experience an unknown error. Please contact Sarah.");
            document.usernameIsGood = false;
        }

        warnBox.innerHTML = '';
        warnHolder.appendChild(warning);
        warnBox.appendChild(warnHolder);

        enableButton();
    }
    function checkPassword(passwordId, warnId, fieldName) {

        var password = document.getElementById(passwordId);
        var passwordValue = password.value;

        if (passwordValue.length < 6 || passwordValue.length > 20) {
            printWarning(password, warnId, fieldName + ' must be between 6 and 20 characters long.');
            document.passwordIsGood = false;
        } else if (passwordValue.length >= 6 && passwordValue.length <= 20) {
            cleanWarning(warnId);
            document.passwordIsGood = true;
        } else {
            printWarning(password, warnId, fieldName + ' has experience an unknown error. Please contact Sarah.');
            document.passwordIsGood = false;
        }

        enableButton();
    }
    function checkMatchingPassword(firstPasswordId, secondPasswordId, warnId, fieldName) {

        var firstPassword = document.getElementById(firstPasswordId);
        var firstPasswordValue = firstPassword.value;

        var secondPassword = document.getElementById(secondPasswordId);
        var secondPasswordValue = secondPassword.value;

        if (firstPasswordValue === secondPasswordValue) {
            cleanWarning(warnId);
            document.confirmPasswordIsGood = true;
        } else {
            printWarning(secondPassword, warnId, fieldName + ' must match.');
            document.confirmPasswordIsGood = false;
        }

        enableButton();
    }

    function cleanWarning(warnId) {
        var warnBox = document.getElementById(warnId);
        warnBox.innerHTML = '';
    }
    function printWarning(inputFieldId, warnId, warningText) {
        var warnBox = document.getElementById(warnId);
        var warnHolder = document.createElement("div");

        warningText = document.createTextNode(warningText);
        inputFieldId.value = '';
        warnHolder.className = 'warn-holder';
        warnBox.innerHTML = '';
        warnHolder.appendChild(warningText);
        warnBox.appendChild(warnHolder);
    }
</script>
</body>
</html>