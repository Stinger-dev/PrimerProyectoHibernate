<%@page import="java.util.ArrayList"%>
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
	ArrayList<Cinema> result = null;
	
	try{
		result = (ArrayList<Cinema>) CinemaRepository.getCinemas();
		
	}catch(Exception e){
		System.out.println("ha ocurrido un error");
		System.out.println(e);

	}
%>
<table>
	<thead>
		<tr>
			<th> Cine</th>
			<th> Direccion</th>
			<th> Ciudad</th>
		</tr>
	</thead>
	<tbody>
		<%
		for (Cinema c : result){ 
		%>
		<tr>
			<td><%=c.getCinema() %></td>
			<td><%=c.getCinemaAdress() %></td>
			<td><%=c.getCinemaCity()%></td>
			<td>
				<a href="/PrimerHibernate/editCinema.jsp?cine=<%=c.getCinema()%>">
				    <button>Editar</button>
				</a>
			</td>
						<td>
				<a href="/PrimerHibernate/deleteUser.jsp?cine=<%=c.getCinema()%>">
				    <button>Borrar</button>
				</a>
			</td>
		</tr> 
		<%
		}
		%>


	</tbody>
</table>
		<a href="/PrimerHibernate/annadirCine.jsp">
		    <button>Añadir nuevo</button>
		</a>




</body>
</html>