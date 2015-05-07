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
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center; margin: 0 auto; z-index: 100000;">
		<table width="100%" height="100%" border="0" bgcolor="#000000">
			<tr>
				<td align="center">
					<div style="text-align: center;">
						<IMG SRC="resources/img/loading_map.gif">
					</div>
					<div
						style="margin-top: 20px; color: #FFF; text-align: center; font-weight: bold; font-size: 40px">L
						o a d i n g . . .</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="divLoadBody" style="display: none;" class="container">

		<div id="searchResultArea">
			<hr>
			<h2>도서검색 목록</h2>
			<hr>

			<div class="dataTable_wrapper">
				<table class="table table-striped table-bordered " id="dataTable">


					<thead>
						<tr>
							<th></th>
							<th class="hidden-xs" id="td-img">표지</th>
							<th id="td-title">도서명</th>
							<th class="hidden-xs" id="td-genre">저자</th>
							<th class="hidden-xs hidden-sm" id="td-genre">분류</th>
							<th class="hidden-xs hidden-sm" id="td-date">출판사</th>
							<th id="td-genre">대여상태</th>
							<th style="width: 30px"></th>
						</tr>
					</thead>
					<%-- 
						
 --%>
					<tbody>

						<c:forEach items="${bookList}" var="book">

							<tr>
								<td style="width: 20px"><input type="checkbox"
									name="book_cd" value="${book.book_cd}"></td>
								<td class="hidden-xs" style="width: 50px" align="left"><img
									style="width: 50px" src="${book.imageurl}"></td>
								<td align="left"><a
									href="/bookInfo?book_cd=${book.book_cd}"> ${book.title }</a></td>
								<td class="hidden-xs" align="left">${book.author }</td>
								<td class="hidden-xs hidden-sm" align="left">${book.b_group}</td>
								<td class="hidden-xs hidden-sm" align="left">${book.publish}</td>
								<c:choose>
									<c:when test="${book.rentchk=='0'}">
										<td align="left">대출가능</td>
										<td>
											<button class="btn btn-default btn-sm" type="button"
												id="reservebook"
												onClick="location.href='/stopBorrow?book_cd=${book.book_cd}'">대출정지</button>
											<button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
										</td>
									</c:when>
									<c:when test="${book.rentchk=='1'}">
										<td><mark>대여요청중</mark></td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
										</td>
									</c:when>
									<c:when test="${book.rentchk=='2'}">
										<td>대출중</td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
										</td>
									</c:when>
									<c:when test="${book.rentchk=='4'}">
										<td><mark>대출정지</mark></td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/recoverBook?book_cd=${book.book_cd}'">대출재개</button></td>
									</c:when>
									<c:when test="${book.rentchk=='5'}">
										<td><mark>예약중</mark></td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
										</td>
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
				"columns" : [ {
					"searchable" : false
				}, {
					"searchable" : false
				}, null, null, {
					"searchable" : false
				}, {
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