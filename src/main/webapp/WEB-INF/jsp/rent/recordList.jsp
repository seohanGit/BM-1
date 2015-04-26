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
	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="row col-12" id="searchResultArea">
			<hr>
			<h2>대여 기록</h2>
			<hr>
			기록 검색
			<table class="table table-striped table-bordered" id="dataTable">
				<thead>
					<tr class=" title">
						<th id="tb-title">도서명</th>
						<th id="tb-date">대여일자</th>
						<th id="tb-date">반납일자</th>
						<th id="tb-status">대출자</th>
						<th id="tb-status">기록삭제</th>



					</tr>
				</thead>


				<tbody>
					<c:forEach items="${bookList}" var="book" varStatus="status">

						<tr>

							<td align="left">${book.bookname }</td>
							<td align="left">${book.borrowdate }</td>
							<td align="left">${book.returndate }</td>

							<td>${book.id}</td>
							<td><button class="btn btn-default btn-sm" type="button"
									id="extendbook"
									onClick="location.href='/deleteRecord?bookCode=${book.bookCode}&id=${book.id}'">삭제</button></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>

	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#dataTable').DataTable({
				"pageLength" : 30,
				paging : true,
				ordering : true,
				"columns" : [ {
					"searchable" : true
				}, {
					"searchable" : false
				},  {
					"searchable" : false
				}, {
					"searchable" : true
				}, {
					"searchable" : false
				}]

			});
		});
	</script>
</body>
</html>