<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Dados da Empresa">

<div>${mensagem}</div>
	<form:form action="${s:mvcUrl('EC#grava').build()}" method="post"
		commandName="empresa" class="form-horizontal form-label-left">
		
		<form:input path="id" id="id" type="hidden" value="${dadosEmpresa.id}" required="required"/>
	
	
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="nomeFantasia">Nome Fantasia
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nomeFantasia" id="nomeFantasia" value="${dadosEmpresa.nomeFantasia}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="nomeFantasia" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="razaoSocial">Razão Social;
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="razaoSocial" id="razaoSocial" value="${dadosEmpresa.razaoSocial}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="razaoSocial" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="cnpj">CNPJ
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="cnpj" id="cnpj" value="${dadosEmpresa.cnpj}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="cnpj" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">E-mail
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="email" id="email" value="${dadosEmpresa.email}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="email" />
			</div>
		</div>
 	<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="telefoneFixo">Telefone Fixo
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="telefoneFixo" id="telefoneFixo" value="${dadosEmpresa.telefoneFixo}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="telefoneFixo" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="telefoneCelular">Telefone Celular
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="telefoneCelular" id="telefoneCelular" value="${dadosEmpresa.telefoneCelular}" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="telefoneCelular" />
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