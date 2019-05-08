<%-- 
    Document   : panel
    Created on : 04-mar-2019, 19:52:52
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
        <title>Panel de Control</title>

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

            String email = (String) session.getAttribute("email");
            int traba = 0;
            String nombre = "";
            int puntos = 0;
            int faltas = 0;
            int nivel = 0;

            ResultSet listado = s.executeQuery("Select CodTra, NomTra, PunTra, FalTra, CodNiv, EmaTra FROM TRABAJADOR");
            while (listado.next()) {
                if (email.equals(listado.getString("EmaTra"))) {
                    traba = Integer.parseInt(listado.getString("CodTra"));
                    nombre = listado.getString("NomTra");
                    puntos = Integer.parseInt(listado.getString("PunTra"));
                    faltas = Integer.parseInt(listado.getString("FalTra"));
                    nivel = Integer.parseInt(listado.getString("CodNiv"));
                }
            }

            session.setAttribute("trabajador", traba);
            session.setAttribute("nom", nombre);
            session.setAttribute("puntosA", puntos);

            String cargo = "";
            float salario = 0;

            ResultSet niveles = t.executeQuery("Select NomNiv, SalNiv FROM nivel WHERE CodNiv = " + nivel);
            while (niveles.next()) {
                cargo = niveles.getString("NomNiv");
                salario = niveles.getFloat("SalNiv");
            }

            int puntosCorte = 0;

            if (nivel == 1) {
                puntosCorte = 5;
            } else if (nivel == 2) {
                puntosCorte = 10;
            } else {
                puntosCorte = 20;
            }

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
        <%            if ((Integer)session.getAttribute("ciuAdd") == 1) {
                session.setAttribute("ciuAdd", 0);
        %>
          <div class="alert alert-success" role="alert">
                Ciudadano añadido.
          </div>
        <%
            }
        %>
        <div id="panel" class="jumbotron bg-transparent text-info text-center" style="padding-top: 2%;">
            <hr class="my-4">
            <hr class="my-4">
            <div class="row">
                <div class="col-sm-12 col-md-6 text-center">
                    <p class="display-4">Hola <% out.println(nombre);%></p>
                    <hr class="my-4">
                    <div>
                        <p></p>
                        <h3 class="text-light">NeoAlpha agradece tus servicios como <% out.println(cargo);%><h3>
                                <hr class="my-4">
                                <hr class="my-4">
                                <h3 class="text-light">Progreso Laboral</h3>
                                <h4 class="text-light">(Esta barra muestra tu avance hasta el siguiente ascenso, cumple con tu labor para recibir aumentos salariales)</h3>
                            <hr class="my-4">
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" style="width: <%= puntos * 100 / puntosCorte%>%" aria-valuenow="<%= puntos%>" aria-valuemin="0" aria-valuemax="<%= puntosCorte%>"></div>
                            </div>
                            <hr class="my-4">
                            <table class="table table-info table-striped">
                                <tr>
                                    <th>Salario Actual</th>
                                </tr>
                                <tr>
                                    <td><%= salario%> <i class="fab fa-autoprefixer"></i></td>
                                </tr>
                            </table>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 text-center" style="padding-top: 5%;">
                    <img src="img/cabecera.png" width="100%" alt="NeoAlpha">
                </div>
            </div>
        </div>

    </body>
</html>
