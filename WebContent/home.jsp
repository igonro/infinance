<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Infinance Home Webpage">
    <meta name="author" content="Infinance Team">


    <link rel="icon" type="image/png" href="favicon.png" />
    <title>Infinance</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<link rel="stylesheet" href="css/home.css" />
    
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
              <a class="nav-link" href="#"><span data-feather="home"></span> Inicio<span class="sr-only">(actual)</span></a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span data-feather="info"></span> Acerca de</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="/infinance/about-team"><span data-feather="users"></span> Sobre nosotros</a>
                <a class="dropdown-item" href="/infinance/about-contact"><span data-feather="mail"></span> Contacto</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="/infinance/login"><span data-feather="log-in"></span> Iniciar sesión</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/infinance/register"><span data-feather="user-plus"></span> Registrarse</a>
            </li>
          </ul>
        </div>
      </nav>
      <!-- NAVBAR -->
    </header>

    <main role="main">
      <!-- CAROUSEL -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1" class=""></li>
          <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="img/home-diap1.jpg" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Primera diapositiva.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas
eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id
dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Segunda diapositiva.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas
eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id
dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>Tercera diapositiva.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas
eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id
dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Siguiente</span>
        </a>
      </div>
      <!-- CAROUSEL -->
      <!-- FEATURES -->
      <div class="container marketing">
        <div class="row">

          <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>Heading 1</h2>
            <p>Donec sed odio dui. Etiam porta sem malesuada magna
mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent
commodo cursus magna.</p>
          </div>

          <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>Heading 2</h2>
            <p>Duis mollis, est non commodo luctus, nisi erat porttitor
ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus
sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor
mauris condimentum nibh.</p>
          </div>

          <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>Heading 3</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis
 in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.
 Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
nibh, ut fermentum massa justo sit amet risus.</p>
          </div>

        </div>
      </div>
      <!-- FEATURES -->

      <!-- FOOTER -->
      <hr>
      <footer class="container">
        <p class="float-right"><a href="#">Volver &uarr;</a></p>
        <p>© 2017-2018 Infinance Project</p>
      </footer>
      <!-- FOOTER -->
    </main>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>
  
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace({width: '14', height: '14', viewBox: '0 0 24 24', fill: 'none'})
    </script>
    
  </body>
</html>
