<%@page import="java.io.IOException"%>
<%@page import="org.libertas.Musica"%>
<%@page import="org.libertas.MusicaDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Consultar Músicas</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
			rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
			crossorigin="anonymous">
		<link rel="stylesheet" href="../style.css">
	</head>
	<body>
		<%
			MusicaDao d = new MusicaDao();
			if(request.getParameter("tabela") != null
					&& request.getParameter("tabela").equals("false")){
				d.criarTabela();
			}
			 if (request.getParameter("msg") != null) { %>
		        <div class="alert alert-success alert-dismissible fade show position-fixed top-50 start-50 translate-middle" role="alert" style="z-index: 1050; animation: fadeOut 3s forwards;">
			        <%= request.getParameter("msg") %>
			        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			    </div>
	    	<% } 
		%>
		<nav class="navbar navbar-dark bg-dark">
			<ul class="nav">
				<li class="nav-item">
			    	<a class="nav-link active" aria-current="page" href="formulario.jsp?id=0">Novo Cadastro</a>
		   		</li>
		   	 	<li class="nav-item">
				  <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Consultar</a>
				</li>
			</ul>
		</nav>
		<table class="table table-striped table-hover">
		  	<th>ID</th>
			<th>Compositor</th>
			<th>Cantor</th>
			<th>Nome da Música</th>
			<th>Ano de Lançamento</th>	
			<th></th>
			<th></th>
			<% 
				for(Musica m : d.listar()){
					out.print("<tr>"
						+"<td>"+m.getId()+"</td>"
						+"<td>"+m.getCompositor()+"</td>"
						+"<td>"+m.getCantor()+"</td>"
						+"<td>"+m.getNomeMusica()+"</td>"
						+"<td>"+m.getAnoLancamento()+"</td>"
						+"<td>"
							+ "<form action=\"formulario.jsp?id="+m.getId()+"\" method=\"post\">"
								+"<button type=\"submit\" class=\"btn btn-warning\">Alterar</button>"
							+"</form>"
						+"</td>"
						+ "<td>"
				            + "<form action=\"excluir.jsp?id="+m.getId()+"\" method=\"post\">"
				            	+ "<button type=\"submit\" class=\"btn btn-danger\">Excluir</button>"
				            +"</form>"
			        	+ "</td>"
					+"</tr>");
				}
			%>
		</table>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
			crossorigin="anonymous">
		</script>
	</body>
</html>