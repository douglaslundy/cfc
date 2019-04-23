<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Cadastro de Alunos">


	<form:form action="${s:mvcUrl('AC#grava').build()}" method="post"
		commandName="aluno" enctype="multipart/form-data"
		class="form-horizontal form-label-left">

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Foto <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="file" name="foto"
					class="form-control  col-md-7 col-xs-12" />
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="nome">Nome
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nome" id="nome" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="nome" />
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="sobrenome">Sobre Nome <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="sobrenome" id="sobrenome" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="sobrenome" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="nascimento">Data Nascimento <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nascimento" id="nascimento" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="nascimento" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="telefone">Telefone <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="telefone" id="telefone" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="telefone" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="rua">Rua
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="rua" id="rua" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="rua" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="numero">Numero
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="numero" id="numero" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="numero" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="bairro">Bairro
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="bairro" id="bairro" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="bairro" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="cidade">Cidade
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="Cidade" id="Cidade" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="Cidade" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="cpf">CPF
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="cpf" id="cpf" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="cpf" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="identidade">Identidade <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="identidade" id="cpf" required="required"
					class="form-control col-md-7 col-xs-12" />
				<form:errors path="identidade" />
			</div>
		</div>

		<div class="ln_solid"></div>
		<div class="form-group">
			<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
				<input type="submit" value="Cadastrar" class="btn btn-primary" />
			</div>
		</div>

	</form:form>
</tags:pageTemplate>