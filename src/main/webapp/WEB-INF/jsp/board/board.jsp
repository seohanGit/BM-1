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
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<!-- Page Content -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<div class="wrapper" id="jumbotron">
					<div class="left">
					<br>
						<h2> &nbsp;추천 게시판</h2>
						
					</div>
					<div class="well right-end">
						<ul class="nav">
							
							<li class="active"><a href="boardwrite">추천 글쓰기</a></li>
							<li><a href="#" id="register">등록일자순</a></li>
							<li><a href="#" id="title">제목순</a></li>
						</ul>
					</div>
					<!--/.well -->

				</div>

				<div class="row" id="bulletin">
					<c:forEach items="${boardList}" var="board">
						<div class="board col-6 col-sm-6 col-lg-4">
							<h2>${board.title}</h2>
							<p class="content ellipsis">${board.content}</p>
							<p>
								<a class="btn btn-default">펼쳐보기 »</a>
							</p>
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
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>