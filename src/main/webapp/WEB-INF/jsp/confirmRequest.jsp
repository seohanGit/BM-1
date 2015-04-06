<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>도서 구매 요청</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>도서 구매 요청</h2>
		<div class="panelpanel-default">
			<form action="/confirmRequest" method="post" class="panel-body">
				<input type="image" name="imageurl" src="${book.imageurl}">
				<h3>도서 정가 ${book.priceSales }원</h3>
				<div class="form-group">
					<label for="exampleInputEmail1">ISBN</label> <input type="text"
						class="form-control" id="isbn" name="isbn"
						value="${book.isbn}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">도서명</label> <input type="text"
						class="form-control" id="bookname" name="bookname"
						value="${book.bookname }">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">장르</label> <input type="text"
						class="form-control" id="genre" name="genre" value="${book.genre}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">출판사</label> <input type="text"
						class="form-control" id="publisher" name="publisher"
						value="${book.publisher}">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="writer" name="writer"
						value="${book.writer }">
				</div>
				<input type="hidden" name="imageurl"  value="${book.imageurl }">
				<input type="hidden" name="link" value="${book.link}">
				<input type="hidden" name="requestid" value="${book.requestid}">
				<input type="hidden" name="priceSales" value="${book.priceSales}">
				<button type="submit" class="btn btn-default">확인</button>
			</form>
		</div>
	</div>
</body>
</html>