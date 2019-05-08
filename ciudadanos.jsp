<%-- 
    Document   : ciudadanos
    Created on : 05-mar-2019, 1:05:05
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

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body style="background-color: black;">

        <%

            if (session.getAttribute("email") == null) {
                response.sendRedirect("index.jsp");
            }

            request.setCharacterEncoding("UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement s = conexion.createStatement();

            Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement t = conexion2.createStatement();

            Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement r = conexion3.createStatement();

            Connection conexion4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement q = conexion4.createStatement();

            Connection conexion5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement p = conexion5.createStatement();

            Connection conexion6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement u = conexion6.createStatement();

            Connection conexion7 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement x = conexion7.createStatement();

            String estado = (request.getParameter("CodPer") == null) ? "listado" : "edicion";

        %>

        <nav class="navbar navbar-expand-lg navbar-dark bg-info text-light">
            <a class="navbar-brand" href="panel.jsp"><i class="fab fa-asymmetrik" style="font-size: 3em;"></i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="panel.jsp">Información <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ciudadanos.jsp">Ciudadanos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="pda.jsp">PDA</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Log out</a>
                    </li>
                </ul>
            </div>
        </nav>

        <hr class="my-4">
        <table style="width: 80%; text-align: center; margin: 0 auto;" class="table table-info" width="50%">
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Nacionalidad</th>
                <th>Edad</th>
                <th>Trabajo</th>
                <th></th>
            </tr>
            <form action="<%= estado.equals("listado") ? "añadirUsuario.jsp" : "modificarUsuario.jsp"%>" method="GET">

                <tr>
                    <td>
                        <div class="form-group">
                            <input
                                value="<%= estado.equals("edicion") ? request.getParameter("NomPer") : ""%>"
                                name="nombre"
                                placeholder="Introduzca el nombre"
                                type="text"
                                class="form-control">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input
                                value="<%= estado.equals("edicion") ? request.getParameter("ApePer") : ""%>"
                                name="apellido"
                                placeholder="Introduzca el apellido"
                                type="text"
                                class="form-control">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <select id="nacionalidad" name="nacionalidad" class="form-control">
                                <%
                                    if (estado.equals("edicion")) {
                                        ResultSet nacionPred = u.executeQuery("Select CodNac, NomNac FROM nacionalidad WHERE CodNac = " + request.getParameter("CodNac"));
                                        while (nacionPred.next()) {
                                %><option value="<%=nacionPred.getInt("CodNac")%>"><%=nacionPred.getString("NomNac")%></option><%
                                    }
                                    ResultSet nacion = q.executeQuery("Select CodNac, NomNac FROM nacionalidad WHERE CodNac != " + request.getParameter("CodNac"));
                                    while (nacion.next()) {
                                %><option value="<%=nacion.getInt("CodNac")%>"><%=nacion.getString("NomNac")%></option><%
                                    }
                                } else {
                                    ResultSet nacionLis = x.executeQuery("Select CodNac, NomNac FROM nacionalidad");
                                    while (nacionLis.next()) {
                                    %><option value="<%=nacionLis.getInt("CodNac")%>"><%=nacionLis.getString("NomNac")%></option><%
                                            }
                                        }
                                    %>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <%
                                String edadD = "";
                                if (estado.equals("edicion")) {
                                    String edad = request.getParameter("EdaPer");
                                    edadD = edad.substring(0, 2);
                                }
                            %>
                            <input
                                value="<%= estado.equals("edicion") ? edadD : ""%>"
                                name="edad"
                                type="number"
                                placeholder="Edad"
                                min="18"
                                max="99"
                                class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="hidden" id="CodPer" name="CodPer" value="<%= estado.equals("edicion") ? request.getParameter("CodPer") : ""%>">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <select id="trabajo" name="trabajo" class="form-control">
                                <%
                                    if (estado.equals("edicion")) {
                                        ResultSet trabaPred = p.executeQuery("Select CodTra, NomTra FROM trabajo WHERE CodTra= " + request.getParameter("CodTra"));
                                        while (trabaPred.next()) {
                                %><option value="<%=trabaPred.getInt("CodTra")%>"><%=trabaPred.getString("NomTra")%></option><%
                                    }
                                    ResultSet traba = p.executeQuery("Select CodTra, NomTra FROM trabajo WHERE CodTra != " + request.getParameter("CodTra"));
                                    while (traba.next()) {
                                %><option value="<%=traba.getInt("CodTra")%>"><%=traba.getString("NomTra")%></option><%
                                    }
                                } else {
                                    ResultSet traba = p.executeQuery("Select CodTra, NomTra FROM trabajo");
                                    while (traba.next()) {
                                    %><option value="<%=traba.getInt("CodTra")%>"><%=traba.getString("NomTra")%></option><%
                                            }
                                        }
                                    %>
                            </select>
                        </div>
                    </td>
                    <td>
                        <%
                            if (estado.equals(
                                    "listado")) {
                        %>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-user-plus"></i></button>
                            <%
                                }

                                if (estado.equals(
                                        "edicion")) {
                            %>
                        <button type="submit" class="btn btn-success"><i class="fas fa-check"></i></button>

                        <a href="ciudadanos.jsp">
                            <button type="button" class="btn btn-dark"><i class="fas fa-times"></i></button>
                        </a>
                        <%
                            }
                        %>
                    </td>
                </tr>
        </table>
        <hr class="my-4">
        <table style="width: 80%; text-align: center; margin: 0 auto;" class="table table-info" width="50%">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Nacionalidad</th>
                <th>Edad</th>
                <th>Trabajo</th>
            </tr>
        </form>
        <%
            ResultSet listado = s.executeQuery("SELECT * FROM persona");
            while (listado.next()) {
                ResultSet nacionalidad = t.executeQuery("SELECT * FROM nacionalidad WHERE CodNac =" + listado.getInt("CodNac"));
                while (nacionalidad.next()) {
                    ResultSet trabajo = r.executeQuery("SELECT * FROM trabajo WHERE CodTra =" + listado.getInt("CodTra"));
                    while (trabajo.next()) {
        %>
        <tr>
            <td><%= listado.getInt("CodPer")%></td>
            <td><%= listado.getString("NomPer")%></td>
            <td><%= listado.getString("ApePer")%></td>
            <td><%= nacionalidad.getString("NomNac")%></td>
            <td><%= listado.getInt("EdaPer")%></td>
            <td><%= trabajo.getString("NomTra")%></td>
            <td>
                <a class="btn btn-light"
                   href="ciudadanos.jsp?CodPer=<%= listado.getInt("CodPer")%>
                   &NomPer=<%= listado.getString("NomPer")%>
                   &ApePer=<%= listado.getString("ApePer")%>
                   &CodNac=<%= nacionalidad.getInt("CodNac")%>
                   &EdaPer=<%= listado.getInt("EdaPer")%>
                   &CodTra=<%= trabajo.getInt("CodTra")%>" role="button">

                    <i class="fas fa-pencil-alt"></i>

                </a>

                <a class="btn btn-danger" href="borrarUsuario.jsp?CodPer=<%= listado.getString("CodPer")%>" role="button"><i class="fas fa-times-circle"></i></a>
            </td>
        </tr>
        <% 
                    }
                }
            }
        %>

    </table>
</body>
</html>
