<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.jacaranda.repository.CinemaRepository"%>
<%@page import="com.jacaranda.model.Cinema"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://classless.de/classless.css">

</head>
<body>

<%
String mensaje = "";
try {
	

	if(request.getParameter("add")!= null){
		if(CinemaRepository.getCinema(request.getParameter("cine"))==null){				
		Cinema c = new Cinema(request.getParameter("cine"),request.getParameter("ciudad"), request.getParameter("direccion"));
		CinemaRepository.mergeCine(c);
		}else{
			mensaje = "Ya existe un cine con ese nombre";
		}
	}
			
	} catch (Exception e) {
		System.out.println("ha ocurrido una excepcion en el jsp");
		System.out.println(e);
	}
%>
	

	<form method="post">
		<input type="text" name="cine" placeholder="Cine" required>
		<input type="text" name="ciudad" placeholder="Ciudad" required>
		<input type="text" name="direccion" placeholder="Direccion" required>
		<input type="submit" name="add" value="Añadir">
	</form>
	
	<a href="/PrimerHibernate/listCinema.jsp">
	    <button>Volver</button>
	</a>	
	<h2><%= mensaje%></h2>
</body>
</html>