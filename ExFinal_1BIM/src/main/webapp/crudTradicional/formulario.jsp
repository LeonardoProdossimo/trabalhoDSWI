<%@page import="org.libertas.MusicaDao"%>
<%@page import="org.libertas.Musica"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Formulário</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
			rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
			crossorigin="anonymous">
		<link rel="stylesheet" href="../style.css"> 
	</head>
	<body>
		<%
			int id = Integer.parseInt(request.getParameter("id"));
			Musica m = new Musica();
			MusicaDao mdao = new MusicaDao();
			if(id > 0){
				m = mdao.consultar(id);
			}else{
				m.setId(0);
				m.setCompositor("");
				m.setCantor("");
				m.setNomeMusica("");
				m.setAnoLancamento("");
			}
		%>
		
		<nav class="navbar navbar-dark bg-dark">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Novo Cadastro</a>
		   		</li>
		   	 	<li class="nav-item">
		   	 		<a class="nav-link active" aria-current="page" href="index.jsp?tabela=true">Consultar</a>
				</li>
			</ul>
		</nav>
		<h4 id="form">Formulário</h4>
		<form class="row g-3 needs-validation" id="form" novalidate action = "salvar.jsp" method = "post">
			<input type="hidden" name="id" value="<%=m.getId() %>"/>
			  <div class="col-md-6">
			    <label for="validationCustom01" class="form-label">Compositor</label>
			    <input type="text" class="form-control" id="validationCustom01" name="compositor" value="<%=m.getCompositor() %>" required>
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom02" class="form-label">Cantor</label>
			    <input type="text" class="form-control" id="validationCustom02" name="cantor" value="<%=m.getCantor() %>" required>
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom03" class="form-label">Nome da Música</label>
			    <input type="text" class="form-control" id="validationCustom03" name="nomemusica" value="<%=m.getNomeMusica() %>" required>
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom05" class="form-label">Ano de Lançamento</label>
			    <input type="text" class="form-control" id="validationCustom05" name="anolancamento" value="<%=m.getAnoLancamento() %>" required>
			  </div>
			  <div class="col-12">
			    <button class="btn btn-success" type="submit">Cadastrar</button>
			  </div>
		</form>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
			crossorigin="anonymous">
		</script>
	</body>
</html>