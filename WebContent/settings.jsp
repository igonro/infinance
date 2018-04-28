<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- METADATA -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Infinance History Webpage">
	    <meta name="author" content="Infinance Team">
	    <!-- METADATA -->
		<!-- STYLE -->
	    <link rel="icon" href="favicon.png">
	    <title>Infinance</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	    <link rel="stylesheet" href="css/settings.css">
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
		<!-- SEARCH BAR SCRIPT -->
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    	<script>var $jq1 = jQuery.noConflict(true);</script>
        <script>
            $jq1(document).ready(function() {
                $jq1(function() {
                    $jq1("#search").autocomplete({
                        source: function(request, response) {
                            $jq1.ajax({
                                url: "CompanyCheck",
                                type: "GET",
                                data: {
                                    term: request.term
                                },
                                dataType: "json",
                                success: function(data) {
                                    response($jq1.map(data, function (value, key) {
                                        console.log(value);
                                        return {
                                            label: value.symbol+' * '+value.name,
                                            value: value.symbol
                                        };
                                    }));
                                }
                            });
                        },
                        select:function(e,ui) { 
                            console.log(ui.item.value); 
                            location.href = '/infinance/company?symbol='+ui.item.value;
                        }
                    });
                });
            });
        </script>
        <!-- SEARCH BAR SCRIPT -->
	</head>
  	<body>
    	<header id="header">
      		<!-- NAVBAR -->
      		<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
        		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/infinance/home"><img src="img/infinance-web-icon.svg" width="25" height="25" class="d-inline-block align-top" alt=""> Infinance</a>
        		<input class="form-control form-control-dark w-100" placeholder="Buscar" aria-label="Buscar" type="text" name="search" id ="search">
        		<ul class="navbar-nav px-3">
          			<li class="nav-item text-nowrap">
            			<a class="nav-link" href="/infinance/logout"><span data-feather="log-out"></span> Cerrar sesión</a>
          			</li>
        		</ul>
      		</nav>
      		<!-- NAVBAR -->
    	</header>
  		<div class="container-fluid">
      		<div class="row">
        		<!-- SIDEBAR -->
        		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
          			<div class="sidebar-sticky">
            			<ul class="nav flex-column">
              				<li class="nav-item">
                				<a class="nav-link" href="/infinance/portfolio"><span data-feather="briefcase"></span> Mi cartera</a>
                			</li>
                			<li class="nav-item">
                				<a class="nav-link" href="/infinance/market"><span data-feather="dollar-sign"></span> Bolsa</a>
                			</li>
              				<li class="nav-item">
                				<a class="nav-link" href="/infinance/history"><span data-feather="file-text"></span> Historial</a>
                			</li>
              				<li class="nav-item">
                				<a class="nav-link" href="/infinance/export"><span data-feather="download"></span> Exportar datos</a>
                			</li>
              				<li class="nav-item">
                				<a class="nav-link active" href="#"><span data-feather="settings"></span> Configuración<span class="sr-only">(actual)</span></a>
                			</li>
                			              			                			<c:if test = "${type >1}">
      
 								<li class="nav-item">
   								 <a class="nav-link disabled font-weight-bold" >Administrador</a>
 								 </li>                		
  								 <li class="nav-item">
                				<a class="nav-link" href="/infinance/gestoruser"><span data-feather="users"></span> Usuarios</a>
                			</li>
                			<li class="nav-item">
                				<a class="nav-link" href="/infinance/editcompany"><span data-feather="globe"></span> Empresas</a>
                			</li>
                			</c:if>
                		</ul>
                	</div>
                </nav>
                <!-- SIDEBAR -->
        		<main role="main" class="col-md-3 pl-sm-auto col-lg-8 pt-3">
        			<!-- SETTINGS FORMS -->
          			<form class="form-register " action="/infinance/settings" method="post">
          				<h2>Perfil</h2>          
  	 		 			<label for="inputName" class="control-label" >Nombre</label>
      					<input id="inputName" class="form-control" placeholder="" required="true" autofocus="" type="text" name="name" value="${userinfo.firstName}" >
      					<label for="inputLastName" class="control-label">Apellidos</label>
      					<input id="inputLastName" class="form-control" placeholder="" required="true" autofocus="" type="text" name="lastName" value="${userinfo.lastName}">
      					<label for="inputPhoneNumber" class="control-label">Teléfono</label>
						<input id="inputPhoneNumber" class="form-control" placeholder="" required="true" autofocus="" type="text" name="phoneNumber" value="${userinfo.phone}">
						<label for="inputUser" class="control-label">Usuario</label>
						<input id="inputUser" class="form-control" placeholder="" required="true" autofocus="" type="text" name="user" value="${userinfo.userName}">
						<label for="inputEmail" class="control-label">Correo electrónico</label>
						<input id="inputEmail" class="form-control" placeholder="" required="true" autofocus="" type="email" name="email" value="${userinfo.email}">
			            <button id="registerButton" class="btn btn-lg btn-primary btn-block" type="submit">Guardar</button>
                 		<button id="ButtonDialog" class="btn btn-lg btn-primary btn-block" type="button">Cambiar contraseña</button>
                 	</form>
  					<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  					<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    				
    				
    				<script>var $jq2 = jQuery.noConflict(true);</script>
            		<script>
			            $jq2(function() {
			            	$jq2("#dialog1").dialog({
			    				autoOpen: false,
			    				modal: true,
			    				resizable: false,
			
			    				dialogClass: "dlg-no-close"
			    			});
			            });
			            $jq2(document).ready(function() {
			            	$jq2('#ButtonDialog').on("click", function() {
			            		$jq2("#dialog1").dialog("open");
			    			});
			            });
					</script>
  					<!-- SETTINGS FORMS -->
        		</main>
      		</div>
    	</div>
    	<!-- SETTINGS FORMS -->
		<div id="dialog1" title="Cambiar contraseña">
			<div class="container">
         		<form id="popupform" action="/infinance/changepassword" method="get">
         			<label for="inputPassword" class="control-label">Contraseña actual</label>
      				<input id="inputPassword" class="form-control" placeholder="Contraseña actual" required="true" type="password" name="password">
   					<label for="inputNewPassword" class="control-label">Nueva contraseña</label>
      				<input id="inputNewPassword" class="form-control" placeholder="Nueva contraseña" required="true" type="password" name="newpassword">
      				<label for="inputCheckPassword" class="control-label">Repita la nueva contraseña</label>
      				<input id="inputCheckPassword" class="form-control" placeholder="Nueva contraseña" required="true" type="password" name="checkPassword"><span id='errormessage'></span>     
                    </br>
                    </br>
                    <button id="ChangePassword" class="btn btn-lg btn-primary btn-block" type="submit" onclick="return Validate()">Cambiar</button>
            	</form>
			</div>
		</div>
		<script type="text/javascript">
			function Validate() {
				var password = document.getElementById("inputNewPassword").value;
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
		
		$jq2("#popupform").submit(function(event){
    event.preventDefault(); //prevent default action 
    var post_url = $jq2(this).attr("action"); //get form action url
    var request_method = $jq2(this).attr("method"); //get form GET/POST method
    var form_data = $jq2(this).serialize(); //Encode form elements for submission
    $jq2.ajax({
        url : post_url,
        type: request_method,
        data : form_data,
        contentType : "text/json",
       	success : function (msg) {
       		$jq2("#dialog1").dialog("close");
       		if (msg==-1){
       		  $jq2( function() {
       		    $jq2( "#dialogOperation" ).dialog().prev(".ui-dialog-titlebar").css("background-color",'#B40404').css("color","white");
       		 $jq2( "#dialogOperation" ).dialog().html("Contraseña incorrecta");
       		  } );
       		}
       		if (msg==0){
       		  $jq2( function() {
      		    $jq2( "#dialogOperation" ).dialog().prev(".ui-dialog-titlebar").css("background-color",'#088A08').css("color","white");
      		  $jq2( "#dialogOperation" ).dialog().html("Operacion realizada correctamente");
       		  } );

         		}
          }
    });
    });

		</script>

	    <div id="dialogOperation" title="Aviso">
</div>
		<script>
		$jq2('#inputCheckPassword').on('keyup', function () {
    if ($jq2(this).val() == $jq2('#inputNewPassword').val()) {
    	$jq2('#errormessage').html('Contraseñas coinciden &#10004;').css('color', 'green');
    } else $jq2('#errormessage').html('Contraseñas no coinciden &#10008;').css('color', 'red');
});
</script>



		<!-- SETTINGS FORMS -->
		<!-- JS SCRIPTS -->
    	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	    <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>
	    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	    <script>
			feather.replace()
	    </script>
	    <!-- JS SCRIPTS -->
	</body>
</html>