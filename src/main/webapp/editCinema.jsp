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
		if(request.getParameter("edit")!= null){
			Cinema c = new Cinema(request.getParameter("cine"),request.getParameter("ciudad"), request.getParameter("direccion"));
			CinemaRepository.mergeCine(c);
		    response.sendRedirect("/PrimerHibernate/listCinema.jsp");
		}
		Cinema c = CinemaRepository.getCinema(request.getParameter("cine"));
		
	%>
	
	<form method="post">
		<input type="text" name="cine" placeholder="Cine" value="<%=c.getCinema()%>" readonly>
		<input type="text" name="ciudad" placeholder="Ciudad" value="<%=c.getCinemaCity()%>" required>
		<input type="text" name="direccion" placeholder="Direccion" value="<%=c.getCinemaAdress()%>" required>
		<input type="submit" name="edit" value="Editar">
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