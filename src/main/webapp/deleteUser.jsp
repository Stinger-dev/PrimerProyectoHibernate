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
	try{
		if(request.getParameter("delete")!= null){
			Cinema c = new Cinema(request.getParameter("cine"),request.getParameter("ciudad"), request.getParameter("direccion"));
			CinemaRepository.deleteCinema(c);		
		}
		Cinema c = CinemaRepository.getCinema(request.getParameter("cine"));
		
	%>
	
	<form method="post">
		<input type="text" name="cine" placeholder="Cine" value="<%=c.getCinema()%>" readonly>
		<input type="text" name="ciudad" placeholder="Ciudad" value="<%=c.getCinemaCity()%>" readonly>
		<input type="text" name="direccion" placeholder="Direccion" value="<%=c.getCinemaAdress()%>" readonly>
		<input type="submit" name="delete" value="Borrar">
	</form>
	<a href="/PrimerHibernate/listCinema.jsp">
	    <button>Volver</button>
	</a>
		
	<% 
	}
	catch(Exception e ){
	    response.sendRedirect("/PrimerHibernate/listCinema.jsp");
	}
	%>

</body>
</html>