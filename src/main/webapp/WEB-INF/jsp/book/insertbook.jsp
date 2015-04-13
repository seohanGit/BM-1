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
		<div id="searchResultArea">
			<h2>도서 추가 페이지</h2>
			<div class="panelpanel-default">
				<form action="/insertbook" method="post" class="panel-body">
					<div class="form-group">
						<label for="exampleInputEmail1">도서번호</label> <input type="text"
							class="form-control" id="booknum" name="booknum"
							placeholder="도서번호">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">도서명</label> <input type="text"
							class="form-control" id="bookname" name="bookname"
							placeholder="도서명">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">장르</label> <input type="text"
							class="form-control" id="genre" name="genre" placeholder="장르">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">출판사</label> <input type="text"
							class="form-control" id="publisher" name="publisher"
							placeholder="출판사">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">저자</label> <input type="text"
							class="form-control" id="writer" name="writer" placeholder="저자">
					</div>
					<button type="submit" class="btn btn-default">확인</button>
				</form>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>