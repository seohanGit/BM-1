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
				<div id="goodPhrase">
					<h1 class="page-header">
						공지사항 <small>민상훈책방</small>
					</h1>
					<!-- First Blog Post -->
					<ul class="list-group">
						<c:forEach items="${contentList}" var="con" varStatus="status">
							<li class="list-group-item"><textarea
									style="width: 100%; height: 110px" readonly>${con.content}</textarea></li>
						</c:forEach>
					</ul>

				</div>
				<hr>
				<h4>원하는 책이 없다면 인터넷에서 주문하세요 !</h4>
				<div class="input-group" style="width: 90%">
					<form action="/findBook" method="get">
						<span class="input-group-btn"> <input type="text"
							class="form-control" id="query" name="keyword"
							placeholder="인터파크 검색">
							<button class="btn btn-default" type="submit" id="btn_find">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
				<hr>
				<img src="/resources/main.JPG" style="width: 100%" id="image1">

				<div id="searchResultArea"></div>

				<hr>
				<p>잠은 인생의 사치입니다! 저는 하루 네 시간만 자면 충분하다고 생각해요.</p>
				<hr>
				<!-- Pager -->
				<ul class="pager">
					<li class="previous"><a href="#">&larr; Older</a></li>
					<li class="next"><a href="#">Newer &rarr;</a></li>
				</ul>

			</div>
			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">
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

				<div class="well" align="center">
					<jsp:include page="sidebar.jsp" />
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
		<script src="/resources/js/book.js"></script>
		<script>
			$("#logout").click(function() {
				location.href = "/logout"
			})

			$document
					.ready(function() {
						var date = "${con.registerdate}";
						var newicon = "<span class="label label-default">New</span></h3>";
						if (date < now()) {
							$("#notice").append(newicon);
						}

					});
			var array = [ "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8",
					"a9" ];
			function deletee() {
				for ( var i in array) {
					$("#array[i]").hide();
				}

			}

			window.onload = function() {
				deletee();

			};

			var cnt = 0;
			function add() {
				if (cnt == 10) {
					clearInterval(timer);
				}
				$("#array[cnt]").show();

				cnt++;
			}

			var timer = setInterval(add, 2000);
		</script>
</body>
</html>
