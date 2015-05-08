<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>서한 기술 자료실</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
</head>
<%
	String id = null;
	session.setAttribute("id", id);
%>
<body>
	<jsp:include page="nav.jsp" />
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<div id="goodPhrase">
					<h1 class="page-header">
						<a href="noticeList">공지사항</a> <small>기술 자료실</small>
					</h1>
					<!-- First Blog Post -->
					<ul class="list-group">
						<c:forEach items="${noticeList}" var="notice" varStatus="status"
							begin="0" end="1" step="1">
							<li class="list-group-item"><textarea style="width: 100%;"
									readonly rows="5">${notice.content}</textarea></li>
						</c:forEach>
					</ul>

				</div>
				<hr>
				<h4>원하는 책이 없다면 인터넷에서 주문하세요 !</h4>
				<div class="input-group" style="width: 90%">
					<form action="/findBook" method="post">
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


			</div>
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

				<div class="well" align="center">
					<jsp:include page="sidebar.jsp" />
				</div>

			</div>
		</div>
	</div>
	<!-- /.row -->
	<hr>
	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12"></div>
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

		$document.ready(function() {
			var date = "${con.regisdate}";
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
