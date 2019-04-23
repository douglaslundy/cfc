<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Cadastro de Alunos">

 <h1>Listagem de Alunos</h1>
		<hr />

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

			<c:forEach items="${alunos}" var="aluno">
				<tr>
					<td><img src="${aluno.fotoPath}"></td>
					<td>${aluno.nome}</td>
					<td>${aluno.telefone}</td>
					<td>${aluno.cpf}</td>
					<td>${aluno.identidade}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.nascimento.time}" /></td>
				</tr>
			</c:forEach>
		</table>
		<a href="${contextPath}/autoescola/alunos/form">Cadastrar Aluno</a>

</tags:pageTemplate>