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

	<div class="container ">
		
		<div class="row panel panel-default">
			<div id="searchResultArea col-md-12 col-xs-12 col-sm-9">
				<c:choose>
					<c:when test="${empty record}">
					</c:when>
					<c:otherwise>
						
						<h2>대여 기록</h2>
						<table class="table table-striped table-bordered" id="dataTable">
							<thead>
								<tr class=" title">
									<th class="td-title">도서명</th>
									<th class="hidden-xs td-author">저자</th>
									<th class="hidden-xs td-genre">대여일</th>
									<th class="td-genre">반납일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${record}" var="record" varStatus="status">
									<tr>
										<td class="td-title" align="left">${record.title }</td>
										<td class="hidden-xs" align="left">${record.author}</td>
										<td class="hidden-xs" align="left"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${record.rentdate }" /></td>
										<td align="left"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${record.returndate }" /></td>
									</tr>

								</c:forEach>
							</tbody>

						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>