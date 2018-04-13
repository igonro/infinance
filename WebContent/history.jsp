<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Infinance History Webpage">
    <meta name="author" content="Infinance Team">


    <link rel="icon" href="favicon.png">
    <title>Infinance</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="css/history.css">
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
    <header id="header">
      <!-- NAVBAR -->
      <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/infinance/home"><img src="img/infinance-web-icon.svg" width="25" height="25" class="d-inline-block align-top" alt=""> Infinance</a>
        <input class="form-control form-control-dark w-100" placeholder="Buscar" aria-label="Buscar" type="text">
        <ul class="navbar-nav px-3">
          <li class="nav-item text-nowrap">
            <a class="nav-link" href="#"><span data-feather="log-out"></span> Cerrar sesión</a>
          </li>
        </ul>
      </nav>
      <!-- NAVBAR -->
    </header>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="/infinance/portfolio">
                  <span data-feather="briefcase"></span> Mi cartera
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="file-text"></span> Historial <span class="sr-only">(actual)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/infinance/settings">
                  <span data-feather="settings"></span> Configuración
                </a>
              </li>
            </ul>
          </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <h2>Historial de transacciones</h2>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>ID de transacción</th>
                  <th>Ticker symbol</th>
                  <th>Número de acciones</th>
                  <th>Coste unitario</th>
                  <th>Coste total</th>
                  <th>Tipo</th>
                  <th>Fecha</th>
                </tr>
              </thead>
              <tbody>
              
               <c:forEach var="HistoryUser" items="${HistoryUser}">
        
        		  <tr>
                  <td>${HistoryUser.id_transaction}</td>
                  <td>${HistoryUser.id_company}</td>
                  <td>${HistoryUser.num}</td>
                  <td>${HistoryUser.value}</td>
                  <td>${HistoryUser.total_cost}</td>
                  <td>${HistoryUser.transaction}</td>
                   <td>${HistoryUser.dateAction}</td>
                  
                </tr>
     
         		 </c:forEach>
              
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

</body></html>
