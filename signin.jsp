<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>


 
        <%
            String sid="";
            String spasswd="";
                    
            String id=request.getParameter("Username");
            String passd=request.getParameter("Password");           
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
            
            String q="select password from student where username=?";
             PreparedStatement pss=con.prepareStatement(q);
             pss.setString(1,id);
             

             ResultSet r =pss.executeQuery();
           
       
             if(r.next())
             {
                spasswd=r.getString(1);                 
                if(spasswd.equals(passd))
                {
                    session = request.getSession();
                    session.setAttribute("user",id);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
              }
              else
              {
                  response.sendRedirect(request.getContextPath() + "/signin.html");
              }
             }
                %>