<%-- 
    Document   : procesoRegistro
    Created on : 04-mar-2019, 20:30:18
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

            String insercion = "INSERT INTO trabajador (NomTra, ConTra, EmaTra, ApeTra) ";
            insercion += "VALUES ('";
            insercion += request.getParameter("nombre") + "', '";
            insercion += request.getParameter("contra") + "', '";
            insercion += request.getParameter("email") + "', '";
            insercion += request.getParameter("apellido") + "')";

            s.execute(insercion);
            conexion.close();
        %>
        
        <script>
            location.replace("index.jsp");
        </script>
        
    </body>
</html>
