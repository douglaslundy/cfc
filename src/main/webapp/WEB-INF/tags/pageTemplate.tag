<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>
<c:url value="/" var="contextPath" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Dlsistemas |</title>

<!-- Bootstrap -->
<link
	href="${contextPath}resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${contextPath}resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="${contextPath}resources/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="${contextPath}resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link
	href="${contextPath}resources/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">
<!-- Select2 -->
<link
	href="${contextPath}resources/vendors/select2/dist/css/select2.min.css"
	rel="stylesheet">
<!-- Switchery -->
<link
	href="${contextPath}resources/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">
<!-- starrr -->
<link href="${contextPath}resources/vendors/starrr/dist/starrr.css"
	rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link
	href="${contextPath}resources/vendors/bootstrap-datetimepicker/datetimepicker.min.css"
	rel="stylesheet">

<!-- FullCalendar -->
    <link href="${contextPath}resources/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="${contextPath}resources/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">    
	<script src="${contextPath}resources/vendors/jquery/dist/jquery-callendar.min.js"></script>
	
	
	<!-- Mascaras -->
	<script src="${contextPath}resources/vendors/scripts/mask.js"></script>

<!-- Custom Theme Style -->
<link href="${contextPath}resources/build/css/custom.min.css" rel="stylesheet">
</head>

<%@ include file="/WEB-INF/views/cabecalho.jsp"%>


<!-- Inicio vem antes do conteudo -->
<div class="right_col" role="main">
	<div class="">
		
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					
					<div class="x_content">
						<br />
						
						
						<!-- Fim do vem antes do conteudo -->


						<jsp:doBody />

						<jsp:invoke fragment="extraScripts"></jsp:invoke>

						<%@ include file="/WEB-INF/views/rodape.jsp"%>
</html>
