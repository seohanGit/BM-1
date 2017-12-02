<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="SHORTCUT ICON" href="/resources/img/title.ico"/>
<title>서한 기술 자료실</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script>
	$(document).ready(function() {

// 		var date = "${con.regisdate}";
// 		if (date < now()) {
// 			$("#notice").append(newicon);
// 		}

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
<body style="margin-left:5%; width: 90%; background-color: #fffff5;">
	<jsp:include page="nav.jsp" />
	<!-- Page Content -->
	<div align="center"
		class="container col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">

		<div align="center">
			<div align="center" class="row"
				style=" margin-top: 3%">
				<div class="col-md-7   col-lg-7  " align="left" >
					<img src="/resources/img/title.png" style="width:55%; " >
					<!-- 					<h2 style="font-family:  ">SEOHAN LIBRARY</h2> -->
				</div>
				<div class="col-md-5   col-lg-5" align="right" style="float:right; padding: 0">
					<img src="/resources/img/background.jpg"
						style="width: 95%; "/>
				</div>
				<div class="col-md-7   col-lg-7" align="left" style="margin-top:5%">
					<div style="width: 40%;  float: left">
						<img style="width: 100%;" src="/resources/img/smartsearch.gif">
					</div>
					<div style="width: 100%;   float: left">
						<form action="/searchBook" method="post">
							<span class="input-group-btn"> <input type="hidden" name="listType" value=""><input
								style="width: 85%; float: left" type="text" class="form-control"
								id="keyword" name="keyword"
								placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
								<button class="btn btn-default" type="submit" id="btn_find"
									style="width: 15%">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</form>
					</div>
				</div>
				
			</div>
			<div align="center" class="row"
				style="position: static; height: 23%; background-color: #EEEEEE; padding: 0px; margin: 5px">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"
					style="float: center; display: block;">
					<div class="row" align="left" style="padding:0; margin-left: 4%">
					<h5 style="font-size :20px; margin: 1%; color: #428BCA ">Quick Menu</h5></div>
					<div class="col-md-4 col-sm-4 col-xs-4"
						style="float: left; padding: 5px">
						<a href="searchBook?listType=&keyword=" style="display: block"><img
							src="/resources/img/btn01.jpg" style="width: 70%; margin: 10px"></a>
						<a class="href" href="searchBook?listType=&keyword=">자료검색</a>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4"
						style="float: left; padding: 5px">
						<a href="borrowList" style="display: block"><img
							src="/resources/img/btn02.jpg" style="width: 70%; margin: 10px"></a>
						<a class="href" href="borrowList">대출 현황</a>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4"
						style="float: left; padding: 5px">
						<a href="request" style="display: block"><img
							src="/resources/img/btn03.jpg" style="width: 70%; margin: 10px"></a>
						<a class="href" href="request">자료구입신청</a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"
					style="float: right; text-align: left;">
					<h5 href="noticeList" style="font-size: 20px; color: #428BCA">공지사항</h5>
					<ul class="list-group" style="margin:1%; margin: 2%">
						<c:forEach items="${noticeList}" var="notice" varStatus="status"
							begin="0" end="0" step="1">
							<li class="list-group-item"><textarea style="width: 100%;"
									readonly rows="5">${notice.content}</textarea></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div align="center" class="row"
				style="position: static; height: 30%; padding: 0px; margin: 5px">
				<div class="col-lg-6  col-md-6  col-sm-12 col-xs-12"
					style="text-align: left; padding:0px;padding-right:3%; margin-top: 0px; position: static; height: 100%;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="position: static; height: 15%;">
						<div class="col-lg-5 col-md-5 col-sm-8 col-xs-8">
							<h3>신간도서</h3>
						</div>
						<div class="col-lg-7 col-md-7 col-sm-4 col-xs-4" style="margin-top:6%">
							<a href="/searchBook?listType=new&keyword=">more...</a>
						</div>
					</div>
					<c:forEach items="${newBook}" var="newBook" begin="0" end="2"
						step="1" varStatus="status">

						<div align="center" style="position: static; height: 75%;">
							<div class="col-md-4 col-sm-4 col-xs-4" style="padding: 3px">
								<div>
									<c:choose>
										<c:when test="${empty newBook.imageurl }">
											<img src="/resources/img/noimage.png" height="70%"
												width="70%">
										</c:when>
										<c:otherwise>
											<a
												onclick="window.open('/bookInfo?book_cd=${newBook.book_cd}&main=Y','new',
											 	'resizeble=yes scrollbars=yes, width=750, height=600');">
												<img src="${newBook.imageurl}" height="70%" width="70%">
											</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div style="position: relative; height: 20px;">
									<a	onclick="window.open('/bookInfo?book_cd=${newBook.book_cd}&main=Y','new',
										'resizeble=yes scrollbars=yes, width=750, height=600');">${newBook.title}</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div
					class="col-lg-6   col-md-6   col-sm-12 col-xs-12"
					style="text-align: left; padding: 0px; padding-left:3%; margin-left:0; position: static; height: 100%;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="position: static; height: 100%;">
						<div class="col-lg-5 col-md-5 col-sm-8 col-xs-8">
							<h3>추천도서</h3>							
						</div>
						<div class="col-lg-7 col-md-7 col-sm-4 col-xs-4" style="margin-top:6%">
							<a href="/searchBook?listType=recommend&keyword=">more...</a>
						</div>
					</div>
					<c:forEach items="${bestBook}" var="bestBook" begin="0" end="2"
						step="1" varStatus="status">
						<div align="center" style="position: static; height: 75%;">
							<div class="col-md-4 col-sm-4 col-xs-4" style="padding: 3px">
								<div>
									<c:choose>
										<c:when test="${empty bestBook.imageurl }">
											<img src="/resources/img/noimage.png" height="70%"
												width="70%">
										</c:when>
										<c:otherwise>
											<a
												onclick="window.open('/bookInfo?book_cd=${bestBook.book_cd}&main=Y','new',
										 	'resizeble=yes scrollbars=yes, width=750, height=600');">
												<img src="${bestBook.imageurl}" height="70%" width="70%">${bestbook.title}</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div style="position: relative; height: 20px">
									<a
										onclick="window.open('/bookInfo?book_cd=${bestBook.book_cd}&main=Y','new',
								'resizeble=yes scrollbars=yes, width=750, height=600');">${bestBook.title}</a>
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


	<!-- /.container -->
	<!-- jQuery -->
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>

</body>
</html>
