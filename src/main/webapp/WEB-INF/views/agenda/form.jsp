<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Cadastro de Alunos">
<link href="${contextPath}../resources/vendors/clockpicker/bootstrap-clockpicker.min.css" rel="stylesheet">
		
		<script>
			$(document).ready(function() {
				$('#calendar').fullCalendar({
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					defaultDate: Date(),
					navLinks: true, // can click day/week names to navigate views
					editable: true,
					eventLimit: true, // allow "more" link when too many events
					eventClick: function(event) {
						
						$('#visualizar #id').text(event.id);
						$('#visualizar #title').text(event.title);
						$('#visualizar #start').text(event.start.format('DD/M/YYYY HH:mm:ss'));
						$('#visualizar #end').text(event.end.format('DD/M/YYYY HH:mm:ss'));
						$('#visualizar').modal('show');
						return false;

					},
					
					selectable: true,
					selectHelper: true,
					select: function(start, end){
						
						var dataCapturada = moment(start).format('DD/M/YYYY');
												
						if((new Date().setDate(new Date().getDate() - 1)) <= new Date(dataCapturada.split('/').reverse().join('/'))){
							$('#cadastrar #start').val(dataCapturada);
							$('#cadastrar').modal('show');
						} else {
							$('#erro').modal('show');
						}
					},
					events: ${eventos.toString()}
					
				});
			});
			
			//Mascara para o campo data e hora
			function DataHora(evento, objeto){
				var keypress=(window.event)?event.keyCode:evento.which;
				campo = eval (objeto);
				if (campo.value == '00/00/0000'){
					campo.value=""
				}
			 
				caracteres = '0123456789';
				separacao1 = '/';
				separacao2 = ' ';
				separacao3 = ':';
				conjunto1 = 2;
				conjunto2 = 5;
				conjunto3 = 10;
				conjunto4 = 13;
				conjunto5 = 16;
				if ((caracteres.search(String.fromCharCode (keypress))!=-1) && campo.value.length < (19)){
					if (campo.value.length == conjunto1 )
					campo.value = campo.value + separacao1;
					else if (campo.value.length == conjunto2)
					campo.value = campo.value + separacao1;
					else if (campo.value.length == conjunto3)
					campo.value = campo.value + separacao2;
					else if (campo.value.length == conjunto4)
					campo.value = campo.value + separacao3;
					else if (campo.value.length == conjunto5)
					campo.value = campo.value + separacao3;
				}else{
					event.returnValue = false;
				}
			}
			
            $(function () {
                $('#datetimepicker1').datetimepicker({format :"DD/MM/YYYY"});
            });
        </script>
	</head>
	
	<div>${mensagem}</div>
	
	<div class="panel panel-default">
	<div class="panel-body">
	<div class="form-group">

	<label for="inputEmail3" class="col-sm-1 control-label">Instrutor</label>
	<div class="col-sm-9">
		<form>
		<input id="instrutor" class="form-control" type="text" value="${instrutor.nome}" autocomplete="off" required="required" readonly="readonly"/>
		</form>										
	</div>
	<div class="col-sm-1">
			<a href="${s:mvcUrl('define_instrutor').build()}" class="btn btn-primary">Trocar Instrutor</a>
		</div>	
	</div>	
	</div>	
	</div>	
							
	<div id='calendar'></div>
		
			<div class="modal fade" id="erro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title text-center">Agendar Aula</h4>
					</div>
					
					<div class="modal-body">
						<dl class="dl-horizontal">
							Não é Possível Agendar Aula em Data Passada							
						</dl>
					</div>		
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="visualizar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title text-center">Dados da Aula</h4>
					</div>
					<div class="modal-body">
						<dl class="dl-horizontal">
							<dt>ID do Evento</dt>
							<dd id="id"></dd>
							<dt>Titulo do Evento</dt>
							<dd id="title"></dd>
							<dt>Inicio do Evento</dt>
							<dd id="start"></dd>
							<dt>Fim do Evento</dt>
							<dd id="end"></dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="cadastrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title text-center">Agendar Aula</h4>
					</div>
					<div class="modal-body">
						<form:form class="form-horizontal" method="POST" action="${s:mvcUrl('gravar_aula').build()}" commandName="agenda" >
							<input name="instrutorId" type="hidden" value="${instrutor.id}" required="required"/>
								
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">Aluno</label>
								<div class="col-sm-10">
								
								<input name="aluno" id="aluno" class="form-control" type="text" list="alunos" autocomplete="off" required="required"/>
								<datalist id="alunos">
										<c:forEach var="listValueAlunos" items="${alunos}">
											<option value="${listValueAlunos.id} - ${listValueAlunos.nome} -  ${listValueAlunos.cpf}">
									    </c:forEach>
								</datalist>		
															
								</div>
							</div>						
											
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">Data</label>
								<div class="col-sm-10">
								 <div class='input-group date' id='datetimepicker1'>
									<input type="text" class="form-control" name="start" id="start" readonly="readonly">
									<span class="input-group-addon">
								          <span class="glyphicon glyphicon-calendar"></span>
								    </span>
								    </div>
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">Hora de Início</label>
								<div class="col-sm-10">
								 <div class='input-group date' id='datetimepicker1'>
									<input autocomplete="off" class="form-control" id="single-input" name="horarioInicio" value="" placeholder="Horario de inicio da aula">	
									<span class="input-group-addon">
								          <span class="glyphicon glyphicon-time"></span>
								    </span>
								    </div>
								</div>
							</div>
							
							<div class="form-group align-right">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">Cadastrar</button>
								</div>
							</div>
						</form:form>
				</div>
		</div>
	</div>
</div>

<script src="${contextPath}../resources/vendors/clockpicker/bootstrap-clockpicker.min.js"></script>

<script type="text/javascript">
$('.clockpicker').clockpicker()
	.find('input').change(function(){
		console.log(this.value);
	});
var input = $('#single-input').clockpicker({
	placement: 'bottom',
	align: 'left',
	autoclose: true,
	'default': 'now'
});

$('.clockpicker-with-callbacks').clockpicker({
		donetext: 'Done',
		init: function() { 
			console.log("colorpicker initiated");
		},
		beforeShow: function() {
			console.log("before show");
		},
		afterShow: function() {
			console.log("after show");
		},
		beforeHide: function() {
			console.log("before hide");
		},
		afterHide: function() {
			console.log("after hide");
		},
		beforeHourSelect: function() {
			console.log("before hour selected");
		},
		afterHourSelect: function() {
			console.log("after hour selected");
		},
		beforeDone: function() {
			console.log("before done");
		},
		afterDone: function() {
			console.log("after done");
		}
	})
	.find('input').change(function(){
		console.log(this.value);
	});

// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
if (/mobile/i.test(navigator.userAgent)) {
	$('input').prop('readOnly', true);
}

</script>
				
</tags:pageTemplate>