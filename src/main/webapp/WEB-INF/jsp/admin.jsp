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
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<h1 class="page-header">
					관리자 페이지 <small>Admin</small>
				</h1>
				<!-- First Blog Post -->
				<h2>
					도서 검색/수정/삭제
				</h2>

				<p>
					<span class=></span>
				</p>


				<div class="input-group ">
					<input type="text" class="form-control" id="query" placeholder="인터파크 검색"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button" id="btn_find">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<button type="button" class="btn btn-default" id="insertBook">도서추가</button>
						<button class="btn btn-default" type="button" id="btn_search">도서목록</button>
					</span>

				</div>

				<hr>
				<img src="/resources/lava3.JPG" style="width:100%; "
					id="image2">
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
				<img src="/resources/lava4.JPG" style="width: 100%;"
					id="image3">
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
					<div class="row">
						<div align="center">
							<c:forEach items="${bestList}" var="best" begin="0" end="2"
								step="1" varStatus="status">
								<font size=3><strong> ${best.id} </strong></font>
								<br>
								<strong>${best.name}</strong>
								<br>
                                  ${best.score}점<br>
								<br>
							</c:forEach>
						</div>
						<!-- /.col-lg-6 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- Side Widget Well -->
				<div class="well">
					<h4>데이터베이스 배움터</h4>
					<p>이 책을 저술하기 위해서 약 20,000페이지에 가까운 자료를 찾아서 검토하였다. 또한 이 분야에서 오랜
						강의 경험이 있는 많은 교수들의 자문도 구하였다. 이와 같은 준비 과정을 거쳐, 적절한 학습 분량의 데이터베이스의
						기본적인 개념과 실용적인 주제들을 정선하여 이 책을 저술하였다. 실제 업무와 관련이 적은 순수한 데이터베이스 이론
						주제들은 과감하게 배제하였고, 개념을 알기 쉽게 보여주는 그림들을 많이 사용하여 이해하기 쉬운 책이 되도록 꾸몄다.</p>
					<c:forEach items="${bookmodel}" var="book" begin="0" end="2"
						step="1" varStatus="status">
						<div class="row" align="center">
							<div align="center">
								<div class="thumbnail" align="center">
									<img src="${book.imageurl}">
									<div class="caption">
										<p>${book.bookname}</p>
									</div>
								</div>
							</div>
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
