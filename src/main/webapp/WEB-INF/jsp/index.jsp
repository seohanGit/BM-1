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

	$document.ready(function() {

		$('table.highchart').highchartTable();
		var date = "${con.regisdate}"; 
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
	<div align="center" class="container col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2" >
		<div align="center" >
			<div align="left" class="row" style="position: relative;height:25%; margin-top: 10px"> 
					<!-- First Blog Post -->
					<div style="width: 50%; float:left">
						<h2>기술자료실</h2>
					</div>
					<div align="right">
						<img src="/resources/img/background.jpg" style="width: 40%; height: 60%" />
					</div>
					<div align="left"
						style="vertical-align: middle; position: absolute; bottom: 20%; right: 50%; width: 50%">
						<form action="/searchBook" method="post">
							<span class="input-group-btn"> <input type="text"
								style="width: 85%; float: left" class="form-control" id="keyword"
								name="keyword" placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
								<button class="btn btn-default" type="submit" id="btn_find"
									style="width: 15%">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</form>
					</div> 
			</div>
			<div align="center" class="row" style="overflow: auto; height:25%; background-color:#EEEEEE; ;">
				<div class="col-md-6 col-sm-12 col-xs-12"
					style="float: left; display: block;">
					<div class="col-md-4 col-sm-4 col-xs-4"
						style="float: left; display: block; text-align: center">
						<a href="#" style="display: block"><img
							src="/resources/img/btn2.png" style="width: 95%; margin: 10px"></a>
						<a class="href" href="searchBook?field=title&keyword=" style="display: block">도서검색</a>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4"
						style="float: left; display: block; text-align: center">
						<a href="borrowList" style="display: block"><img
							src="/resources/img/btn1.png" style="width: 95%; margin: 10px"></a>
						<a class="href" href="borrowList" style="display: block">대출/연장/예약 조회</a>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4"
						style="float: left; display: block; text-align: center">
						<a href="request" style="display: block"><img
							src="/resources/img/btn3.png" style="width: 95%; margin: 10px"></a>
						<a class="href" href="request" style="display: block;">자료구입신청</a>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12"
					style="float: right; text-align: left;">
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
			<div align="center" class="row" style="position: relative;height:25%;">
				<div class="col-md-6 col-sm-12 col-xs-12"
					style="float: left; text-align: left; margin-bottom: 30px;  ">				
					<div class="row"  >
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8"><h3>신간도서</h3> <a href="/searchBook?listType=new" >more...</a></div>
					</div>
					<c:forEach items="${newBook}" var="newBook" begin="0" end="2"
						step="1" varStatus="status">
						<div align="center">
							<div class="col-md-4 col-sm-4 col-xs-4"
								style="float: left; display: block; text-align: center;">
								<c:choose>
											<c:when test="${empty newBook.imageurl }">
												<img src="/resources/img/noimage.png" height="80%" width="80%">  
											</c:when>
											<c:otherwise>
											 	<a onclick="window.open('/bookInfo?book_cd=${newBook.book_cd}','new','resizeble=yes scrollbars=yes, width=750, height=500');"><img src="${newBook.imageurl}" height="100%" width="100%"></a>
											 	<a onclick="window.open('/bookInfo?book_cd=${newBook.book_cd}','new','resizeble=yes scrollbars=yes, width=750, height=500');">${newbook.title}</a>
											</c:otherwise>
									</c:choose>								
							</div>							
						</div>
					</c:forEach>
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12"
					style="float: left; text-align: left;">
					<div class="row">
					<div class="col-md-8 col-sm-8 col-xs-8"><h3>추천도서</h3> <a href="searchBook?listType=recommend" >more...</a></div>
					</div>
					<c:forEach items="${bestBook}" var="bestBook" begin="0" end="2"
						step="1" varStatus="status">
						<div align="center">
							<div class="col-md-4 col-sm-4 col-xs-4"
								style="float: left; display: block; text-align: center; ">
								<c:choose>
										<c:when test="${empty bestBook.imageurl }">
											<img src="/resources/img/noimage.png" height="80%" width="80%">
										</c:when>
										<c:otherwise>
										 	<a onclick="window.open('/bookInfo?book_cd=${bestBook.book_cd}','new','resizeble=yes scrollbars=yes, width=750, height=500');"><img src="${bestBook.imageurl}" height="100%" width="100%">${bestbook.title}</a>
										 	<a onclick="window.open('/bookInfo?book_cd=${bestBook.book_cd}','new','resizeble=yes scrollbars=yes, width=750, height=500');">${bestbook.title}</a>
										</c:otherwise>
								</c:choose> 
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
