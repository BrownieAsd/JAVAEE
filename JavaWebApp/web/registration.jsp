<%-- 
    Document   : registration
    Created on : 11/01/2023, 9:46:39 am
    Author     : Guest user
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Driver" %>
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
        <% 
         String login = request.getParameter("login"); 
         String password = request.getParameter("password"); 
        
         if(password.length()<8){
                response.sendRedirect("http://localhost:8080/WebApplication5/register.jsp?error=password_needs_min_8_symbols"); 
            }
       
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE login = '" + login + "' AND password = '" + password + "'");
        ResultSet x = ps.executeQuery(); 
          
        if(x.next())
           {
         //HttpSession session = request.getSession();
           response.sendRedirect("http://localhost:8080/WebApplication5/register.jsp?error=password_or_login_in_use"); 
         
           }        
        else 
        {
          PreparedStatement ps1 = conn.prepareStatement("INSERT INTO users(login,password) VALUES ('" + login + "','" + password + "');");
          ps1.executeUpdate();
          session.setAttribute("loggedin", "true");
          session.setAttribute("id_k", x.getInt(1));
          session.setAttribute("name", x.getString(2));
          response.sendRedirect("http://localhost:8080/WebApplication5/mainpage.jsp");  
        }
        
        }
        
        catch(Exception e)
        {
       //out.println(e);
                  response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  

        }
        
        
        
            
       
        %>
    </body>
</html>
