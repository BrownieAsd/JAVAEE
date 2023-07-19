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
        <a href="mainpage.jsp">Main Page</a><br><a href="logout.jsp">Logout</a>
    
    <BR>   
    <H1>       
        Username: <%=session.getAttribute("name") %>
    
    <BR>
    <H1>
        </div>
        <br><!-- comment -->
        <div class="main">
            <h1>
                Cart:
            </h1>
            <br>
         <% 
        Float sum=0.0f;
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc_sample","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT p.name,p.price,c.product_id FROM Products p,Cart c WHERE c.product_id=p.id AND c.user_id="+session.getAttribute("id_k")+";");
        ResultSet x = ps.executeQuery(); 
          
         while(x.next())
        {
        String name1 = x.getString(1);;
        Float price = x.getFloat(2);
        int id = x.getInt(3);
        sum+=price;
       out.println(
        "<div class = 'main'> "+ name1 + "<br>" + "price(USD): " + price + "<br><form action ='removeFromCart.jsp' method = 'post'> <input type='hidden' name = 'id_prod' value ='"+id+"'> <input type='submit' value='remove from cart'> </form>" +"  </div><br><br>");
        }
        out.println(
        "<br><div class = 'main'> Sum(USD): " + sum + "<br><form action ='BuyNow.jsp' method = 'post'> <input type='hidden' name = 'id_prod' > <input type='submit' value='Buy Now'> </form>" +"  </div><br><br>");
        }
        
        
        catch(Exception e)
        {
        out.println(e);

        }
        
        
        
            
       
        %>
            
            
        </div>
        
    </body>
</html>
