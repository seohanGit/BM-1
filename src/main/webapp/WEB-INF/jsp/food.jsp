<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>식단표</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.datepicker').datepicker({
			showOn : "button",
			buttonImage : "/resources/img/calendar.gif",
			buttonImageOnly : true,
			buttonText : "Select date",
			dateFormat : "yy-mm-dd"		
			}
		);
	});
	
</script>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<!-- Page Content -->
	<div class="row">
		<!-- Blog Entries Column -->
		<!-- Blog Sidebar Widgets Column -->

		<div class="panel panel-default">

			<!-- /.panel-heading -->
			<div class="panel-body">
				날짜
				<div class="input-group date" data-provide="datepicker">
					<input class="datepicker" id="datepicker" name="datepicker"
						type="text" value="${date}">
				</div>
				<div class="dataTable_wrapper">
					아침
					<table class="table table-striped table-bordered " id="dataTable">
						<tbody>
							<c:forEach items="${List1}" var="food" varStatus="loop">


								<tr align="left">
									<td>${food}</td>
								</tr>


							</c:forEach>
						</tbody>
					</table>
					<hr>
					점심
					<table class="table table-striped table-bordered ">
						<tbody>
							<c:forEach items="${List2}" var="food" varStatus="loop">


								<tr align="left">
									<td>${food}</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<hr>
					저녁
					<table class="table table-striped table-bordered ">
						<tbody>
							<c:forEach items="${List3}" var="food" varStatus="loop">


								<tr align="left">
									<td>${food}</td>


								</tr>
							</c:forEach>

						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- /.row -->
	<hr>


	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="/resources/js/etc.js"></script>
	<script type="text/javascript">
		
	</script>

</body>
</html>
