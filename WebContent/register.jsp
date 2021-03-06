<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- METADATA -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Infinance Register Webpage">
	    <meta name="author" content="Infinance Team">
	    <!-- METADATA -->
		<!-- STYLE -->
	    <link rel="icon" href="favicon.png">
	    <title>Infinance</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	    <link rel="stylesheet" href="css/register.css">
	        	  					<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  					<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    	    				<script>var $jq2 = jQuery.noConflict(true);</script>
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
        		<a class="navbar-brand" href="/infinance/home"><img src="img/infinance-web-icon.svg" width="30" height="30" class="d-inline-block align-top" alt=""> Infinance</a>
        		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          			<span class="navbar-toggler-icon"></span>
        		</button>
        		<div class="collapse navbar-collapse" id="navbarCollapse">
          			<ul class="navbar-nav mr-auto">
            			<li class="nav-item active">
              				<a class="nav-link" href="/infinance/home"><span data-feather="home"></span> Inicio<span class="sr-only">(current)</span></a>
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
          			</ul>
        		</div>
      		</nav>
      		<!-- NAVBAR -->
    	</header>
    	<!-- REGISTER FORM -->
    	<form class="form-register text-center" action="/infinance/register" method="post">
      		<img class="mb-4" src="img/register-user.svg" alt="" width="128" height="128">
      		<h1 class="h3 mb-3 font-weight-normal">Formulario de registro</h1>
      		<label for="inputName" class="sr-only">Nombre</label>
      		<input id="inputName" class="form-control" placeholder="Nombre" required="true" autofocus="" type="text" name="name">
      		<label for="inputLastName" class="sr-only">Apellidos</label>
      		<input id="inputLastName" class="form-control" placeholder="Apellidos" required="true" autofocus="" type="text" name="lastName">
      		<label for="inputPhoneNumber" class="sr-only">Teléfono</label>
      		<input id="inputPhoneNumber" class="form-control" placeholder="Teléfono" required="true" autofocus="" type="text" name="phoneNumber">
      		<label for="inputUser" class="sr-only">Usuario</label>
      		<input id="inputUser" class="form-control" placeholder="Usuario" required="true" autofocus="" type="text" name="user">
      		<label for="inputEmail" class="sr-only">Correo electrónico</label>
      		<input id="inputEmail" class="form-control" placeholder="Correo electrónico" required="true" autofocus="" type="email" name="email">
      		<label for="inputPassword" class="sr-only">Contraseña</label>
      		<input id="inputPassword" class="form-control" placeholder="Contraseña" required="true" type="password" name="password">
      		<label for="inputCheckPassword" class="sr-only">Contraseña2</label>
      		<input id="inputCheckPassword" class="form-control" placeholder="Repita su contraseña" required="true" type="password" name="checkPassword">
      		<span id='errormessage'></span>     
            <c:if test="${not empty errorMessage}">
      			<c:out value="${errorMessage}"/>
    		</c:if>
      		<button id="registerButton" class="btn btn-lg btn-primary btn-block" type="submit" onclick="return Validate()">Registrarse</button>
    		<p class="mt-5 mb-3 text-muted">© 2017-2018 Infinance Project</p>
    	</form>

    	
    			<script type="text/javascript">
			function Validate() {
				var password = document.getElementById("inputPassword").value;
				var confirmPassword = document.getElementById("inputCheckPassword").value;
				if (password != confirmPassword) {
					document.getElementById("errormessage").innerHTML = 'Contraseñas no coinciden &#10008;';
					document.getElementById("errormessage").style.color = "red";

					return false;
				}
				if (password.length < 8) {
					document.getElementById("errormessage").innerHTML = 'Contraseña debe tener 8 carateres &#10008;';
					document.getElementById("errormessage").style.color = "red";

					return false;
				}
				return true;
			}
		</script>
    	
    	
    	
    	
    			<script>
		$jq2('#inputCheckPassword').on('keyup', function () {
    if ($jq2(this).val() == $jq2('#inputPassword').val()) {
    	$jq2('#errormessage').html('Contraseñas coinciden &#10004;').css('color', 'green');
    } else $jq2('#errormessage').html('Contraseñas no coinciden &#10008;').css('color', 'red');
});
</script>
    	<!-- REGISTER FORM -->
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
	</body>
</html>