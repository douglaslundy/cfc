<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Cadastro de Alunos">

	<form:form action="${s:mvcUrl('IC#grava').build()}" method="post"
		commandName="instrutor" enctype="multipart/form-data"
		class="form-horizontal form-label-left">

		<form:input path="id" id="id" required="required" type="hidden"/>
		
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Nome<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nome" required="required" 
					class="form-control col-md-7 col-xs-12" autocomplete="off" placeholder="Nome do Instrutor" style="text-transform: uppercase;"  />
				<form:errors path="nome" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Sobre
				Nome<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="sobrenome" required="required"
					class="form-control col-md-7 col-xs-12" autocomplete="off" placeholder="Sobre nome do Instrutor" style="text-transform: uppercase;"  />
				<form:errors path="sobrenome" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Data
				Nascimento<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nascimento" required="required"  onkeyup="mascara(this, mdata);"  maxlength="10"  
					class="form-control col-md-7 col-xs-12" placeholder="00/00/0000"/>
				<form:errors path="nascimento" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Telefone<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="telefone" required="required"  onkeyup="mascara(this, mtelefone);"  maxlength="14"  
					class="form-control col-md-7 col-xs-12" placeholder="(00)00000-0000" />
				<form:errors path="telefone" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">CPF<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="cpf" required="required"  onkeyup="mascara(this, mcpf);"  maxlength="14"  
					class="form-control col-md-7 col-xs-12" autocomplete="off" placeholder="000.000.000-00" />
				<form:errors path="cpf" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Identidade<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="identidade" required="required"
					class="form-control col-md-7 col-xs-12" autocomplete="off" placeholder="número da carteira de identidade" style="text-transform: uppercase;"  />
				<form:errors path="identidade" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">CNH<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="cnh" required="required"
					class="form-control col-md-7 col-xs-12" autocomplete="off" placeholder="numero da CNH" style="text-transform: uppercase;"  />
				<form:errors path="cnh" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Categoria
				Habilitação<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="categoriaHabilitacao" required="required"
					class="form-control col-md-7 col-xs-12"  placeholder="categoria em que você é habilitado" style="text-transform: uppercase;"   />
				<form:errors path="categoriaHabilitacao" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Credencial<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="credencial" required="required"
					class="form-control col-md-7 col-xs-12" autocomplete="off" placeholder="número da credencial" style="text-transform: uppercase;"  />
				<form:errors path="credencial" />
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