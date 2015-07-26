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
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-12 col-sm-12 col-xs-12" style="float: left">
				<h1 class="page-header">
					<a href="noticeList">공지사항</a> <small>기술 자료실</small>
				</h1>
				<!-- First Blog Post -->
				<div style="float: right; width: 43%; margin-right: 30px"
					align="right">
					<div align="right" style="vertical-align: baseline; float: right;">
						<form action="/searchBook" method="post">
							<span class="input-group-btn"> <input type="text"
								style="width: 70%; float: left" class="form-control"
								id="keyword" name="keyword"
								placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
								<button class="btn btn-default" type="submit" id="btn_find">
									<span class="glyphicon glyphicon-search"></span>
								</button> <select class="selectpicker"
								style="width: 30%; font-size: 14px; margin-top: 10px; vertical-align: baseline;"
								id="select">
									<optgroup label="대분류">
										<option value="B-도서(단행본)">B-도서(단행본)
										<option value="E-기타매체">E-기타매체
										<option value="J-정기간행물">J-정기간행물
										<option value="P-특허자료">P-특허자료
										<option value="R-보고서">R-보고서
										<option value="S-규격/사전">S-규격/사전
										<option value="T-논문">T-논문
									</optgroup>
							</select></span>
						</form>
					</div>
				</div>
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered " id="dataTable">


						<thead>
							<tr>

								<th>도서명</th>

								<th class="hidden-xs hidden-sm hidden-md td-author">저자</th>
								<th class="hidden-xs hidden-sm td-genre">출판사</th>
								<th class="hidden-xs td-genre" style="width: 120px">분류</th>
								<th style="width: 100px">대여상태</th>



								<th class="td-img"></th>
							</tr>
						</thead>

						<tbody>

							<c:forEach items="${bookList}" var="book">

								<tr>

									<td align="left"><a href="#"
										onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=850');">
											${book.title }</a></td>
									<td class="hidden-xs hidden-sm hidden-md" align="left">${book.author }</td>
									<td class="hidden-xs hidden-sm" align="left">${book.publish}</td>
									<td class="hidden-xs td-genre" align="left">${book.b_group }</td>
									<c:choose>
										<c:when test="${book.rentchk=='0'}">
											<td align="left"><mark>대출가능</mark></td>
											<td align="left"><button class="btn btn-default"
													type="button" id="borrowbook"
													onClick="location.href='/borrowbook?book_cd=${book.book_cd}'; borrow();">대출</button></td>
										</c:when>

										<c:when test="${book.rentchk=='1' and book.reservechk=='1'}">
											<td>예약중</td>
											<td></td>
										</c:when>
										<c:when test="${book.rentchk=='1' and book.reservechk=='0'}">
											<td>~ <fmt:formatDate type="date" pattern="MM-dd"
													value="${book.returndate}" /></td>
											<td><button class="btn btn-default" type="button"
													id="reservebook"
													onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button></td>
										</c:when>

										<c:when test="${book.rentchk=='2' and book.reservechk=='1'}">
											<td>예약중</td>
											<td></td>
										</c:when>
										<c:when test="${book.rentchk=='2' and book.reservechk=='0'}">
											<td>~ <fmt:formatDate type="date" pattern="MM-dd"
													value="${book.returndate}" /></td>
											<td><button class="btn btn-default" type="button"
													id="reservebook"
													onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button></td>
										</c:when>

										<c:when test="${book.rentchk=='4'}">
											<td>대출 정지</td>
											<td></td>


										</c:when>
										<c:when test="${book.rentchk=='5'}">
											<td>예약중</td>
											<td></td>
										</c:when>
									</c:choose>
								</tr>


							</c:forEach>

						</tbody>
					</table>
				</div>


				<%-- <ul class="list-group"> ---------------------원본 위치
					<c:forEach items="${noticeList}" var="notice" varStatus="status"
						begin="0" end="1" step="1">
						<li class="list-group-item"><textarea style="width: 100%;"
								readonly rows="4">${notice.content}</textarea></li>
					</c:forEach>
				</ul> --%>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"
				style="float: right; margin-top: 40px">

				<%-- <jsp:include page="footer.jsp"></jsp:include>
				 --%>
				<%-- <h3>신간도서</h3> ------------------------원본 메인 화면

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
				</c:forEach> --%>
			</div>
			<%-- 
			<div class="col-md-8 col-sm-8 col-xs-12" style="float: left;">
				<jsp:include page="footer.jsp"></jsp:include>
			</div> --%>
			<div class="col-md-12 col-sm-12 col-xs-12" style="float: left;">
				<ul class="list-group">
					<c:forEach items="${noticeList}" var="notice" varStatus="status"
						begin="0" end="1" step="1">
						<li class="list-group-item"><textarea style="width: 100%;"
								readonly rows="4">${notice.content}</textarea></li>
					</c:forEach>
				</ul>
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
