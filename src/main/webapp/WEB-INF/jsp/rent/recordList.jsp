<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>대여 기록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 70px;
}
</style>

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
						style="margin-top: 20px; color: #FFF; text-align: center; font-weight: bold;">L
						o a d i n g . . .</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="divLoadBody" style="display: none;" class="container">
		<jsp:include page="../menu.jsp" />
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div>
						<h2>대여 기록</h2>
					</div>
					<!-- 
			기록 검색<button type="button" onclick="location.href='/insertRecord'">삽입</button>
			 -->
					<table class="table table-striped table-bordered" id="dataTable">
						<thead>
							<tr class="  title">
								<th id="td-title">도서명</th>
								<th class="hidden-xs" id="td-author">대여일</th>
								<th id="td-author">반납일</th>
								<th id="td-date">대여자</th>
								<th id="td-genre">삭제</th>



							</tr>
						</thead>


						<tbody>
							<c:forEach items="${bookList}" var="book" varStatus="status">

								<tr>

									<td align="left">${book.title }</td>
									<td class="hidden-xs" align="left"><fmt:formatDate
											type="date" pattern="yyyy-MM-dd" value="${book.rentdate }" /></td>
									<td align="left"><fmt:formatDate type="date"
											pattern="yyyy-MM-dd" value="${book.returndate }" /></td>

									<td>${book.id}</td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="extendbook"
											onClick="location.href='/deleteRecord?bookCode=${book.book_cd}&id=${book.sabun}'">삭제</button></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#dataTable').DataTable({
				paging : true,
				ordering : true,
				"columns" : [ {
					"searchable" : true
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : true
				}, {
					"searchable" : false
				} ]

			});
		});
		var loadingBar = document.getElementById("loadingBar");
		var divLoadBody = document.getElementById("divLoadBody");

		divLoadBody.style.display = "";
		loadingBar.style.display = "none";
	</script>
</body>
</html>