<%-- 
    Document   : register
    Created on : 11/01/2023, 9:36:04 am
    Author     : Guest user
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TBGames.com</title>
    </head>
    <body>
        <header>
            <p class="p1">Welcome to TBGames.com</p>
        </header>
        <div class="main">
            <h1>Hello and welcome to our GameStore!</h1>
            <h2>we offer a variety of games and consoles, more on the way!</h2>
            <br><!-- comment -->
            <h2>Please sign up:</h2>
            <form method="post" action="registration.jsp">
        Login: <br />
        <input type="text" name="login" /><br /> 
        Password: <br />
        <input type="password" name="password" /><br /> 
        <br />
        <input type="submit" value="Sign up">
        </form>
            <p>Already a user?</p>
            <a href="index.jsp">Log in</a>
        </div>
    </body>
</html>
