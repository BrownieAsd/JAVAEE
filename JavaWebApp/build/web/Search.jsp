<%-- 
    Document   : mainpage
    Created on : 11/01/2023, 9:45:01 am
    Author     : Guest user
--%>
<% if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  
}
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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
            <div class="main">
    <H1>       
        <a href="mainpage.jsp">Main Page</a><br><a href="login.jsp">My Page</a><br><a href="logout.jsp">Logout</a><br><a href=Cart.jsp>Cart</a>
    
    <BR>
       <div class="main">
            <form  method="post" action="Result.jsp" style="top:130%">
            <h1>Search:</h1>
            <input type="text" name="search"><br>
            

            <input type="submit" style="margin-bottom: 20px;" value="search"/>
            </form>
        </div>
       
    </body>
</html>
