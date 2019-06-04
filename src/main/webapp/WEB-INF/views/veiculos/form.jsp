<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Cadastro de Veiculos">
	<form:form action="${s:mvcUrl('VC#grava').build()}" method="post"
		commandName="veiculo" class="form-horizontal form-label-left">
		<form:input path="id" id="id" required="required" type="hidden" value="${veiculo.id}" />
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Marca<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="marca" class="form-control col-md-7 col-xs-12" placeholder="Marca" style="text-transform: uppercase;" />
				<form:errors path="marca" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Ano de Fabricacao<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="ano" class="form-control col-md-7 col-xs-12"  onkeyup="mascara(this, soNumeros);"  maxlength="4"  placeholder="0000"/>
				<form:errors path="ano" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Modelo<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="modelo" class="form-control col-md-7 col-xs-12" placeholder="Modelo" style="text-transform: uppercase;" />
				<form:errors path="modelo" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Cor<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="cor" class="form-control col-md-7 col-xs-12" placeholder="Cor" style="text-transform: uppercase;" />
				<form:errors path="cor" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Combustivel<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="combustivel"
					class="form-control col-md-7 col-xs-12" placeholder="combustível" style="text-transform: uppercase;" />
				<form:errors path="combustivel" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Chassi<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="chassi" class="form-control col-md-7 col-xs-12" placeholder="número do chassi" style="text-transform: uppercase;" />
				<form:errors path="chassi" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Renavan<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="renavan" class="form-control col-md-7 col-xs-12" placeholder="número do renavam" style="text-transform: uppercase;" />
				<form:errors path="renavan" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">Placa<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="placa" class="form-control col-md-7 col-xs-12" placeholder="XXX-0000"  maxlength="8"  style="text-transform: uppercase;" />
				<form:errors path="placa" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="first-name">KM Inicial<span class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="kmInicial" class="form-control col-md-7 col-xs-12"  onkeyup="mascara(this, soNumeros);"  maxlength="14" />
				<form:errors path="kmInicial" />
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