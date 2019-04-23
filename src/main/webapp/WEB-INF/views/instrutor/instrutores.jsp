<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<tags:pageTemplate titulo="Listagem de Instrutores">
<div>${mensagem}</div>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Foto:</th>
				<th>Nome:</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th>Identidade</th>
				<th>Data de Nascimento</th>
			</tr>

			<c:forEach items="${instrutores}" var="instrutor">
				<tr>
					<td><img src="${instrutor.fotoPath}"></td>
					<td>${instrutor.nome}</td>
					<td>${instrutor.telefone}</td>
					<td>${instrutor.cpf}</td>
					<td>${instrutor.identidade}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${instrutor.nascimento.time}" /></td>
				</tr>
			</c:forEach>
		</table>
		<a href="${contextPath}/autoescola/instrutor/form">Cadastrar Instrutor</a>
</tags:pageTemplate>