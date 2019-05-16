<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Listagem de Veiculos">
<div>${mensagem}</div>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Marca:</th>
				<th>Modelo:</th>
				<th>Cor</th>
				<th>Ano de Fabricacao</th>
				<th>KM Inicial</th>
				<th>KM Atual</th>
			</tr>

			<c:forEach items="${veiculos}" var="veiculo">
				<tr>
					<td>${veiculo.marca}</td>
					<td>${veiculo.modelo}</td>
					<td>${veiculo.cor}</td>
					<td>${veiculo.ano}</td>
					<td>${veiculo.kmInicial}</td>
					<td>${veiculo.kmAtual}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="${contextPath}/autoescola/veiculos/form"  class="btn btn-primary">Novo Veículo</a>
</tags:pageTemplate>