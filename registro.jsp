<%-- 
    Document   : registro
    Created on : 04-mar-2019, 19:53:06
    Author     : ODLana
--%>

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
    <body body style="background-image: url('img/fondo.jpg'); background-repeat: no-repeat; background-size: cover; ">
        
        <form class="form-horizontal" method="post" action="procesoRegistro.jsp" style="width: 20%; text-align: left; margin-left: 75%; margin-top: 12%; padding: 2%; background-color: white; border: 6px solid rgb(23,182,164);">
        <fieldset>

        <!-- Form Name -->
        <div style="text-align: center; padding-bottom: 5%;">
            <img src="img/cabeceraN.png" alt="Blah" width="100%">
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-12 control-label" for="nombre">Nombre</label>  
          <div class="col-md-12">
          <input id="nombre" name="nombre" type="text" placeholder="Introduzca su nombre" class="form-control input-md" required="">

          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-12 control-label" for="apellido">Apellido</label>  
          <div class="col-md-12">
          <input id="apellido" name="apellido" type="text" placeholder="Introduzca su apellido" class="form-control input-md" required="">

          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-12 control-label" for="email">E-mail</label>  
          <div class="col-md-12">
          <input id="email" name="email" type="text" placeholder="Introduzca su Email" class="form-control input-md" required="">

          </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
          <label class="col-md-12 control-label" for="contra">Contraseña</label>
          <div class="col-md-12">
            <input id="contra" name="contra" type="password" placeholder="Introduzca su contraseña" class="form-control input-md" required="">

          </div>
        </div>

        <!-- Button -->
        <div class="form-group">
          <label class="col-md-5 control-label" for="signin"></label>
          <div class="col-md-5" style="margin: 0 auto;">
            <button id="signin" name="signin" class="btn btn-primary">Sign In</button>
          </div>
        </div>

        </fieldset>
        </form>

        
    </body>
</html>
