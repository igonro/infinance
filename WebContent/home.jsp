<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- METADATA -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    	<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Infinance Home Webpage">
	    <meta name="author" content="Infinance Team">
		<!-- METADATA -->
		<!-- STYLE -->
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
		</style>		
		<!-- STYLE -->
	</head>
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
                				<a class="dropdown-item" href="/infinance/about"><span data-feather="users"></span> Sobre nosotros</a>
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
      		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="10000">
        		<ol class="carousel-indicators">
          			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
          			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
        		</ol>
        		<div class="carousel-inner">
          			<div class="carousel-item active">
            			<img class="first-slide img-fluid" src="img/notebook.jpg" alt="First slide">
            			<div class="container">
              				<div class="carousel-caption">
                				<h1 class="display-4 font-weight-bold">Keep it simple</h1><br>
                				<p>¿Quién ha dicho que llevar un seguimiento de tus inversiones tenga que ser algo complejo?</p>
                				<p>En Infinance queremos ayudarte a controlar tus inversiones de una forma sencilla, mostrándote sólo lo que necesitas.</p><br>
                				<p><a class="btn btn-lg btn-primary" href="/infinance/register" role="button">Regístrate ahora</a></p>
              				</div>
            			</div>
          			</div>
          			<div class="carousel-item">
						<img class="second-slide img-fluid" src="img/experts-infinance.jpg" alt="Second slide">
						<div class="container">
					    	<div class="carousel-caption">
					      		<h1 class="display-4 font-weight-bold">Creada por expertos</h1>
					      		<p>Infinance ha sido desarrollado por un grupo de ingenieros expertos en el desarrollo de aplicaciones de finanzas.</p>
					      		<p>Es por ello que ha sido diseñado para ayudar tanto a usuarios avanzados como a principiantes en el mundo de las inversiones.</p><br>
					      		<p><a class="btn btn-lg btn-primary" href="/infinance/about" role="button">Conócenos</a></p>
					    	</div>
					  	</div>
					</div>
          			<div class="carousel-item">
            			<img class="third-slide" src="img/coins.jpg" alt="Third slide">
            			<div class="container">
              				<div class="carousel-caption">
                				<h1 class="display-4 font-weight-bold">100% gratuito</h1>
                				<p>¿Cansado de servicios de pago que prometen aumentar tus beneficios mientras se quedan con parte de ellos?</p>
                				<p>Prueba Infinance. Es una aplicación web completamente gratuita, así todos tus beneficios se quedarán en tu bolsillo.</p><br>
                				<p><a class="btn btn-lg btn-primary" href="/infinance/register" role="button">Regístrate ahora</a></p>
                				<br>
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
          			<div class="col-lg-3">
            			<div class="rounded-circle"><img src="img/business-chart.jpg"></div><br>
            			<h4>Gráficos actualizados</h2>
            			<p>Consulta visualmente el valor de las acciones en sencillos gráficos.</p>
          			</div>
					<div class="col-lg-3">
            			<div class="rounded-circle"><img src="img/control.jpg"></div><br>
            			<h4>Controla tus inversiones</h2>
            			<p>Utiliza la pestaña "Mi cartera" para añadir y vender tus acciones, y hazte con el control de tus beneficios.</p>
          			</div>
          			<div class="col-lg-3">
            			<div class="rounded-circle"><img src="img/history.jpg"></div><br>
            			<h4>Consulta tu historial</h2>
            			<p>Puedes ver tus últimas transacciones rápidamente para analizar tus operaciones.</p>
          			</div>
          			<div class="col-lg-3">
            			<div class="rounded-circle"><img src="img/export-data.jpg"></div><br>
            			<h4>Exporta tus datos</h2>
            			<p>Te ofrecemos la posibilidad de exportar tus datos utilizando nuestro servicio SOAP.</p>
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
	      	<!-- JS SCRIPTS -->
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
			<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>
			<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
			<script>
				feather.replace({width: '14', height: '14', viewBox: '0 0 24 24', fill: 'none'})
			</script>
			<!-- JS SCRIPTS -->
    	</main>
	</body>
</html>
