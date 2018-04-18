<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- METADATA -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Infinance Company Webpage">
    	<meta name="author" content="Infinance Team">
		<!-- METADATA -->
		<!-- STYLE -->
    	<link rel="icon" href="favicon.png">
    	<title>Infinance</title>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    	<link rel="stylesheet" href="css/company.css">
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
  		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
				var data = google.visualization.arrayToDataTable([
					['Year', 'Sales'],
        			<c:forEach var="Company" items="${Company}">
          				['${Company.date}',  ${Company.value}],
          			</c:forEach>
				]);
				var options = {
    				title: '',
					chartArea: {'width': '90%', 'height': '90%'},
    				legend: { position: 'none' }
  				};
  				var chart = new google.visualization.LineChart(document.getElementById('line-chart'));
  				chart.draw(data, options);
			}
			window.onresize = function(event) {
  				drawChart();
			};
		</script>
		<!-- G-CHART SCRIPT -->
		<!-- SEARCH BAR SCRIPT -->
			<!-- TO-DO -->
		<!-- SEARCH BAR SCRIPT -->
	</head>
	<body>
    	<header id="header">
      	<!-- NAVBAR -->
      		<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0">
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
                				<a class="nav-link" href="/infinance/settings"><span data-feather="settings"></span> Configuración</a>
                			</li>
                		</ul>
                	</div>
                </nav>
                <!-- SIDEBAR -->
        		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"><div style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;" class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
          			<!-- CHART HEADER -->
          			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            			<h1 class="h1">${infoEmpresa.symbol}</h1>
            			<div class="btn-toolbar mb-2 mb-md-0">
              				<div class="btn-group mr-2">
                				<button id="add-to-portfolio" class="btn btn-sm btn-outline-primary">Añadir a mi cartera</button>
              				</div>
              				<form class="form-date text-center" action="/infinance/company" method="get">
	              				<div class="btn-group mr-2">
	                				<input class="btn btn-sm btn-outline-secondary" type="date" id="dateStart" name="dateStart" step="1" value="${Dates.dateStart}">
	              				</div>
	              				<div class="btn-group mr-2">
	                				<input class="btn btn-sm btn-outline-secondary" type="date" id="dateEnd" name="dateEnd" step="1" value="${Dates.dateEnd}">
	              				</div>
	              				<input type="hidden" name="symbol" value="${infoEmpresa.symbol}">
	              				<div class="btn-group mr-2">
	                				<button id="refresh-interval" class="btn btn-sm btn-outline-primary" type="submit"><span data-feather="refresh-cw"></span> Actualizar intervalo</button>
	              				</div>
	        				</form>
            			</div>
            		</div>
          			<!-- CHART HEADER -->
            		<!-- CHART -->
          			<div id="line-chart"></div>
            		<!-- CHART -->
          			<br><br><br>
          			<h2>Datos</h2>
          			<br>
          			<!-- TABLE -->
          			<div class="table-responsive">
            			<table class="table table-striped table-sm">
              				<thead>
                				<tr>
                  					<th data-toggle="tooltip" title="Nombre de la empresa.">Nombre</th>
                  					<th data-toggle="tooltip" title="Código alfanumérico que identifica las acciones de la empresa.">Símbolo</th>
                  					<th data-toggle="tooltip" title="Valor de la empresa.">Valor</th>
                				</tr>
              				</thead>
              				<tbody>
                				<tr>
                  					<td>${infoEmpresa.name}</td>
                  					<td>${infoEmpresa.symbol}</td>
                  					<td>${infoEmpresa.price}</td>
                				</tr>
              				</tbody>
              				<thead>
				                <tr>
                  					<th data-toggle="tooltip" title="Valor global de todas las acciones que la empresa cotiza en bolsa.">Capitalización de mercado</th>
                  					<th data-toggle="tooltip" title="Sector de la empresa.">Sector</th>
                  					<th data-toggle="tooltip" title="Industria de la empresa.">Industria</th>
                				</tr>
              				</thead>
              				<tbody>
                				<tr>
                  					<td>${infoEmpresa.marketCap}</td>
                  					<td>${infoEmpresa.sector}</td>
                  					<td>${infoEmpresa.industry}</td>
                				</tr>
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
