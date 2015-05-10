<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>도서 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="loadingBar"
		style="background-color: #fff; position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center; margin: 0 auto; z-index: 100000;">
		<table width="100%" height="100%" border="0" bgcolor="#fff">
			<tr>
				<td align="center">
					<div style="text-align: center;">
						<IMG SRC="resources/img/loading_map.gif">
					</div>
					<div
						style="margin-top: 20px; color: #000; text-align: center; font-weight: bold; font-size: 40px">L
						o a d i n g . . .</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="divLoadBody" style="display: none;" class="container">

		<div id="searchResultArea">
			<hr>
			<h2>도서검색 목록</h2>

			<h4>원하는 책이 없다면 인터넷에서 주문하세요 !</h4>
			<div class="input-group ">
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
			<div class="dataTable_wrapper">
				<table class="table table-striped table-bordered " id="dataTable">


					<thead>
						<tr>

							<th id="td-title">도서명</th>
<<<<<<< HEAD
							<th id="td-genre">저자</th>
							<th id="td-genre">분류</th>
							<th id="td-genre">대여상태</th>
=======
							<th class="hidden-xs" id="td-genre">저자</th>
							<th class="hidden-xs" id="td-genre">분류</th>
							<th id="td-genre">대여 상태</th>
>>>>>>> 855aa46589b36538442bfa1cd0488cce2e8ccf4d
							<th id="td-img"></th>
						</tr>
					</thead>
					<%-- 
						
 --%>
					<tbody>

						<c:forEach items="${bookList}" var="book">

							<tr>

								<td align="left"><a href="#"
									onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes');">
										${book.title }</a></td>
								<td class="hidden-xs" align="left">${book.author }</td>
								<td class="hidden-xs" align="left">${book.b_group}</td>
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
										<td>대여중</td>
										<td><button class="btn btn-default" type="button"
												id="reservebook"
												onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button></td>
									</c:when>

									<c:when test="${book.rentchk=='2' and book.reservechk=='1'}">
										<td>예약중</td>
										<td></td>
									</c:when>
									<c:when test="${book.rentchk=='2' and book.reservechk=='0'}">
										<td>대여중</td>
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
		</div>
	</div>

	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/metisMenu.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {

			$('#dataTable').DataTable({
				"pageLength" : 10,
				paging : true,
				ordering : true,
				"columns" : [ null, null, {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				} ],

			});
		});

		var loadingBar = document.getElementById("loadingBar");
		var divLoadBody = document.getElementById("divLoadBody");

		divLoadBody.style.display = "";
		loadingBar.style.display = "none";
	</script>
</body>
</html>