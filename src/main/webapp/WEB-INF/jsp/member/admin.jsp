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
	<jsp:include page="../nav.jsp" />
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<h1 class="page-header">
					관리자 페이지 <small>Admin</small>
				</h1>
				<div class="btn-group" role="group" aria-label="...">
					<button type="button" class="btn btn-default" id="requestList">구매요청
					</button>
					<button type="button" class="btn btn-default" id="borrowListAll">대여요청</button>
					<button type="button" class="btn btn-default">반납요청</button>
					<button type="button" class="btn btn-default">예약현황</button>
				</div>
				<!-- First Blog Post -->

				<hr>

				<div class="input-group">
					<div style="width: 100%">
						<span class="input-group-btn" style="width: 340px"> <input
							type="text" class="form-control" id="keyword"
							placeholder="원하는 책이 없다면 인터넷에서 주문하세요 !"></span>
					</div>

					<button class="btn btn-default" type="button" id="btn_find"
						style="width: 40%">
						<span class="glyphicon glyphicon-search"></span>인터파크 검색
					</button>

					<button type="button" class="btn btn-default" id="insertBook">도서추가</button>
					<button class="btn btn-default" type="button" id="btn_search">도서목록</button>


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
				<button type="button" class="btn btn-default" role="button"
					id="blackList">블랙리스트 보기</button>
				<hr>
				<img src="/resources/lava4.JPG" style="width: 100%" id="image3">

				<div id="personResultArea"></div>
				<hr>
				<hr>
			</div>
			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">
				<!-- Blog Search Well -->
				<div class="well">
					<h4>도서 검색</h4>


					<div class="input-group">
						<input type="text" class="form-control" id="keyword"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button" id="btn_search">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
					<!-- /.input-group -->
				</div>

				<!-- Blog Categories Well -->
				<div class="well" align="center">
					<h3>이달의 베스트 회원 Top 3</h3>
					<br>
					<div>

						<div align="center">
							<c:forEach items="${bestList}" var="best" begin="0" end="2"
								step="1" varStatus="status">
								<strong> ${best.id} </strong>
								<br>
								<strong>${best.name}</strong>  ${best.score}점
								<br>
							</c:forEach>
						</div>

						<!-- /.col-lg-6 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- Side Widget Well -->
				<div class="well">

					<h3>신간도서</h3>
					<c:forEach items="${newbook}" var="newbook" begin="0" end="2"
						step="1" varStatus="status">

						<div class="row " align="center"
							onclick="location.href='${newbook.link}'">
							<div class="thumbnail" align="left"
								style="max-height: 150px; max-width: 100px">
								<img src="${newbook.imageurl}" height="100%" width="100%">
							</div>
							<div align="left">
								<p class="caption">${newbook.bookname}</p>
								<p class="caption">${newbook.writer}</p>
								<p class="caption">${newbook.genre}</p>
							</div>
						</div>
						<hr>
					</c:forEach>
					<h3>베스트 셀러</h3>
					<c:forEach items="${bestseller}" var="book" begin="0" end="2"
						step="1" varStatus="status">

						<div onclick="location.href='${book.link}'" class="row "
							align="center">
							<div class="thumbnail" align="left"
								style="max-height: 150px; max-width: 100px">
								<img src="${book.imageurl}" height="100%" width="100%">
							</div>
							<div align="left">
								<p class="caption">${book.bookname}</p>
								<p class="caption">${book.writer}</p>
								<p class="caption">${book.genre}</p>
							</div>
						</div>
						<hr>
					</c:forEach>
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
	</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		$("#insertBook").click(function() {
			location.href = "/insertbookForm"
		})
	</script>
</body>
</html>
