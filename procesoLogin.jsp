<%-- 
    Document   : procesoLogin
    Created on : 04-mar-2019, 21:19:28
    Author     : ODLana
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            request.setCharacterEncoding("UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement s = conexion.createStatement();
            
            String email = request.getParameter("email");
            String contra = request.getParameter("contra");
            int IdTra = 0;
            boolean comprob = false;
            int rol = 0;
            
            ResultSet listado = s.executeQuery("SELECT EmaTra, ConTra, CodTra FROM trabajador");
            while (listado.next()) {
                if (email.equals(listado.getString("EmaTra"))) {
                    if (contra.equals(listado.getString("ConTra"))) {
                        comprob = true;
                        IdTra = listado.getInt("CodTra");
                    }
                }
            }
            
            if (comprob) {
                
                session.setAttribute("codigo", IdTra);
                session.setAttribute("email", email);
                session.setAttribute("ciuAdd", 0);
                %><script>
                    location.replace("panel.jsp");
                </script><%
                    
            } else {
                %><script>
                    location.replace("index.jsp");
                </script><%
            }
        %>
        
    </body>
</html>
