<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Infinance Home Webpage">
<meta name="author" content="Infinance Team">


<link rel="icon" type="image/png" href="favicon.png" />
<title>Infinance</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/home.css" />

<style id="style-1-cropbar-clipper">
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
</head>
<body>
	<header>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="#"><img
				src="img/infinance-web-icon.svg" width="30" height="30"
				class="d-inline-block align-top" alt=""> Infinance</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Inicio<span
							class="sr-only">(actual)</span></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Acerca de</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Proyecto</a> <a
								class="dropdown-item" href="#">Equipo</a> <a
								class="dropdown-item" href="#">Contacto</a>
						</div></li>
				</ul>

			</div>
		</nav>
		<!-- NAVBAR -->
	</header>

	<main role="main"> <!-- Graphs -->
	<div id="curve_chart">
		<script type="text/javascript"
			src="https://www.gstatic.com/charts/loader.js"></script>
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
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };
        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
      }

    </script>
	</div>
	<hr>

	<div id="fechas">
		<form class="form-date text-center" action="/infinance/dashboard"
			method="get">
			<h1 class="h3 mb-3 font-weight-normal">Performance
				${Empresa.symbol}</h1>
			<label for="dateStart" class="sr-only">Inicio</label> <input
				type="date" id="dateStart" name="dateStart" class="form-control"
				step="1" min="2013-01-01" max="2018-3-31" value="${Dates.dateStart}">
			<label for="dateEnd" class="sr-only">Fin</label> <input type="date"
				id="dateEnd" name="dateEnd" class="form-control" step="1"
				min="2013-01-01" max="2018-3-31" value="${Dates.dateEnd}"> <input
				type="hidden" name="symbol" value="${Empresa.symbol}">
			<button id="buscar" class="btn btn-lg btn-primary btn-block"
				type="submit">Buscar</button>
		</form>

	</div>


	<hr>
	<footer class="container">
		<p class="float-right">
			<a href="#">Volver &uarr;</a>
		</p>
		<p>© 2017-2018 Infinance Project</p>
	</footer> <!-- FOOTER --> </main>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"
		viewBox="0 0 500 500" preserveAspectRatio="none"
		style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;">
		<defs>
		<style type="text/css"></style></defs>
		<text x="0" y="25"
			style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>
</body>