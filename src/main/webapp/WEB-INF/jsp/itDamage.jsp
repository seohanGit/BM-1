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
<title>전산고장신고</title>
<link rel="SHORTCUT ICON" href="/resources/img/seohanico.gif"/>
<link href="/resources/img/seohanico.jpg" rel="apple-touch-icon" sizes="180x180" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
</head>
<body> 
	<!-- Page Content -->
	<div class="row">
		<!-- Blog Entries Column -->
		<!-- Blog Sidebar Widgets Column -->

		<div class="panel panel-default">

			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper"> 
					<table class="table table-striped table-bordered " id="dataTable"> 
						<tbody>

							<c:forEach items="${List}" var="List" varStatus="loop"> 
								<tr align="left">
									<td class="genre">${List.gsgubn}</td>
									<td class="genre">${List.jteam}</td>
									<td class="genre">${List.jname}</td>
									<td class="longlen"><a href="tel:${List.jtel}">${List.jtel}</a></td>
									<td>${List.jtxt}</td> 
									<td class="genre"><button class="btn btn-default btn-sm"
														type="button" id="endDamage"
														onClick="location.href='/endDamage?gsgubn=${List.gsgubn}&jtime=${List.jtime}';  ">완료</button>
														</td>
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
