<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="/infinance/login" method="post">

 Usuario:
    <input type="text" name="user">
    <br/>
     Password:
    <input type="password" name="password">
    <br/>
         <p><input type="submit" value="Enviar"></p>
</form>
<c:if test="${not empty errorMessage}">
   <c:out value="${errorMessage}"/>
</c:if>
</body>
</html>