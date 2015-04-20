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
<title>대여요청 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 70px;
}
</style>
<script>
	function del() {
		alert("승인되었습니다.");
	}
</script>


</head>

<body>
	<jsp:include page="../nav.jsp" />

	<div class="container">
		<jsp:include page="../menu.jsp" />
		<!-- Blog Entries Column -->
		<div id="searchResultArea" class="row">
			<hr>
			<h2>대여요청 목록</h2>
			<hr>
			<table class="table table-striped table-bordered ">
				<c:choose>
					<c:when test="${empty bookList}">
						<h3>대여 요청한 도서가 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<thead>
							<tr class="hidden-xs title">

								<td id="tb-title">도서명</td>
								<td id="tb-date">대여일자</td>
								<td id="tb-date">반납일자</td>
								<td id="tb-genre">장르</td>
								<td id="tb-genre">대출자</td>
								<td id="tb-status">상태</td>
							</tr>
						</thead>
					</c:otherwise>
				</c:choose>

				<c:forEach items="${bookList}" var="book" varStatus="loop">

					<tbody>
						<tr>
							<td align="left">${book.bookname }</td>
							<td align="left">${book.borrowdate }</td>
							<td align="left">${book.returndate }</td>
							<td align="left">${book.genre }</td>

							<td>ID : ${book.id}</td>

							<td><button class="btn btn-default btn-sm" type="button"
									id="reservebook"
									onClick="location.href='/confirmBorrowBook?bookCode=${book.bookCode}'; ok();">승인</button>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>

	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>
