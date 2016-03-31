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
<title>서한 기술 자료실</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
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
		<div class="row col-md-12 col-sm-12 col-xs-12">
			<!-- Blog Entries Column -->
			<h1>기술 자료실</h1>
		</div>

		<div align="center" class="row col-md-12 col-sm-12	col-xs-12"
			 >
			<!-- First Blog Post -->
			<img align="middle" src="/resources/img/background.png"
				style="width: 100%; height: 150px" />

			<div align="center"
				style="vertical-align: baseline; ">
				<form action="/searchBook" method="post">
					<span class="input-group-btn"> <input type="text"
						style="width: 96%; float: left" class="form-control" id="keyword"
						name="keyword" placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
						<button class="btn btn-default" type="submit" id="btn_find" style="width:4%">
							<span class="glyphicon glyphicon-search"  ></span>
						</button>
					</span>
				</form>
			</div>
		</div>
		<div align="center" class="row col-md-12 col-sm-12 col-xs-12"  >
			<div class="col-md-6 col-sm-6 col-xs-6"
				style="float: left; display: block;  ">
				<div class="col-md-4 col-sm-4 col-xs-4"
					style="float: left; display: block; text-align: center">
					<a href="#" style="display: block"><img
						src="/resources/img/btn1.png" style="width: 100%; margin: 10px"></a>
					<a href="#" style="display: block">개인정보관리</a>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4"
					style="float: left; display: block; text-align: center">
					<a href="borrowList" style="display: block"><img
						src="/resources/img/btn2.png" style="width: 100%; margin: 10px"></a>
					<a href="borrowList" style="display: block">대출/예약연기</a>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4"
					style="float: left; display: block; text-align: center">
					<a href="request" style="display: block"><img
						src="/resources/img/btn3.png" style="width: 100%; margin: 10px"></a>
					<a href="request" style="display: block">도서구매신청</a>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="float: right; text-align: left;"> 
				<a href="noticeList" style="font-size: 20px;">공지사항</a> 
				<ul class="list-group">
					<c:forEach items="${noticeList}" var="notice" varStatus="status"
						begin="0" end="0" step="1">
						<li class="list-group-item"><textarea style="width: 100%;"
								readonly rows="4">${notice.content}</textarea></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div align="center" class="row col-md-12 col-sm-12 col-xs-12" style="float: left">
			<div class="col-md-6 col-sm-6 col-xs-6" style="float: left; text-align: left;">
				<h4>신간도서</h4>
				<c:forEach items="${newbook}" var="newbook" begin="0" end="2"
					step="1" varStatus="status">
					<div align="center"> 
						<div class="col-md-4 col-sm-4 col-xs-4"
					style="float: left; display: block; text-align: center; height: 90px;">
							<img src="${newbook.imageurl}" height="100%" width="100%">
							<a href="#"
								onclick="window.open('/bookInfo?book_cd=${newbook.book_cd}','new','resizeble=yes scrollbars=yes, width=850, height=850');">${newbook.title}</a>
						</div>

					</div>
				</c:forEach>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="float: left; text-align: left;">
				<h4>추천도서</h4>
				<c:forEach items="${newbook}" var="newbook" begin="0" end="2"
					step="1" varStatus="status">
					<div align="center">
						<div class="col-md-4 col-sm-4 col-xs-4"
					style="float: left; display: block; text-align: center; height: 90px;">
							<img src="${newbook.imageurl}" height="100%" width="100%">
							<a href="#"
								onclick="window.open('/bookInfo?book_cd=${newbook.book_cd}','new','resizeble=yes scrollbars=yes, width=850, height=850');">${newbook.title}</a>
						</div>
						<%-- 							<p class="caption">${newbook.author}</p> --%>
						<%-- 							<p class="caption">입고일 : ${newbook.rcv_date}</p> --%>

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
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').dataTable({
				"language" : {
					"url" : "dataTables.korean.lang"
				},
				/* "pageLength" : 10, */
				"pageLength" : 20,
				paging : true,
				searching : false,
				"columns" : [ null, null, null, {
					"searchable" : false

				}, {
					"searchable" : false
				}, {
					"searchable" : false,

				} ]

			});
		});
	</script>
</body>
</html>
