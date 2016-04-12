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
<title>추천도서</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<!-- Page Content -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
				<div class="wrapper" id="jumbotron">
					<div class="left">
					<br>
						<h2> &nbsp;추천도서</h2> 
					</div>  
				</div> 
				
				<div class="row" >
					<select class="selectpicker" style="font-size: 14px;width: 100%"
										id="year" name="year">
										<optgroup label="년도">
											 
											<option value="F-PDF">F-PDF  
										</optgroup>
									</select>
					<select class="selectpicker" style="font-size: 14px;width: 100%"
										id="month" name="month">
										<optgroup label="월별">
											 
											<option value="F-PDF">F-PDF  
										</optgroup>
									</select>
				</div>
				<div class="row" id="bulletin">
					<c:forEach items="${recommandBook}" var="book">
						<div class="board col-6 col-sm-6 col-lg-6">
							<h2>${book.title}</h2>
							<p class="content ellipsis">${book.summary}</p>
							 
						</div>
					</c:forEach>
				</div>
				 
				<!--/row-->
			</div>
			<!--/span-->

			<!--/span-->
		</div>
		<!--/row-->
		<hr>
		<footer> </footer>
	</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/board.js"></script>
</body>
</html>