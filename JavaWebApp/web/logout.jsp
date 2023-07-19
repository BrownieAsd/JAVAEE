<%-- 
    Document   : logout
    Created on : 11/01/2023, 9:43:56 am
    Author     : Guest user
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<% 
session.setAttribute("loggedin", "false");
response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TBGames.com</title>
    </head>
    <body>
        <h1>Error t1: Logout Page not working correctly. Please contact:</h1>
    <mailto>tbgames@tbg.com</mailto>
    </body>
</html>
