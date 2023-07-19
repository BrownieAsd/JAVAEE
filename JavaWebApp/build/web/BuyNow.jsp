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
        int oid=0; 
         
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM cart where user_id='"+session.getAttribute("id_k")+"';");
        PreparedStatement ps3 = conn.prepareStatement("SELECT MAX(order_id) FROM orders;");
        ResultSet x = ps.executeQuery();
        ResultSet y = ps3.executeQuery();
        if(y.next()){
            oid = y.getInt(1);
            oid++;
        }
        else{
            response.sendRedirect("http://localhost:8080/WebApplication5/Cart.jsp"); 

        }
        while(x.next()){
        PreparedStatement ps1 = conn.prepareStatement("INSERT INTO orders(user_id,product_id,order_id,r_id) VALUES ("+session.getAttribute("id_k")+","+x.getInt(3)+","+oid+",0);");
        ps1.executeUpdate(); 
        }
        PreparedStatement ps2 = conn.prepareStatement("DELETE FROM Cart WHERE user_id='"+session.getAttribute("id_k")+"';");
        ps2.executeUpdate(); 
        response.sendRedirect("http://localhost:8080/WebApplication5/Cart.jsp"); 
         
        
        }
        catch(Exception e)
        {
        out.println(e);
                    

        }
        
        
        
        
            
       
        %>
    </body>
</html>
