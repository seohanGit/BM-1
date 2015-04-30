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
		<div class="col-md-4">

			<c:forEach items="${team}" var="team" begin="0" end="2">

				<div>${team}</div>
			</c:forEach>
			<!-- Blog Search Well -->
			<!-- 
				<div class="well">
					<tr>
						<td><button class="btn btn-default" type="button"
								id="btn_bookList" style="width: 100%">도서목록</button></td>
					</tr>
					<hr>
					<div class="input-group">
						<input type="text" class="form-control" id="keyword"
							placeholder="도서검색"> <span class="input-group-btn">
							<button class="btn btn-default" type="button" id="btn_search">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>



					/.input-group
				</div> -->
			<!-- Blog Categories Well -->


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
	<script src="/resources/js/book.js"></script>

</body>
</html>
