<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<% 
if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TBGames.com</title>
    </head>
    <body>
        <% 
         String post2 = request.getParameter("name2"); 
         
       
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE login='"+post2+"';");
        ps.executeUpdate(); 
         response.sendRedirect("http://localhost:8080/WebApplication5/login.jsp");
        
        
        }
        
        catch(Exception e)
        {
        out.println(e);
                    

        }
        
        
        
            
       
        %>
    </body>
</html>
