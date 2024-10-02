<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="m" class="org.libertas.Musica" scope="page" />
    <jsp:useBean id="mdao" class="org.libertas.MusicaDao" scope="page" />
    <jsp:setProperty property="*" name="m" />

    <c:set var="suc" value="${mdao.salvar(m)}" />
    <c:choose>
        <c:when test="${suc}">
            <c:redirect url="index.jsp?tabela=false&msg=Registro salvo com sucesso!" />
        </c:when>
        <c:otherwise>
            <c:redirect url="index.jsp?tabela=false&msg=Erro ao salvar registro!" />
        </c:otherwise>
    </c:choose>
</body>
</html>
