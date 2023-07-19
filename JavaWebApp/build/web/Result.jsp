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
        <a href="login.jsp">My Page</a><br><a href="logout.jsp">Logout</a><br><a href=Cart.jsp>Cart</a><br><a href="Search.jsp">Search</a>
    
    <BR>
        

    <H1>
        </div>
            
        </header>
        <br>
        <div class="main">
            <% 
            String search=request.getParameter("search"); 
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products p, Consoles c Where p.console=c.id AND p.name='"+search+"';");
        ResultSet x = ps.executeQuery(); 
          
         while(x.next())
        {
        int id=x.getInt(1);
        String name = x.getString(2);
        String producer = x.getString(3);
        String Console = x.getString(4);
        Float price = x.getFloat(5);
        String image = x.getString(7); 
        String description = x.getString(8); 
        
        
       out.println(
        "<div style = 'main'> <img src = '" + image +  "' style='width:300px; height:300px; margin:10px; opacity:1.0;  border-radius: 25px; z-index:20;'>" +  "<br> " + 
         name + "<br>"+ "<br>"+producer+ "<br>Console: "+Console + " price(USD): " + price + "<br>" + "description: " + description + "<br>" + "<form action ='addToCart.jsp' method = 'post'> <input type='hidden' name = 'id_prod' value ='"+id+"'> <input type='submit' value='Add To Cart'> </form>" +"  </div><br><br>");
        }
        
        }
        
        catch(Exception e)
        {
        out.println(e);

        }
        
        
        
            
       
        %>
            
        </div>
    </body>
</html>
