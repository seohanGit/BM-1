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
<title>예약 현황</title>
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
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="row">
			<div id="searchResultArea">
				<hr>
				<h2>에약 현황</h2>
				<hr>
				<table class="table table-striped table-bordered">
					<thead>
						<tr class="hidden-xs title">

							<td>도서명</td>
							<td>예약일자</td>
							<td>카테고리</td>
							<td>예약신청자</td>
							<td>알림</td>
						</tr>
					</thead>


					<c:forEach items="${bookList}" var="book" varStatus="status">
						<tbody>

							<tr>

								<td width="30%" align="left">${book.bookname }</td>
								<td width="15%" align="left">${book.reservedate }</td>
								<td width="15%" align="left">${book.genre }</td>
								<td>ID : ${book.id}</td>

								<td><button class="btn btn-default" type="button"
										id="extendbook"
										onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'">알림</button>
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
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>