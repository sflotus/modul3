<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2/17/2024
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOG IN</title>
    <style><%@include file="style.css"%></style>
</head>
<body>
    <div class="container">
        <!--Data or Content-->
        <div class="box-1">
            <div class="content-holder">
                <h2>Hello!</h2>
                <button class="button-1" onclick="signup()">Sign up</button>
                <button class="button-2" onclick="login()">Login</button>
            </div>
        </div>
        <!--Forms-->
        <div class="box-2">
            <div class="login-form-container">
                <h1>Login Form</h1>
                <input type="text" placeholder="Username" class="input-field">
                <br><br>
                <input type="password" placeholder="Password" class="input-field">
                <br><br>
                <button class="login-button" type="button">Login</button>
            </div>
            <!--Create Container for Signup form-->
            <div class="signup-form-container">
                <h1>Sign Up Form</h1>
                <input type="text" placeholder="Username" class="input-field">
                <br><br>
                <input type="email" placeholder="Email" class="input-field">
                <br><br>
                <input type="password" placeholder="Password" class="input-field">
                <br><br>
                <button class="signup-button" type="button">Sign Up</button>
            </div>
        </div>
    </div>
    <script type="text/javascript"><%@include file="script.js" %></script>
</body>
</html>
