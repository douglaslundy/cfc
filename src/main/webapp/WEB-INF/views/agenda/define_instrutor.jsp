<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Define Instrutor">
	</head>
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">

				<div class="col-sm-12">

					<form:form class="form-horizontal" method="POST"
						action="${s:mvcUrl('agenda_form').build()}" commandName="agenda">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-1 control-label">Instrutor</label>
							<div class="col-sm-9">
								<input id="instrutor" name="instrutor" class="form-control" type="text"
									list="instrutores" autocomplete="off" required="required" />
								<datalist id="instrutores">
									<c:forEach var="listValueInstrutores" items="${instrutores}">
										<option
											value="${listValueInstrutores.nome} -  ${listValueInstrutores.cpf}">
									</c:forEach>
								</datalist>
							</div>
							<div class="col-sm-2">
								<button type="submit" id="btn" class="btn btn-primary" style="visibility: hidden">Próximo</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// encaminha para agenda
		$(document).ready(function() {
			$('#instrutor').on('input', function() {
				$("#btn").css("visibility", "visible");
			})
		});
	</script>

</tags:pageTemplate>