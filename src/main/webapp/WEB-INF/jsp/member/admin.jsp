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
<title>관리자 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<jsp:include page="../menu.jsp" />

				<!-- First Blog Post -->

				<hr>

				<div class="input-group" style="width: 80%">
					<form action="/findBook" method="get">
						<div style="width: 100%">

							<span class="input-group-btn"> <input type="text"
								class="form-control" id="query" name="keyword"
								style="width: 52%" placeholder="원하는 책이 없다면 인터넷에서 주문하세요 !">


								<button class="btn btn-default" type="submit" id="btn_find"
									style="width: 30%">
									<span class="glyphicon glyphicon-search"></span>인터파크 검색
								</button>

								<button type="button" class="btn btn-default" id="insertBook"
									style="width: 18%">도서추가</button></span>
						</div>
					</form>
				</div>

				<hr>
				<img src="/resources/lava3.JPG" style="width: 100%" id="image2">

				<div id="searchResultArea"></div>
				<hr>
				<hr>
				<!-- Second Blog Post -->
				<h2>
					<a href="#">사용자 관리</a>
				</h2>

				<p>
					<span class=></span>
				</p>
				<button type="button" class="btn btn-default" role="button"
					id="late">연체자 보기</button>

				<hr>
				<img src="/resources/lava4.JPG" style="width: 100%" id="image3">

				<div id="personResultArea"></div>
				<hr>
				<hr>
			</div>
			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">
				<!-- Blog Search Well -->

				<!-- Side Widget Well -->
				<div class="well">
					<jsp:include page="../sidebar.jsp" />

				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<hr>
	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</footer>

	<!-- /.container -->
	<!-- jQuery -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>

</body>
</html>
