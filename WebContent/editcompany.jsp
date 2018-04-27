<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- METADATA -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="Infinance Market Webpage">
	    <meta name="author" content="Infinance Team">
		<!-- METADATA -->
		<!-- STYLE -->
	    <link rel="icon" href="favicon.png">
	    <title>Infinance</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">	
	    <link rel="stylesheet" href="css/market.css">
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
                				<a class="nav-link" href="/infinance/settings"><span data-feather="settings"></span> Configuración</a>
                			</li>
 								<li class="nav-item">
   								 <a class="nav-link disabled font-weight-bold" >Administrador</a>
 								 </li>                		
  								 <li class="nav-item">  								 
                				<a class="nav-link" href="/infinance/gestoruser"><span data-feather="users"></span> Usuarios</a>
                			</li>
             				<li class="nav-item">
                				<a class="nav-link active" href="#"><span data-feather="globe"></span> Empresas<span class="sr-only">(actual)</span></a>
                			</li>
                		</ul>
                	</div>
                </nav>
                <!-- SIDEBAR -->
        		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"><div style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;" class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
 	          		
 	          		<br>
  	          		<br>
 					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
	            		<h1 class="h1">Empresas</h1>
	            		<div class="btn-toolbar mb-2 mb-md-0">
		          		 	<button class="btn-add btn-sm btn-outline-success" id ="addcompany" > Añadir</button>
		          		</div>
		          	</div>
	          		
	          		<br>
	          		<!-- TABLE -->
	          		<div class="table-responsive">
		          		<table id="companytable" class="table table-hover table-responsive table-editable">
							<thead>
								<tr>
									<th data-toggle="tooltip" title="Código alfanumérico que identifica las acciones de la empresa.">Símbolo</th>
									<th data-toggle="tooltip" title="Nombre de la empresa.">Nombre</th>
									<th data-toggle="tooltip" title="Sector de la empresa.">Sector</th>
									<th data-toggle="tooltip" title="Industria de la empresa.">Industria</th>
									<th ></th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="Empresas" items="${Empresas}">
									<tr>
										<td>${Empresas.symbol}</td>
										<td>${Empresas.name}</td>
										<td>${Empresas.sector}</td>
										<td>${Empresas.industry}</td>
										<td>
										<button  class="btn-edit btn-sm btn-outline-success" value = "${Empresas}"> Editar</button>   										
		
				
										</td>										
										<td>
										<form action = "/infinance/editcompany" method = "post">
										<input id="symbol" class="form-control"   type="hidden" name="symbol" value = "${Empresas.symbol}">    
										<input id="type" class="form-control"   type="hidden" name="type" value = "delete"> 
										<button id="deletecompany" class="btn-sale btn-sm btn-outline-danger" type="submit"> Eliminar</button>
										</form>
										
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- TABLE -->
        		</main>
      		</div>
    	</div>
    		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  					<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    				
    				
    				<script>var $jq2 = jQuery.noConflict(true);</script>
            		<script>
			            $jq2(function() {
			            	$jq2("#addcompanydialog").dialog({
			    				autoOpen: false,
			    				modal: true,
			    				resizable: false,			
			    				dialogClass: "dlg-no-close"
			    			});
			            });
			            $jq2(document).ready(function() {
			            	$jq2('#addcompany').on("click", function() {
			            		$jq2("#addcompanydialog").dialog("open");
			    			});
			            });
					</script>
													<script>
							            $jq2(function() {
							            	$jq2("#editcompanydialog").dialog({
							    				autoOpen: false,
							    				modal: true,
							    				resizable: false,			
							    				dialogClass: "dlg-no-close"
							    			});
							            });
					
							            $jq2(document).ready(function() {
							            	$jq2('.btn-edit').on("click", function() {
							            		 var empresa = $(this).attr('value');
							            		 var myarray = empresa.split(',');
							            		 for(var i = 0; i < myarray.length; i++)
							            		 {
							            			var it = myarray[i];
								            		var keyvalue = myarray[i].split('=');
								            		 $jq2('#'+keyvalue[0].trim()+'edit').val(keyvalue[1].trim());
							
							            		 }

							            		 $jq2("#editcompanydialog").dialog("open");

						
							            });
							            });

											</script>

     	<div id="addcompanydialog" title="Añadir Empresa">
			<div class="container">
         		<form id="addpopupform" action="/infinance/editcompany" method="post">
         			<label for="symbol" class="control-label">Símbolo</label>
      				<input id="symbol" class="form-control" placeholder="Símbolo" required="true" type="text" name="symbol">
   					<label for="name" class="control-label">Nombre</label>
      				<input id="name" class="form-control" placeholder="Nombre" required="true" type="text" name="name">
      				<label for="marketCap" class="control-label">Valor de mercado</label>
      				<input id="marketCap" class="form-control" placeholder="Valor de mercado" required="true" type="text" name="marketCap">    
                    	<label for="adrtso" class="control-label">Adrtso</label>
      				<input id="adrtso" class="form-control" placeholder="adrtso" required="true" type="text" name="adrtso">
   					<label for="ipoyear" class="control-label">Ipoyear</label>
      				<input id="ipoyear" class="form-control" placeholder="ipoyear" required="true" type="text" name="ipoyear">
      				<label for="sector" class="control-label">Sector</label>
      				<input id="sector" class="form-control" placeholder="Sector" required="true" type="text" name="sector">  
      				<label for="industry" class="control-label">Industry</label>
      				<input id="industry" class="form-control" placeholder="Industry" required="true" type="text" name="industry">    
      				<label for="summary" class="control-label">Summary</label>
      				<input id="summary" class="form-control" placeholder="Summary" required="true" type="text" name="summary">    
      				<label for="lastsale" class="control-label">Last sale</label>
      				<input id="lastsale" class="form-control" placeholder="lastsale" required="true" type="text" name="lastsale">    
                    <input id="type" class="form-control"   type="hidden" name="type" value = "add">    
                    </br>
                    <button id = "addbutton" class="btn btn-lg btn-primary btn-block" type="submit">Añadir</button>
            	</form>
			</div>
		</div>
		

    	<div id="editcompanydialog" title="Editar Empresa">
			<div class="container">
         		<form id="addpopupform" action="/infinance/editcompany" method="post">
         			<label for="symboledit" class="control-label">Símbolo</label>
      				<input id="symboledit" class="form-control" placeholder="Símbolo" required="true" type="text" name="symboledit">
   					<label for="nameedit" class="control-label">Nombre</label>
      				<input id="nameedit" class="form-control" placeholder="Nombre" required="true" type="text" name="nameedit">
      				<label for="marketcapedit" class="control-label">Valor de mercado</label>
      				<input id="marketcapedit" class="form-control" placeholder="Valor de mercado" required="true" type="text" name="marketcapedit">    
                    	<label for="addressedit" class="control-label">Adrtso</label>
      				<input id="addressedit" class="form-control" placeholder="adrtso" required="true" type="text" name="addressedit">
   					<label for="ipoyearedit" class="control-label">Ipoyear</label>
      				<input id="ipoyearedit" class="form-control" placeholder="ipoyear" required="true" type="text" name="ipoyearedit">
      				<label for="sectoredit" class="control-label">Sector</label>
      				<input id="sectoredit" class="form-control" placeholder="Sector" required="true" type="text" name="sectoredit">  
      				<label for="industryedit" class="control-label">Industry</label>
      				<input id="industryedit" class="form-control" placeholder="Industry" required="true" type="text" name="industryedit">    
                    <input id="type" class="form-control"   type="hidden" name="type" value = "edit">    
                    </br>
                    <button id = "editbutton" class="btn btn-lg btn-primary btn-block" type="submit">Editar</button>
            	</form>
			</div>
		</div>
		<!-- JS SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>
		<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
		<script>
			feather.replace();
		</script>
		<!-- JS SCRIPTS -->
	</body>
