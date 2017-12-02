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
<title>대출 기록</title>
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

	<div class="container ">

		<div class="row panel panel-default">
			<h2>대출 기록</h2>

			<br>
			<div id="searchResultArea col-md-12 col-xs-12 col-sm-9">
				<c:choose>
					<c:when test="${empty record}">
						<h3>대출한 도서가 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered" id="dataTable">
								<thead>
									<tr class=" title">
										<th class="title">도서명</th>
										<th class="hidden-xs longlen">저자</th>
										<th class="hidden-xs midlen">대출일</th>
										<th class="midlen">반납일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${record}" var="record" varStatus="status">
										<tr>
											<td class="td-title" align="left">${record.title }</td>
											<td class="hidden-xs" align="left">${record.author}</td>
											<td class="hidden-xs" align="left"><fmt:parseDate
													value="${record.rentdate}000000" pattern="yyyyMMddHHmmss"
													var="rentDate" scope="page" /> <fmt:formatDate
													value="${rentDate}" pattern="yyyy-MM-dd" /></td>
											<td align="left"><fmt:parseDate
													value="${record.returndate}000000" pattern="yyyyMMddHHmmss"
													var="returndate" scope="page" /> <fmt:formatDate
													value="${returndate}" pattern="yyyy-MM-dd" /></td>
										</tr>

									</c:forEach>
								</tbody>

							</table>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>

	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTable').DataTable({
				"pageLength" : 20,
				paging : true,
				startSave : true,
				ordering : true,
				info : false,
				searching : false,
				"columns" : [ null, null, {
					"searchable" : false
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