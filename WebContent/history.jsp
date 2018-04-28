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
		</style>
		<!-- STYLE -->
		<!-- G-CHART SCRIPT -->
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
        <!-- G-CHART SCRIPT -->
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
                                    response($.map(data, function (value, key) {
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
	      	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0">
	        	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/infinance/home"><img src="img/infinance-web-icon.svg" width="25" height="25" class="d-inline-block align-top" alt=""> Infinance</a>
	        	<input class="form-control form-control-dark w-100" placeholder="Buscar" aria-label="Buscar" type="text"  name="search" id ="search">
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
                				<a class="nav-link active" href="#"><span data-feather="file-text"></span> Historial<span class="sr-only">(actual)</span></a>
                			</li>
              				<li class="nav-item">
                				<a class="nav-link" href="/infinance/export"><span data-feather="download"></span> Exportar datos</a>
                			</li>
              				<li class="nav-item">
                				<a class="nav-link" href="/infinance/settings"><span data-feather="settings"></span> Configuración</a>
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
        		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          			<h2>Historial de transacciones</h2>
          			<!-- TABLE -->
          			<div class="table-responsive">
            			<table class="table table-striped table-sm">
              				<thead>
                				<tr>
									<th data-toggle="tooltip" title="Número que identifica una transacción.">ID de transacción</th>
									<th data-toggle="tooltip" title="Código alfanumérico que identifica las acciones de la empresa.">Símbolo</th>
									<th data-toggle="tooltip" title="Número de acciones adquiridas o vendidas.">Número de acciones</th>
									<th data-toggle="tooltip" title="Precio de cada acción.">Precio unitario</th>
									<th data-toggle="tooltip" title="Precio total del conjunto de acciones.">Precio total</th>
									<th data-toggle="tooltip" title="Compra/Venta.">Tipo</th>
									<th data-toggle="tooltip" title="Fecha de la transacción.">Fecha</th>
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
					<!-- TABLE -->
				</main>
			</div>
		</div>
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

