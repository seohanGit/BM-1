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
<script src="/resources/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/highchartTable.js"></script>
<script type="text/javascript" src="/resources/js/highcharts.js"></script>
<script>
	$("#logout").click(function() {
		location.href = "/logout"
	})

	$document.ready(function() {

		$('table.highchart').highchartTable();
		var date = "${con.regisdate}";
		var newicon = "<span class="label label-default">New</span></h3>";
		if (date < now()) {
			$("#notice").append(newicon);
		}

	});
	var array = [ "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9" ];
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
			<div class="col-md-8 ">


				<div id="goodPhrase">
					<h1 class="page-header">
						<a href="noticeList">공지사항</a> <small>기술 자료실</small>
					</h1>
					<!-- First Blog Post -->
					<ul class="list-group">
						<c:forEach items="${noticeList}" var="notice" varStatus="status"
							begin="0" end="1" step="1">
							<li class="list-group-item"><textarea style="width: 100%;"
									readonly rows="4">${notice.content}</textarea></li>
						</c:forEach>
					</ul>

				</div>
				<hr>
				<h4></h4>
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
				<br>
				<hr>
				<div class="input-group" style="width: 95%">
					<form action="/findBook" method="post">
						<span class="input-group-btn"> <input type="text"
							class="form-control" id="keyword" name="keyword"
							placeholder="인터파크 검색">
							<button class="btn btn-default" type="submit" id="btn_find">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
			</div>
			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">

				<br> <br>

				<h3>신간도서</h3>

				<c:forEach items="${newbook}" var="newbook" begin="0" end="2"
					step="1" varStatus="status">
					<hr>
					<div align="center">
						<div class="thumbnail" align="left"
							style="height: 90px; width: 60px">
							<img src="${newbook.imageurl}" height="100%" width="100%">
						</div>
						<div align="left">
							<p class="caption">
								<a href="#"
									onclick="window.open('/bookInfo?book_cd=${newbook.book_cd}','new','resizeble=yes scrollbars=yes, width=850, height=850');">${newbook.title}</a>
							</p>
							<p class="caption">${newbook.author}</p>
							<p class="caption">입고일 : ${newbook.rcv_date}</p>
						</div>
					</div>
					<hr>
				</c:forEach>

				<div id="searchResultArea"></div>
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
			<div class="col-md-8 col-xs-12" style="float: left;">
				<jsp:include page="footer.jsp"></jsp:include>
			</div>

			<div class="col-md-4 col-xs-12" style="float: right">
				<c:forEach items="${bestTeam}" var="team" begin="0" end="4">
					<div class="progress">
						<div class="progress-bar progress-bar-info" role="progressbar"
							style="width: ${team.count/team.max*100}%">${team.team_nm}-
							${team.count} 권</div>
					</div>

				</c:forEach>
			</div>
		
		</div>
	</div>

	<!-- /.row -->
	<hr>
	<!-- Footer -->


	<!-- /.container -->
	<!-- jQuery -->
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>

</body>
</html>
