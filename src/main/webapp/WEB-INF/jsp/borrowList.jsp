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
<title>대여 요청 목록</title>
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
<script>
	function del() {
		alert("승인되었습니다.");
	}
</script>


</head>

<body>
	<jsp:include page="nav.jsp" />

	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<div id="searchResultArea">
					<h2>대여요청 현황</h2>
					<hr>
					<c:forEach items="${bookList}" var="book" varStatus="loop">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>

									<td class="goods_img"><span class="goods_cnt"></span> <img
										src="${book.imageurl}" width="95px" height="170px"></td>
									<td class="goods_infogrp">
										<p>${book.isbn}|${book.bookname}</p>
										<p>${book.writer}|${book.publisher}|</p>
										<p>${book.genre}|${book.id}</p>
										<p>${book.borrowdate}|${book.returndate}
										<p>${book.borrowcheck}==1then대여요청 ==2 대여 중</p>
									</td>
								</tr>
								<tr></tr>
							</tbody>
						</table>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	
	<script src="/resources/js/book.js"></script>
</body>
</html>
