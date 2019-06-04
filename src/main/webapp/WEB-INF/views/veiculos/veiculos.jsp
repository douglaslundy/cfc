<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Listagem de Veiculos">
<h3>Listagem de Veículos</h3>
 
 					<form:form class="form-horizontal" method="POST" action="${s:mvcUrl('VC#editDataList').build()}">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-1 control-label">Veículos</label>
							<div class="col-sm-10">
								<input id="veiculoDL" name="veiculoDataList" class="form-control" type="text" list="veiculos" autocomplete="off" required="required" />
								<datalist id=veiculos>
									<c:forEach var="veiculo" items="${veiculos}">
										<option
											value="${veiculo.id} - ${veiculo.marca} -  ${veiculo.ano} -  ${veiculo.modelo} -  ${veiculo.cor}">
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
				<th>Marca:</th>
				<th>Modelo:</th>
				<th>Cor</th>
				<th>Ano de Fabricacao</th>
				<th>KM Inicial</th>
				<th>KM Atual</th>
				<th>Opções</th>
			</tr>
			</thead>
			     <tbody>
			<c:forEach items="${veiculos}" var="veiculo">
				<tr>
					<td>${veiculo.marca}</td>
					<td>${veiculo.modelo}</td>
					<td>${veiculo.cor}</td>
					<td>${veiculo.ano}</td>
					<td>${veiculo.kmInicial}</td>
					<td>${veiculo.kmAtual}</td>
					<td><a href="${contextPath}/autoescola/veiculos/edit/${veiculo.id}" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-edit"></span> Editar</a></td>
				</tr>
			</c:forEach>
		</tbody>
        </table>
		
		
		 <div class="pagination-container">
            <nav>
                <ul class="pagination"></ul>
            </nav>
        </div>
		
	
		<a href="${contextPath}/autoescola/veiculos/form"  class="btn btn-primary">Novo Veículo</a>
		
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