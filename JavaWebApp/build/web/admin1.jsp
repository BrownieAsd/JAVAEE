<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<% if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/WebApplication5/index.jsp");  
}
%>
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
    <H1>       
        <a href="mainpage.jsp">Main Page</a><br><a href="logout.jsp">Logout</a><br><a href=Cart.jsp>Cart</a>
    
    <BR>
        

    <H1>
        </div>
       
        
        <br>
        <div class="main">
    <form class="form" method="post" action="delete.jsp" style="top:105%">
   <fieldset>
    <legend class="font">Delete Post</legend>
    <% 
         
  
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT name FROM Products");
        ResultSet x = ps.executeQuery();
        out.println("<select name='name'>");  
        while(x.next())
           {
           String name = x.getString(1);
           out.println("<option >"+name+"</option>");
           
           }        
        out.println("</select>"); 
        
        }
        catch(Exception e)
        {
        out.println(e); 
        }
        
        
        
            
       
        %>

</br>
<input type="submit" name="delete" value="Delete post"/>
</form>
</fieldset>
        </div>
        <br>
        <div class="main">
     <form class="form" method="post" action="delete_usr.jsp" style="top:105%">  
     <fieldset>
    <legend class="font">Delete User</legend>
    <% 
         
  
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT login FROM Users");
        ResultSet x = ps.executeQuery();
        out.println("<select name='name2'>");  
        while(x.next())
           {
           String name = x.getString(1);
           out.println("<option >"+name+"</option>");
           
           }        
        out.println("</select>"); 
        
        }
        catch(Exception e)
        {
        out.println(e); 
        }
        
        
        
            
       
        %>

</br>
<input type="submit" name="deleteuser" value="Delete user"/>
</form>

</fieldset>
        </div> 
         <div class="main">
    <H1>       
    All Orders:
    
    <BR>
         <% 
        
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT user_id,order_id,r_id FROM orders");
        ResultSet x = ps.executeQuery(); 
         while(x.next())
        {
        int oid = x.getInt(2);
        int status = x.getInt(3);
        
        out.println("<div class = 'main'");
        if(status==1){out.println("style='color:green'");}
        out.println("><h3>Order id:"+oid+"");
         
        
        
         out.println("<br>Status:"+status+"<form action ='changeStatus.jsp' method = 'post'> <input type='hidden' name = 'id_prod' value='"+oid+"'> <input type='submit' value='Ship'> </form></h3></div>");
         
         
         }
        
        }
        
        catch(Exception e)
        {
        out.println(e);

        }
        %>

    </H1>
        </div>
        <div class="main">
    <H1>       
    All Orders:
    
    <BR>
         <% 
        int temp=0;
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM orders");
        ResultSet x = ps.executeQuery(); 
         while(x.next())
        {
        int name = x.getInt(2);
        int oid = x.getInt(4);
        int product = x.getInt(3);
        
        
        if(temp!=oid){
        out.println("<h2>User id:"+name+"<br>Order id:"+oid+"<br>");
         }
         out.println("Product id:"+product+"<br>");
         if(temp!=oid){
         out.println("");
         }
         temp=oid;
         }
        
        }
        
        catch(Exception e)
        {
        out.println(e);

        }
        %>

    </H1>
        </div>
        
    </body>
</html>
