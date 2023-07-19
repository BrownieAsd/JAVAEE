<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<% 
if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  
}
%>

<%-- 
    Document   : addToCart
    Created on : 11/01/2023, 1:14:16 pm
    Author     : Guest user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TBGames.com</title>
    </head>
    <body>
        <% 
         
         
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("UPDATE orders SET r_id=1 WHERE order_id="+request.getParameter("id_prod")+";");
        ps.executeUpdate(); 
        response.sendRedirect("http://localhost:8080/WebApplication5/admin.jsp"); 
         
        
        }
        catch(Exception e)
        {
        out.println(e);
                    

        }
        
        
        
        
            
       
        %>
    </body>
</html>
