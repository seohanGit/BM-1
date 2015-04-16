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
		<div class="row" id="searchResultArea">
			<hr>
			<h2>대여 기록</h2>
			<hr>
			기록 검색
			<table class="table table-striped table-bordered">
				<thead>
					<tr class="hidden-xs title">

						<td>도서명</td>
						<td>대여일자</td>
						<td>반납일자</td>
						<td>카테고리</td>
						<td>대출자</td>
						<td>기록삭제</td>
					</tr>
				</thead>


				<c:forEach items="${bookList}" var="book" varStatus="status">
					<tbody>

						<tr>

							<td width="30%" align="left">${book.bookname }</td>
							<td width="14%" align="left">${book.borrowdate }</td>
							<td width="14%" align="left">${book.returndate }</td>
							<td width="15%">${book.genre}</td>
							<td width="13%">${book.id}</td>
							<td><button class="btn btn-default" type="button"
									id="extendbook"
									onClick="location.href='/deleteRecord?bookCode=${book.bookCode}&id=${book.id}'">삭제</button></td>
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