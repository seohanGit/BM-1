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
			<div class="col-md-8 col-lg-8 col-sm-12">

				<jsp:include page="../menu.jsp" />

				<!-- First Blog Post -->


				<div class="col-xs-12 col-md-11 col-sm-11 input-group"
					style="margin-left: 10px">
					<div class="input-group" style="width: 95%">
						<form action="/searchBook" method="post">
							<span class="input-group-btn"> <input type="text"
								class="form-control" id="keyword" name="keyword"
								placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
								<button class="btn btn-default" type="submit" id="btn_find">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</form>
					</div>
					<form action="/findBook" method="post">
						<div style="width: 100%">
							<input type="text" class="form-control" id="query" name="keyword"
								style="width: 62%" placeholder="원하는 책이 없다면 인터넷에서 주문하세요 !">
							<button class="btn btn-default" type="submit" id="btn_find"
								style="width: 38%">
								<span class="glyphicon glyphicon-search"></span>인터파크 검색
							</button>
						</div>
					</form>
				</div>

			</div>

			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4 col-xs-12" style="float: right">
				<!-- Blog Search Well -->

				<!-- Side Widget Well -->
				<jsp:include page="../sidebar.jsp" />

			</div>
			<hr>
			<div class="col-md-8 col-lg-8 col-xs-12" style="float: left;">
				<jsp:include page="../footer.jsp"></jsp:include>
			</div>
			<!-- /.col-lg-12 -->
			<footer>

				<!-- /.row -->
			</footer>
		</div>
		<!-- /.row -->

		<!-- Footer -->
	</div>

	<!-- /.container -->
	<!-- jQuery -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>

</body>
</html>
