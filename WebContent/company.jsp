<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <jsp:useBean id="infoEmpresa" class="model.CompanyInfo" scope="request" ></jsp:useBean> --%>
<html>
<head>
<%-- <title><jsp:getProperty property="symbol" name="infoEmpresa"></jsp:getProperty></title> --%>
<title>Infinance</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/home.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
	<header> <!-- NAVBAR --> <nav
		class="navbar navbar-expand-md navbar-dark fixed-top bg-dark"> <a
		class="navbar-brand" href="#"><img
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
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="#">Proyecto</a> <a
						class="dropdown-item" href="#">Equipo</a> <a class="dropdown-item"
						href="#">Contacto</a>
				</div></li>
		</ul>

	</div>
	</nav> <!-- NAVBAR --> </header>
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
				${infoEmpresa.symbol}</h1>
			<label for="dateStart" class="sr-only">Inicio</label> <input
				type="date" id="dateStart" name="dateStart" class="form-control"
				step="1" min="2013-01-01" max="2018-3-31" value="${Dates.dateStart}">
			<label for="dateEnd" class="sr-only">Fin</label> <input type="date"
				id="dateEnd" name="dateEnd" class="form-control" step="1"
				min="2013-01-01" max="2018-3-31" value="${Dates.dateEnd}"> <input
				type="hidden" name="symbol" value="${infoEmpresa.symbol}">
			<button id="buscar" class="btn btn-lg btn-primary btn-block"
				type="submit">Buscar</button>
		</form>

	</div>


	<hr>
	<div class="container">
		<h2>${infoEmpresa.symbol}</h2>
		<table class="table table-hover table-responsive">
			<thead>
				<tr>
					<th>Symbol</th>
					<th>Name</th>
					<th>Sector</th>
					<th>Industry</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Bean" items="${Bean}">
					<tr>
						<td><a href="/infinance/dashboard?${Bean.symbol}">${Bean.symbol}
						</a></td>
						<td>${Bean.name}</td>
						<td>${Bean.sector}</td>
						<td>${Bean.industry}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<footer class="container">
	<p class="float-right">
		<a href="#">Volver &uarr;</a>
	</p>
	<p>© 2017-2018 Infinance Project</p>
	</footer> <!-- FOOTER --> </main>

</body>
</html>