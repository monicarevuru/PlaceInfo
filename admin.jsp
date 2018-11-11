<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>


 
        <%
            String aid="";
            String apasswd="";
                    
            String id=request.getParameter("aname");
            String passd=request.getParameter("apass");           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
            
            String q="select pass from admin where uadmin=?";
             PreparedStatement pss=con.prepareStatement(q);
             pss.setString(1,id);
             

             ResultSet r =pss.executeQuery();
           
             if(r.next())
             {
                apasswd=r.getString(1);                 
                if(apasswd.equals(passd))
                {
                    session = request.getSession();
                    session.setAttribute("user",id);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
                else
                { 
                %>
                <script>
                    alert("Username or Password incorrect");
                    location.href = "/Placeinfo/admin.html";
                </script>
                <%
                  //response.sendRedirect(request.getContextPath() + "/admin.html");}
             }
        }
        else{
                %>
                <script>
                    alert("Username or Password in correct");
                    location.href = "/Placeinfo/signin.html";
                </script>
                <%
}
        %>
