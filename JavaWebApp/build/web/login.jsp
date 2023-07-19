<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%  
    String name="admin";
    if(name.equals(session.getAttribute("name"))){
        response.sendRedirect("http://localhost:8080/WebApplication5/admin.jsp");
    }
        
%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    <H1>       
        Username: <%=session.getAttribute("name") %>
        </div>
        <br><!-- comment -->
        <div class="main">
            <h1>
                Purchases:
            </h1>
            <br>
         <% 
       
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT p.name,p.price FROM Products p,Orders o WHERE o.product_id=p.id AND o.user_id="+session.getAttribute("id_k")+";");
        ResultSet x = ps.executeQuery(); 
          
         while(x.next())
        {
        String name1 = x.getString(1);;
        Float price = x.getFloat(2);   
        
       out.println(
        "<div class = 'main'> "+ name1 + "<br>" + "price(USD): " + price + "<br></div><br>");
        }
        
        }
        
        catch(Exception e)
        {
        out.println(e);

        }
        
        
        
            
       
        %>
            
            
        </div>
        <br>
        <div class="main">
            <form  method="post" action="editpsw.jsp" style="top:130%">
            <h1>Update password:</h1>
            <input type="text" name="npass"><br>
            

            <input type="submit" style="margin-bottom: 20px;" value="Update password"/>
            </form>
        </div>
    </body>
</html>
