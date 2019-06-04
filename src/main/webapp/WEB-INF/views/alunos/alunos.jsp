<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Cadastro de Alunos">

 <h3>Listagem de Alunos</h3>
 
 					<form:form class="form-horizontal" method="POST" action="${s:mvcUrl('AC#editDataList').build()}">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-1 control-label">Alunos</label>
							<div class="col-sm-10">
								<input id="alunoDL" name="alunoDataList" class="form-control" type="text" list="alunos" autocomplete="off" required="required" />
								<datalist id=alunos>
									<c:forEach var="aluno" items="${alunos}">
										<option
											value="${aluno.id} - ${aluno.nome} -  ${aluno.cpf}">
									</c:forEach>
								</datalist>
							</div>
							<div class="col-sm-1">
								<button type="submit" id="btn" class="btn btn-primary glyphicon glyphicon-search"></button>
							</div>
						</div>
					</form:form>
					
					
	
		<div>${mensagem}</div>
		
		<table id="mytable" class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th>Identidade</th>
				<th>Data de Nascimento</th>
				<th>Opções</th>
			</tr>
	 </thead>
     <tbody>
			<c:forEach items="${alunos}" var="aluno">
				<tr>
					<!-- <td><img src="${aluno.fotoPath}"></td> -->
					<td>${aluno.nome}</td>
					<td>${aluno.telefone}</td>
					<td>${aluno.cpf}</td>
					<td>${aluno.identidade}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.nascimento.time}" /></td>
					<td><a href="${contextPath}/autoescola/alunos/edit/${aluno.id}" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-edit"></span> Editar</a></td>
				</tr>
				
			</c:forEach>
			
		  </tbody>
        </table>
		
		 <div class="pagination-container">
            <nav>
                <ul class="pagination"></ul>
            </nav>
        </div>
	
	<a href="${contextPath}/autoescola/alunos/form"  class="btn btn-primary">Novo Aluno</a>
		
		
 <script>
    var table = '#mytable'
    $(function(){
        $('.pagination').html('')
        var trnum = 0
        var maxRows = parseInt(10)
        var totalRows = $(table+' tbody tr').length
        $(table+' tr:gt(0)').each(function(){
            trnum++
            if(trnum > maxRows){
                $(this).hide()
            }
            if(trnum <= maxRows){
                $(this).show()
            }
        })
        if(totalRows > maxRows){
            var pagenum = Math.ceil(totalRows/maxRows)
            for(var i=1;i<=pagenum;){
                $('.pagination').append('<li data-page="'+i+'">\<span>'+ i++ +'<span class="sr-only">(current)</span></span>\</li>').show()
            }
        }
        $('.pagination li:first-child').addClass('active')
        $('.pagination li').on('click',function(){
            var pageNum = $(this).attr('data-page')
            var trIndex = 0;
            $('.pagination li').removeClass('active')
            $(this).addClass('active')
            $(table+' tr:gt(0)').each(function(){
                trIndex++
                if(trIndex > (maxRows*pageNum) || trIndex <= ((maxRows*pageNum)-maxRows)){
                    $(this).hide()
                } else{
                    $(this).show()
                }
            })
        })
    })
    $(function(){
        $('table tr:eq(0)').prepend('<th>ID</th>')
        var id = 0;
        $('table tr:gt(0)').each(function(){
            id++
            $(this).prepend('<td>'+id+'</td>')
        })
    })
    </script>


</tags:pageTemplate>








