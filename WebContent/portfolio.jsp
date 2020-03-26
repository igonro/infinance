<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<!-- METADATA -->
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Infinance Portfolio Webpage">
<meta name="author" content="Infinance Team">
<!-- METADATA -->
<!-- STYLE -->
<link rel="icon" href="favicon.png">
<title>Infinance</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/portfolio.css">
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
<!-- STYLE -->
<!-- SEARCH BAR SCRIPT -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script>
	var $jq1 = jQuery.noConflict(true);
</script>
<script>
	$jq1(document)
			.ready(
					function() {
						$jq1(function() {
							$jq1("#search")
									.autocomplete(
											{
												source : function(request,
														response) {
													$jq1
															.ajax({
																url : "CompanyCheck",
																type : "GET",
																data : {
																	term : request.term
																},
																dataType : "json",
																success : function(
																		data) {
																	response($
																			.map(
																					data,
																					function(
																							value,
																							key) {
																						console
																								.log(value);
																						console
																								.log(key);
																						return {
																							label : value.symbol
																									+ ' * '
																									+ value.name,
																							value : value.symbol
																						};
																					}));
																}
															});
												},
												select : function(e, ui) {
													console.log(ui.item.value);
													location.href = '/infinance/company?symbol='
															+ ui.item.value;
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
			<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/infinance/home">
				<img src="img/infinance-web-icon.svg" width="25" height="25"
					class="d-inline-block align-top" alt="">
				Infinance
			</a>
			<input class="form-control form-control-dark w-100"
				placeholder="Buscar" aria-label="Buscar" type="text" name="search"
				id="search">
			<ul class="navbar-nav px-3">
				<li class="nav-item text-nowrap">
					<a class="nav-link" href="/infinance/logout">
						<span data-feather="log-out"></span>
						Cerrar sesión
					</a>
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
							<a class="nav-link active" href="#">
								<span data-feather="briefcase"></span>
								Mi cartera
								<span class="sr-only">(actual)</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/infinance/market">
								<span data-feather="dollar-sign"></span>
								Bolsa
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/infinance/history">
								<span data-feather="file-text"></span>
								Historial
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/infinance/export">
								<span data-feather="download"></span>
								Exportar datos
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/infinance/settings">
								<span data-feather="settings"></span>
								Configuración
							</a>
						</li>
					</ul>
					<c:if test="${type >1}">
						<h6
							class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
							<span>Administrador</span>
						</h6>
						<ul class="nav flex-column mb-2">
							<li class="nav-item">
								<a class="nav-link" href="/infinance/admin-user">
									<span data-feather="users"></span>
									Usuarios
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/infinance/admin-company">
									<span data-feather="globe"></span>
									Empresas
								</a>
							</li>
						</ul>
					</c:if>
				</div>
			</nav>
			<!-- SIDEBAR -->
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
			<h2>Mi cartera</h2>
			<!-- TABLE -->
			<div class="table-responsive">
				<table id="portfoliotable" class="table table-striped table-sm">
					<thead>
						<tr>
							<th data-toggle="tooltip"
								title="Código alfanumérico que identifica las acciones de la empresa.">Símbolo</th>
							<th data-toggle="tooltip" title="Número de acciones en posesión.">Número
								de acciones</th>
							<th data-toggle="tooltip"
								title="Cantidad total de dinero invertido en acciones. &#10;NOTA: También se tiene en cuenta el dinero invertido en acciones ya vendidas.">Coste</th>
							<th data-toggle="tooltip"
								title="Cantidad total de dinero obtenido tras la venta de acciones.">Venta</th>
							<th data-toggle="tooltip"
								title="Valor total de las acciones en posesión.">Valor</th>
							<th data-toggle="tooltip"
								title="Cantidad total de beneficios que se han obtenido hasta la fecha suponiendo que se vendiesen hoy todas las acciones en posesión.">Balance</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="PortfolioUser" items="${PortfolioUser}">
							<tr>
								<td>${PortfolioUser.symbol}</td>
								<td>${PortfolioUser.num}</td>
								<td>${PortfolioUser.costes}</td>
								<td>${PortfolioUser.ventas}</td>
								<td>${PortfolioUser.valor_actual}</td>
								<td>${PortfolioUser.balance}</td>
								<td>
									<button id="${PortfolioUser.symbol}"
										class="btn-add btn-sm btn-outline-success">
										<span data-feather="plus-square"></span>
										Añadir
									</button>
								</td>
								<td>
									<button id="${PortfolioUser.symbol}"
										class="btn-sale btn-sm btn-outline-danger">
										<span data-feather="minus-square"></span>
										Vender
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- TABLE --> </main>
		</div>
	</div>
	<!-- JS SCRIPTS -->
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
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		var $jq2 = jQuery.noConflict(true);
	</script>
	<script>
		$jq2(function() {
			$jq2("#buy").dialog({
				autoOpen : false,
				modal : true,
				resizable : false,
				dialogClass : "dlg-no-close"
			});
		});
		$jq2(document).ready(function() {
			$jq2('.btn-add').on("click", function() {
				var symbol = $(this).attr('id');
				$jq2("#symbolDialogBuy").val(symbol);
				$jq2("#buy").dialog("open");

			});
		});
	</script>
	<script>
		$jq2(function() {
			$jq2("#sale").dialog({
				autoOpen : false,
				modal : true,
				resizable : false,
				dialogClass : "dlg-no-close"
			});
		});
		$jq2(document).ready(function() {
			$jq2('.btn-sale').on("click", function() {
				var symbol = $(this).attr('id');
				var numShares = 0;
				var MyRows = $jq2('#portfoliotable').find('tbody').find('tr');
				for (var i = 0; i < MyRows.length; i++) {
					var numSharesTable = $(MyRows[i]).find('td:eq(1)').html();
					var symbolTable = $(MyRows[i]).find('td:eq(0)').html();
					if (symbolTable == symbol) {
						numShares = numSharesTable;
					}
				}
				$jq2("#symbolDialogSale").val(symbol);
				$jq2("#numShares").val(numShares);
				$jq2("#sale").dialog("open");

			});
		});
	</script>
	<div id="buy" title="Comprar Acciones">
		<div class="container">
			<form action="/infinance/buyshares" method="get">
				<label for="symbolDialogBuy" class="control-label">Empresa</label>
				<input id="symbolDialogBuy" class="form-control" placeholder=""
					required="true" type="text" name="symbol" readonly>
				<label for="numSharesBuy" class="control-label">Número de
					acciones</label>
				<input id="numSharesBuy" class="form-control"
					placeholder="Número de acciones" required="true" type="text"
					name="numSharesBuy">
				</br>
				<button id="ChangePassword" class="btn btn-lg btn-primary btn-block"
					type="submit">Comprar</button>
			</form>
		</div>
	</div>
	<div id="sale" title="Vender Acciones">
		<div class="container">
			<form action="/infinance/saleshares" method="get">
				<label for="symbolDialogSale" class="control-label">Empresa</label>
				<input id="symbolDialogSale" class="form-control" placeholder=""
					required="true" type="text" name="symbol" readonly>
				<label for="numShares" class="control-label">Número de
					acciones en posesión</label>
				<input id="numShares" class="form-control"
					placeholder="Número de acciones" required="true" type="text"
					name="numShares" readonly>
				<label for="numSharesSale" class="control-label">Número de
					acciones</label>
				<input id="numSharesSale" class="form-control"
					placeholder="Número de acciones a vender" required="true"
					type="text" name="numSharesSale">
				</br>
				<button id="ChangePassword" class="btn btn-lg btn-primary btn-block"
					type="submit" onclick="return Validate()">Vender</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function Validate() {
			accionesPosesion = parseInt(document.getElementById("numShares").value);
			accionesVender = parseInt(document.getElementById("numSharesSale").value);
			if (accionesVender > accionesPosesion) {
				alert("No se pueden vender las acciones");
				return false;
			}
			return true;
		}
	</script>

</body>
</html>
