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
<title>도서 수정</title>
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
<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container">
		<h2>도서 수정 페이지</h2>
		<div class="panelpanel-default">
			<form action="/modifybook1" method="post" class="panel-body">
				<img src="${book.imageurl}">
				<div class="form-group">
					<label for="exampleInputPassword1">도서코드</label> <input type="text"
						class="form-control" id="book_cd" name="book_cd"
						value="${book.book_cd}">
				</div>
				<div>
					<label for="exampleInputPassword1">도서명</label> <input type="text"
						class="form-control" id="title" name="title"
						value="${book.title}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">카테고리</label> <input type="text"
						class="form-control" id="b_group" name="b_group"
						value="${book.b_group}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">출판사</label> <input type="text"
						class="form-control" id="publish" name="publish"
						value="${book.publish}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="author" name="author"
						value="${book.author}">
				</div>

				<button type="submit" class="btn btn-default">확인</button>
			</form>
		</div>
	</div>
</body>
</html>