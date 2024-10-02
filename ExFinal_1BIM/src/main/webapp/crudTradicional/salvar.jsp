<%@page import="org.libertas.MusicaDao"%>
<%@page import="org.libertas.Musica"%>
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
			MusicaDao mao = new MusicaDao();
			Musica m = new Musica();
			m.setCompositor(request.getParameter("compositor"));
			m.setCantor(request.getParameter("cantor"));
			m.setNomeMusica(request.getParameter("nomemusica"));
			m.setAnoLancamento(request.getParameter("anolancamento"));
			
			m.setId(Integer.parseInt(request.getParameter("id")));
		
			boolean suc = mao.salvar(m);
			response.sendRedirect("index.jsp?id=" + m.getId() + (suc ? "&msg=Registro salvo com sucesso!" : "&msg=Erro ao salvar registro!"));
		%>
</body>
</html>