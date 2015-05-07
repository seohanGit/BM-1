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
<title>공지사항</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="container">

		<div id="searchResultArea" class="row">
			<hr>
			<h2>공지사항</h2>
			<hr>

			<table class="table table-bordered" id="dataTable">
				<thead class="title">
					<tr>
						<td>등록일</td>
						<td>내용</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="notice" varStatus="status">
						<tr style="padding-bottom: 10px">
							<td width="15%" align="left"><fmt:formatDate
									value="${notice.regisdate}" pattern="yyyy-MM-dd" /></td>

							<td style="width: 80%; height: auto; padding-left: 10px"><textarea
									class="content ellipsis" id="content" name="content"
									style="width: 100%;" rows="5" readonly>${notice.content }</textarea>
							</td>

						</tr>



					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>
	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {

			$('#dataTable').DataTable({
				"pageLength" : 10,
				paging : true,
				ordering : true,
			});
		});
	</script>
</body>
</html>
