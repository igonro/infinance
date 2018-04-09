<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
Register
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register</title>
</head>
<body>
	<form action="/infinance/register" method="post">
		Usuario: <input type="text" name="user"> <br /> Nombre: <input
			type="text" name="name"> <br /> Apellidos: <input type="text"
			name="lastname"> <br /> Password: <input type="password"
			name="password"> <br /> Email: <input type="email"
			name="email"> <br /> Phone: <input type="text" name="phone">
		<br />

		<p>
			<input type="submit" value="Enviar">
		</p>
	</form>
</body>
</html>