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
<meta name="description" content="Infinance AdminUser Webpage">
<meta name="author" content="Infinance Team">
<!-- METADATA -->
<!-- STYLE -->
<link rel="icon" href="favicon.png">
<title>Infinance</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/admin-user.css">
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
					class="d-inline-block align-top" alt=""> Infinance
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
							<a class="nav-link" href="/infinance/portfolio">
								<span data-feather="briefcase"></span>
								Mi cartera
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
					<h6
						class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
						<span>Administrador</span>
					</h6>
					<ul class="nav flex-column mb-2">
						<li class="nav-item">
							<a class="nav-link active" href="#">
								<span data-feather="users"></span>
								Usuarios
								<span class="sr-only">(actual)</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/infinance/admin-company">
								<span data-feather="globe"></span>
								Empresas
							</a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- SIDEBAR -->
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
				<h1 class="h1">Usuarios</h1>
			</div>
			<!-- TABLE -->
			<div class="table-responsive">
				<table id="userstable" class="table table-striped table-sm">
					<thead>
						<tr>
							<th>ID de usuario</th>
							<th>Usuario</th>
							<th>Correo</th>
							<th>Teléfono</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Usuarios" items="${Usuarios}">
							<tr>
								<td>${Usuarios.id}</td>
								<td>${Usuarios.userName}</td>
								<td>${Usuarios.email}</td>
								<td>${Usuarios.phone}</td>
								<td>
									<button id="${Usuarios.id}"
										class="btn-permisos btn-sm btn-outline-success">
										<span data-feather="plus-square"></span>
										Dar permisos
									</button>
								</td>
								<td>
									<button id="${Usuarios.id}"
										class="btn-borrar btn-sm btn-outline-danger">
										<span data-feather="minus-square"></span>
										Borrar
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
			$jq2("#darpermisos").dialog({
				autoOpen : false,
				modal : true,
				resizable : false,
				dialogClass : "dlg-no-close"
			});
		});
		$jq2(document).ready(function() {
			$jq2('.btn-permisos').on("click", function() {
				var id_user = $(this).attr('id');
				var MyRows = $jq2('#userstable').find('tbody').find('tr');
				for (var i = 0; i < MyRows.length; i++) {
					var user_name_table = $(MyRows[i]).find('td:eq(1)').html();
					var id_user_table = $(MyRows[i]).find('td:eq(0)').html();
					if (id_user_table == id_user) {
						var user_name = user_name_table;
						break;
					}
				}
				$jq2("#userID").val(id_user);
				$jq2("#userName").val(user_name);
				$jq2("#darpermisos").dialog("open");

			});
		});
	</script>
	<script>
		$jq2(function() {
			$jq2("#borrar").dialog({
				autoOpen : false,
				modal : true,
				resizable : false,
				dialogClass : "dlg-no-close"
			});
		});
		$jq2(document).ready(function() {
			$jq2('.btn-borrar').on("click", function() {
				var id_user = $(this).attr('id');
				var MyRows = $jq2('#userstable').find('tbody').find('tr');
				for (var i = 0; i < MyRows.length; i++) {
					var user_name_table = $(MyRows[i]).find('td:eq(1)').html();
					var id_user_table = $(MyRows[i]).find('td:eq(0)').html();
					if (id_user_table == id_user) {
						var user_name = user_name_table;
						break;
					}
				}
				$jq2("#userIDBorrar").val(id_user);
				$jq2("#userNameBorrar").val(user_name);
				$jq2("#borrar").dialog("open");

			});
		});
	</script>
	<div id="darpermisos" title="Dar permisos">
		<div class="container">
			<form action="/infinance/darpermisos" method="get">
				<label for="userID" class="control-label">Usuario ID</label>
				<input id="userID" class="form-control" placeholder=""
					required="true" type="text" name="userID" readonly>
				<label for="userName" class="control-label">Usuario</label>
				<input id="userName" class="form-control" placeholder=""
					required="true" type="text" name="userName" readonly>
				</br>
				<button id="darpermisosButton"
					class="btn btn-lg btn-primary btn-block" type="submit"" >Dar
					permisos</button>
			</form>
		</div>
	</div>
	<div id="borrar" title="Confirmar usuario a borrar">
		<div class="container">
			<form action="/infinance/borraruser" method="get">
				<label for="userIDBorrar" class="control-label">Usuario ID</label>
				<input id="userIDBorrar" class="form-control" placeholder=""
					required="true" type="text" name="userID" readonly>
				<label for="userNameBorrar" class="control-label">Usuario</label>
				<input id="userNameBorrar" class="form-control" placeholder=""
					required="true" type="text" name="userName" readonly>
				</br>
				<button id="darpermisosButton"
					class="btn btn-lg btn-primary btn-block" type="submit"" >Borrar</button>
			</form>
		</div>
	</div>
</body>
</html>
