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

	<form:form action="${s:mvcUrl('MC#grava').build()}" method="post"
		commandName="movimentacao" class="form-horizontal form-label-left">

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Descrição<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="nome" class="form-control  col-md-7 col-xs-12" />
				<form:errors path="nome" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Tipo</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div id="tipo" class="btn-group" data-toggle="buttons">
					
					<label class="btn btn-default active" data-toggle-class="btn-primary"
						data-toggle-passive-class="btn-default"> <input
						type="radio" name="tipo" value="entrada" checked="true" /> &nbsp; Entrada
						&nbsp;
					</label> 
					
					<label class="btn btn-default" data-toggle-class="btn-primary"
						data-toggle-passive-class="btn-default"> 
						<input type="radio" name="tipo" value="saida" /> Saída
					</label>
					
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Valor<span
				class="required">*</span></label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<form:input path="valor" class="form-control  col-md-7 col-xs-12" autocomplete="off" />
				<form:errors path="valor" />
			</div>
		</div>

		<div class="form-group">
			<input type="submit" value="Cadastrar" class="btn btn-primary" />
		</div>
	</form:form>

</tags:pageTemplate>