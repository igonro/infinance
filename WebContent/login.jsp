<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Infinance Login Webpage">
    <meta name="author" content="Infinance Team">


    <link rel="icon" href="favicon.png">
    <title>Infinance</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="css/login.css">
  <style id="style-1-cropbar-clipper">
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style></head>
  <body>
    <header>
      <!-- NAVBAR -->
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#"><img src="img/infinance-web-icon.svg" width="30" height="30" class="d-inline-block align-top" alt=""> Infinance</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="/infinance/home">Inicio<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Acerca de</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="/infinance/about-project">Proyecto</a>
                <a class="dropdown-item" href="/infinance/about-team">Equipo</a>
                <a class="dropdown-item" href="/infinance/about-contact">Contacto</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="/infinance/register">Registrarse</a>
            </li>
          </ul>
        </div>
      </nav>
      <!-- NAVBAR -->
    </header>

    <!-- LOGIN FORM -->
    <form class="form-login text-center" action="/infinance/login" method="post">
      <img class="mb-4" src="img/login-user.svg" alt="" width="128" height="128">
      <h1 class="h3 mb-3 font-weight-normal">Por favor, inicie sesión</h1>
      <label for="inputUser" class="sr-only">Usuario</label>
      <input id="inputUser" class="form-control" placeholder="Usuario" required="true" autofocus="" type="text" name="user">
      <label for="inputPassword" class="sr-only">Contraseña</label>
      <input id="inputPassword" class="form-control" placeholder="Contraseña" required="true" type="password" name="password">
      <div class="checkbox mb-3">
        <label>
          <input value="remember-me" type="checkbox"> Recordarme
        </label>

      </div>
                  <c:if test="${not empty errorMessage}">
      <c:out value="${errorMessage}"/>
    </c:if>
      <button id="loginButton" class="btn btn-lg btn-primary btn-block" type="submit">Iniciar sesión</button>
      <p class="mt-5 mb-3 text-muted">© 2017-2018 Infinance Project</p>
    </form>

    <!-- LOGIN FORM -->

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>
  </body>
</html>
