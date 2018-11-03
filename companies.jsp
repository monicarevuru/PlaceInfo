<%-- 
    Document   : main
    Created on : Oct 9, 2018, 9:30:11 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<title>Guide</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
  body {font-family: "Lato", sans-serif}
  .mySlides {display: none}
  </style>
  <body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card w3-padding-large">

    <div class="w3-display-left w3-small" style="padding:16px 16px">
    	<a href="index.jsp" class="w3-bar-item w3-padding-large"><img src="./images/logo.png" style="width:170px"></a>
    </div>
    <div class="w3-display-middle w3-large">
    	<a href="index.jsp" class="w3-bar-item w3-padding-large"><b>PlaceInfo</b></a>
    </div>
    <div class="w3-right w3-large">
        
      <a href="about.jsp" class="w3-bar-item w3-button">About</a>
      <a href="resources.jsp" class="w3-bar-item w3-button">Resources</a>
      <a href="companies.jsp" class="w3-bar-item w3-button">Companies</a>
      <%if(session.getAttribute("user") == null)
        {%>
            <a href="signin.html" class="w3-bar-item w3-button">Sign-in</a>
      <%
        }
        else
        {%>
            <a href="#" class="w3-bar-item w3-button"><%String name=(String)session.getAttribute("user");  
out.print(name);%></a>
            <a href="logout.jsp" class="w3-bar-item w3-button">Logout</a>
            <%}%>


    </div>
  </div>
</div>
<%
            Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
                                     String qp="select * from companies";
                                                  PreparedStatement p=con.prepareStatement(qp);
       
                                                  ResultSet r=p.executeQuery();%><br>
                                                  
  <center>
<style>

table, th, td {
    border: 1px solid black;
    text-align: center;

}
</style>
             <table>
  <tr>
    <th>Company Name</th>
    <th>     Job Profile </th>
    <th>   CTC    </th>
    <th> Status</th>
  </tr>
   <%
             while(r.next())
             {
                 String cname = r.getString(1);
                   String jp = r.getString(2);
                   String ctc = r.getString(3);
                   String status = r.getString(4);
                   
   %>
  <tr>
    <td><%=cname%></td>
   
    <td> <%=jp%> </td>
    <td> <%=ctc%> </td>
    <td> <%=status%> </td>
  </tr>       
 <% }
    %>     
    
    
       
<style>
table, th, td {
    border: 1px solid black;
    text-align: center;
}
</style>
<br><br>
<br>

</center>


</body>
</html>
