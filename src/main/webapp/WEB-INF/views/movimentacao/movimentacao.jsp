<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Cadastro de Alunos">

 		${mensagem}
 		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Saldo Atual em Caixa</th>
				<th>R$ ${total}</th>
			</tr>
		</table>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Nome:</th>
				<th>Tipo da Movimentação</th>
				<th>Valor</th>
				<th>Data da Movimentação</th>
			</tr>
			<c:forEach items="${movimentacao}" var="m">
				<tr>
					<td>${m.nome}</td>
					<td>${m.tipo}</td>
					<td>${m.valor}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${m.data.time}" /></td>
				</tr>
			</c:forEach>			
		</table>
		<a href="${contextPath}/autoescola/movimentacao/form" class="btn btn-primary">Nova Movimentação</a>
</tags:pageTemplate>