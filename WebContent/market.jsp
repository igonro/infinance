<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Market</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>NASDAQ</h2>
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
        <td><a href ="/infinance/dashboard?${Bean.symbol}">${Bean.symbol} </a></td>
        <td>${Bean.name} </td>
                <td>${Bean.sector} </td>
                <td>${Bean.industry} </td>
        
              </tr>
        
</c:forEach>

    </tbody>
  </table>
</div>


</body>
</html> 
