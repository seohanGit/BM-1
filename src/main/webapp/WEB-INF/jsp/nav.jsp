
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Navigation -->

<!--

//-->

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container col-lg-offset-1  "
		style="margin-left: 3%">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="  navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index">기술 자료실</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav " role="menu">
				<li><a href="searchBook?listType=&keyword=">자료검색</a></li>
				<li><a href="board">게시판</a></li>
				<li><a href="searchBook?listType=new&keyword=">신간도서</a></li>
				<li><a href="searchBook?listType=recommend&keyword=">추천도서</a></li>
				<li><a href="searchBook?listType=best&keyword=">베스트 도서</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.team_nm}
						${sessionScope.kname} <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#" id="borrowReqList">대출요청현황</a></li>
						<li><a href="#" id="borrowList">대출현황</a></li>
						<li><a href="#" id="request">자료구입신청</a></li>
						<li><a href="#" id="record">대출기록</a></li>
					</ul></li>
				<c:choose>
					<c:when test="${sessionScope.permission ==1}">
						<li style="font-size: 9px"><a href="admin">관리자페이지</a></li>
					</c:when>
				</c:choose>


			</ul>

		</div>

	</div>
	<!-- /.navbar-collapse -->



	<!-- /.container -->
</nav>


<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">암호 확인</h4>
			</div>
			<div class="modal-body">
				<form action="/modify" method="post" class="form-inline" role="form">
					<div class="form-group">
						<label class="sr-only" for="password">비밀번호</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="password">
					</div>
					<button type="submit" class="btn btn-default">확인</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="/resources/js/jquery/jquery.js"></script>
<script>
	$("#request").click(function() {
		location.href = "/request"
	})
	$("#record").click(function() {
		location.href = "/record"
	})
	$("#statistic").click(function() {
		location.href = "/statistic"
	})
	$("#reserveList").click(function() {
		location.href = "/reserveList"
	})
	$("#borrowList").click(function() {
		location.href = "/borrowList"
	})
	$("#borrowReqList").click(function() {
		location.href = "/borrowReqList"
	})
	$("#noticeListByAdmin").click(function() {
		location.href = "/noticeListByAdmin"
	})

	$("#bookList").click(function() {
		location.href = "/bookList"
	})
	$("#board").click(function() {
		location.href = "/board"
	})
	$("#boardList").click(function() {
		location.href = "/boardList"
	})
</script>