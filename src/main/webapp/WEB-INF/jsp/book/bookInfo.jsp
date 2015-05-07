<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>도서정보 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<div class="row">

			<div id="searchResultArea">
				<h2>도서정보</h2>
				<div class="panelpanel-default">
					<div class="left">
						<img style="width: 70%" src="${book.imageurl}">
					</div>
					<hr>
					<div class="right form-group">
						<label for="exampleInputEmail1">도서번호</label>
						<h4>${ book.book_cd }</h4>
					</div>

					<div class="right form-group">
						<label for="exampleInputPassword1">도서명</label>
						<h4>${book.title}</h4>
					</div>
					<div class="right form-group">
						<label for="exampleInputPassword1">분류</label>
						<h4>${book.b_group}</h4>
					</div>
					<div class="right form-group">
						<label for="exampleInputPassword1">출판사</label>
						<h4>${book.publish}</h4>
					</div>
					<div class="right form-group">
						<label for="exampleInputPassword1">저자</label>
						<h4>${book.author }</h4>
					</div>
					<div class="left">
						<c:choose>
							<c:when test="${book.rentchk=='0'}">
								<mark>대출가능</mark>
								<button class="btn btn-default" type="button" id="borrowbook"
									onClick="location.href='/borrowbook?book_cd=${book.book_cd}'; borrow();">대출</button>
							</c:when>

							<c:when
								test="${book.rentchk=='1' and book.reservechk=='1'}">	예약중
						</c:when>
							<c:when
								test="${book.rentchk=='1' and book.reservechk=='0'}"> 대여요청중<button
									class="btn btn-default" type="button" id="reservebook"
									onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button>
							</c:when>

							<c:when
								test="${book.rentchk=='2' and book.reservechk=='1'}">	예약중 	
								
						</c:when>
							<c:when
								test="${book.rentchk=='2' and book.reservechk=='0'}"> 대출중 <button
									class="btn btn-default" type="button" id="reservebook"
									onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button>
							</c:when>

							<c:when test="${book.rentchk=='4'}">대출정지
						</c:when>
							<c:when test="${book.rentchk=='5'}"> 예약중
						</c:when>
						</c:choose>
					</div>
					<div class="right form-group">
						<p class="content ellipsis">${book.summary}</p>
						<p>
							<a class="btn btn-default">펼쳐보기 »</a>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>