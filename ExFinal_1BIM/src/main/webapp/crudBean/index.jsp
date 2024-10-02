<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:useBean id="mdao" class="org.libertas.MusicaDao" scope="page" />
		<c:set var="msg" value="${param.msg}" />
		
		<c:if test="${empty param.tabela or param.tabela == 'true'}">
		    <c:set var="tabelaCriada" value="${mdao.criarTabela()}" />
		</c:if>
		
		<c:if test="${not empty msg}">
		    <div class="alert alert-success alert-dismissible fade show position-fixed top-50 start-50 translate-middle" role="alert" style="z-index: 1050; animation: fadeOut 3s forwards;">
		        ${msg}
		        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		    </div>
		</c:if>
		
		<jsp:include page="menu.jsp">
		    <jsp:param name="page" value="index" />
		</jsp:include>
		
		<table class="table table-striped table-hover">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Compositor</th>
		            <th>Cantor</th>
		            <th>Nome da Música</th>
		            <th>Ano de Lançamento</th>	
		            <th></th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach var="m" items="${mdao.listar()}">
		            <tr>
		                <td>${m.id}</td>
		                <td>${m.compositor}</td>
		                <td>${m.cantor}</td>
		                <td>${m.nomeMusica}</td>
		                <td>${m.anoLancamento}</td>
		                <td>
		                    <form action="formulario.jsp?id=${m.id}" method="post">
		                        <button type="submit" class="btn btn-warning">Alterar</button>
		                    </form>
		                </td>
		                <td>
		                    <form action="excluir.jsp?id=${m.id}" method="post">
		                        <button type="submit" class="btn btn-danger">Excluir</button>
		                    </form>
		                </td>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
		    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
		    crossorigin="anonymous">
		</script>

	</body>
</html>