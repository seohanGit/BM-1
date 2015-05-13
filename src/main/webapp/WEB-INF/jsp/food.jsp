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
<title>Blog Home - Start Bootstrap Template</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
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
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered " id="dataTable">

						<%-- 
						
 --%>

						<tbody>

							<c:forEach items="${List1}" var="food" varStatus="loop">


								<tr align="left">
									<td>${food}</td>
								</tr>


							</c:forEach>
						</tbody>
					</table>
					<hr>
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

	<!-- /.container -->
	<!-- jQuery -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>

	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/metisMenu.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>

</body>
</html>
