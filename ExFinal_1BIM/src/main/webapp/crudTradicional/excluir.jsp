<%@page import="org.libertas.MusicaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			MusicaDao mdao = new MusicaDao();
			boolean suc = mdao.excluir(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("index.jsp?id=0" + (suc ? "&msg=Registro excluido com sucesso!" : "&msg=Erro ao excluir registro!"));
		%>
</body>
</html>