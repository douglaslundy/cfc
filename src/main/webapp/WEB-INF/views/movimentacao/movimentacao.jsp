<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Cadastro de Alunos">

				<form:form class="form-horizontal" method="POST" action="${s:mvcUrl('MC#movimentacao').build()}">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Insira o Intervalo de datas</label>
							<label for="inputEmail3" class="col-sm-2 control-label">De</label>
							<div class="col-sm-2">
								<input name="dataInicial" value="${dataInicial}"  onkeyup="mascara( this, mdata);" maxlength="10"  class="form-control" type="text" autocomplete="off"  required="required"/>								
							</div>
							<label for="inputEmail3" class="col-sm-1 control-label"> até  </label>
							<div class="col-sm-2">
								<input name="dataFinal" value="${dataFinal}"  onkeyup="mascara( this, mdata);" maxlength="10"  class="form-control" type="text" autocomplete="off"  required="required"/>								
							</div>
							<div class="col-sm-1">
								<button type="submit" id="btn" class="btn btn-primary glyphicon glyphicon-search"></button>
							</div>
						</div>
					</form:form>
					
					
					

 		${mensagem}
 		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Saldo Atual em Caixa</th>
				<th>R$ ${total}</th>
			</tr>
		</table>
		<table id="mytable" class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>Nome:</th>
				<th>Tipo da Movimentação</th>
				<th>Valor</th>
				<th>Data da Movimentação</th>
			</tr>
			</thead>
 	    <tbody>
			<c:forEach items="${movimentacao}" var="m">
				<tr>
					<td>${m.nome}</td>
					<td>${m.tipo}</td>
					<td>${m.valor}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${m.data.time}" /></td>
				</tr>
			</c:forEach>			
		</tbody>
        </table>
		
		
		 <div class="pagination-container">
            <nav>
                <ul class="pagination"></ul>
            </nav>
        </div>
		
	
		<a href="${contextPath}/autoescola/movimentacao/form" class="btn btn-primary">Nova Movimentação</a>
		
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