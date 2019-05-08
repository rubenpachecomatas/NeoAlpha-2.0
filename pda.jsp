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
            
            request.setCharacterEncoding("UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement s = conexion.createStatement();
            
            Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_alpha", "root", "");
            Statement t = conexion2.createStatement();
            
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
        
        <div id="panel" class="jumbotron bg-transparent text-info text-center">
            <hr class="my-4">
            <hr class="my-4">
            <div class="row">
                <div class="col-sm-12 col-md-6 text-center">
                    <img src="img/neoalphaloading.gif" width="80%" alt="NeoAlpha">
                </div>
                <div class="col-sm-12 col-md-6 text-center">
                    <p class="display-4">¿Te encuentras bien?</p>
                    <hr class="my-4">
                    <div>
                        <h3><i class="fas fa-check text-success" style="font-size: 2em; padding: 3%;"></i></h3>
                        <h3 class="text-light">Es normal sentirse desorientado al principio. Algunos sujetos pueden experimentar nausas, mareos o vomitos mientras hacen uso
                        del equipo de trabajo. Por suerte, la mayoría de trabajadores suelen acostumbrarse pasados un par de días.</h3>
                        <h3><i class="fas fa-times text-danger" style="font-size: 2em; padding: 3%;"></i></h3>
                        <h3 class="text-danger">Y si ese no es el caso, simplemente serás traslado a otro puesto en base a tu historial.</h3>
                    </div>
                    <hr class="my-4">
                </div>
            </div>
        </div>
        <hr class="my-4">
        <hr class="my-4">
        <div id="panel" class="jumbotron bg-transparent text-info text-center">
            <hr class="my-4">
            <hr class="my-4">
            <div class="row">
                <div class="col-sm-12 col-md-6 text-center">
                    <p class="display-4">¿Qué debo hacer?</p>
                    <hr class="my-4">
                    <div>
                        <p></p>
                        <h3 class="text-light">Es muy sencillo. Como empleado en el centro de control de fronteras deberás añadir, borrar o modificar los datos de nuestros
                        habitantes, la información de miles de personas está en tus manos.</h3>
                        <h3 class="text-light">Conforme más y más habitantes crucen nuestra frontera gracias a tu trabajo, tu barra de progreso laboral irá en aumento.</h3>
                        <h3 class="text-light">Si tu barra de progreso laboral se llena, serás promovido a un nuevo puesto y recibirás un aumento salarial.</h3>
                        <h3><i class="fas fa-cogs" style="font-size: 3em; padding: 4%;"></i></h3>
                        <h3 class="text-light">Eso es todo. Y recuerda...</h3>
                        <h2 class="text-primary">NeoAlpha cuenta contigo.</h2>
                    </div>
                    <hr class="my-4">
                </div>
                <div class="col-sm-12 col-md-6 text-center">
                    <img src="img/pdaEx.png" width="80%" alt="NeoAlpha">
                </div>
            </div>
        </div>
        
    </body>
</html>