<%-- 
    Document   : logging
    Created on : 11/01/2023, 1:32:39 pm
    Author     : Guest user
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TBGames.com</title>
    </head>
    <body>
        <% 
         String login = request.getParameter("login"); 
         String password = request.getParameter("password"); 
        
        if((login.equals("admin")) && (password.equals("admin")))
        {
            session.setAttribute("loggedin", "true");
            session.setAttribute("name", login);
            response.sendRedirect("http://localhost:8080/WebApplication5/admin.jsp"); 
        }
        else 
        {
       
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE login = '" + login + "' AND password = '" + password + "'");
        ResultSet x = ps.executeQuery(); 
          
        if(x.next())
           {
         //HttpSession session = request.getSession();
          session.setAttribute("loggedin", "true");
          session.setAttribute("id_k", x.getInt(1));
          session.setAttribute("name", x.getString(2));
          response.sendRedirect("http://localhost:8080/WebApplication5/mainpage.jsp"); 
         
           }        
        else 
        {
          session.setAttribute("loggedin", "false");
          response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  
        }
        
        }
        
        catch(Exception e)
        {
        out.println(e); 
        }
        }
        
        
            
       
        %>
    </body>
</html>
