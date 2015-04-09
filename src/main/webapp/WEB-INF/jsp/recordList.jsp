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
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>

</head>

<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<h2>대여 기록</h2>
		<table class="table table-striped table-bordered">
			<thead>
				<tr class="hidden-xs ">
					<td width="80px">표지</td>
					<td width="15%">도서명</td>
					<td width="9%">대여일자</td>
					<td width="6%">반납일자</td>
				</tr>
			</thead>


			<c:forEach items="${bookList}" var="book" varStatus="status">
				<tbody>
					<tr>
						<td rowspan="4" style="max-width: 100px" align="left"><img
							src="${book.imageurl}"></td>
					</tr>
					<tr>
						<td width="40%" align="left">${book.bookname }</td>
						<td width="30%" align="left">${book.borrowdate }</td>
						<td width="20%" align="left">${book.returndate }</td>
					</tr>
					<tr>
						<td>카테고리 : ${book.genre}</td>
						<td>대출자 : ${book.id}</td>
						<td>
							<button class="btn btn-default" type="button"
								onClick="location.href='${book.link}'">삭제</button>
						</td>
					</tr>

				</tbody>

			</c:forEach>
		</table>
	</div>
</body>
</html>