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
<title>도서 추가 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<h2>도서 추가 페이지</h2>
		<div class="panelpanel-default left">
			<div class="input-group" style="width: 95%">
				<form action="/getBookInfo" method="post">
					<span class="input-group-btn"> <input type="text"
						class="form-control" id="keyword" name="keyword"
						placeholder="인터파크 검색">
						<button class="btn btn-default" type="submit" id="getBookInfo">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</form>
			</div>
			<form action="/insertbook" method="post" class="panel-body">
				<div class="form-group">
					<label for="exampleInputEmail1">도서번호</label> <input type="text"
						class="form-control" id="book_cd" name="book_cd"
						placeholder="도서번호">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">도서명</label> <input type="text"
						class="form-control" id="title" name="title" placeholder="도서명">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">장르</label> <input type="text"
						class="form-control" id="b_group" name="b_group" placeholder="장르">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">출판사</label> <input type="text"
						class="form-control" id="publish" name="publish" placeholder="출판사">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="author" name="author" placeholder="저자">
				</div>
				<button type="submit" class="btn btn-default">확인</button>
			</form>
		</div>
		<div class="right" id="searchResultArea"></div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>