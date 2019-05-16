<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Meus Dados">

<div>${mensagem}</div>
	<form:form action="${s:mvcUrl('UC#grava').build()}" method="post"
		commandName="usuario" class="form-horizontal form-label-left">
		
			<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">E-mail
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="username" value="${meusDados.username}" required="required" readonly="readonly" class="form-control col-md-7 col-xs-12" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Nome
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nome" id="nome" value="${meusDados.nome}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="nome" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Senha
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="senha" id="senha" value="${meusDados.senha}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="senha" />
			</div>
		</div>
 	
		<div class="ln_solid"></div>
		<div class="form-group">
			<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
				<input type="submit" value="Atualizar Dados" class="btn btn-primary" />
			</div>
		</div>

	</form:form>
</tags:pageTemplate>