<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="menu.jsp">
		    <jsp:param name="page" value="formulario" />
		</jsp:include>
		
		<jsp:useBean id="m" class="org.libertas.Musica" scope="page"></jsp:useBean>
		<jsp:useBean id="mdao" class="org.libertas.MusicaDao" scope="page"></jsp:useBean>
		<jsp:setProperty property="*" name="m"/>
		${m = mdao.consultar(m.id)}
		<h4 id="form">Formulário</h4>
		<form class="row g-3 needs-validation" id="form" novalidate action = "salvar.jsp" method = "post">
			<input type="hidden" name="id" value="${m.id}"/>
			  <div class="col-md-6">
			    <label for="validationCustom01" class="form-label">Compositor</label>
			    <input type="text" class="form-control" id="validationCustom01" name="compositor" value="${m.compositor}" required>
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom02" class="form-label">Cantor</label>
			    <input type="text" class="form-control" id="validationCustom02" name="cantor" value="${m.cantor}" required>
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom03" class="form-label">Nome da Música</label>
			    <input type="text" class="form-control" id="validationCustom03" name="nomeMusica" value="${m.nomeMusica}" required>
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom05" class="form-label">Ano de Lançamento</label>
			    <input type="text" class="form-control" id="validationCustom05" name="anoLancamento" value="${m.anoLancamento}" required>
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