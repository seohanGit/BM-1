<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Blog Home - Start Bootstrap Template</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="nav.jsp" />
	<!-- Page Content -->
	<div class="row">
		<!-- Blog Entries Column -->
		<!-- Blog Sidebar Widgets Column -->

		<div class="panel panel-default">

			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered " id="dataTable">
						<thead>
							<tr>
								<th><input type="checkbox" id="allCheck">도서코드</th>
								<th id="td-author">ISBN</th>

								<th id="td-img">표지</th>
								<th id="td-author">도서명</th>
								<th>저자</th>
								<th>출판사</th>
								<th id="td-date">장르</th>

							</tr>
						</thead>
						<%-- 
						
 --%>

						<tbody>
							<c:forEach items="${bookList}" var="book" varStatus="loop">

								<tr>
									<td><input type="checkbox" name="bookCode"
										value="${book.book_cd}">${book.book_cd}</td>
									<td align="left">${book.isbn }</td>
									<td style="width: 50px" align="left"><img
										style="width: 50px" src="${book.imageurl}"></td>
									<td align="left">${book.title }</td>
									<td align="left">${book.author }</td>
									<td align="left">${book.publish }</td>

									<td align="left">${book.b_group}</td>



								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- /.row -->
	<hr>

	<!-- /.container -->
	<!-- jQuery -->
	<script src="/resources/js/jquery/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>

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
				}, null, null, null, {
					"searchable" : false
				}, {
					"searchable" : false
				} ],

			});
		});
	</script>
</body>
</html>
