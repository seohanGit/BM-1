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
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<h2>도서 구매 요청</h2>
		<div class="panelpanel-default">
			<form action="/confirmRequest" method="post" class="panel-body">
				<input type="image" name="imageurl" src="${book.imageurl}">
				<h3>도서 정가 ${book.price }원</h3>
				<div class="form-group">
					<label for="exampleInputEmail1">ISBN</label> <input type="text"
						class="form-control" id="isbn" name="isbn" value="${book.isbn}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">도서명</label> <input type="text"
						class="form-control" id="title" name="title"
						value="${book.title }" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">장르</label> <input type="text"
						class="form-control" id="b_group" name="b_group"
						value="${book.b_group}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">수량</label> <input type="text"
						class="form-control" id="quantity" name="quantity"
						value="${book.quantity}" >
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="author" name="author"
						value="${book.author }" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">구매요청자</label> <input type="text"
						class="form-control" id="kname" name="kname" value="${sessionScope.kname}" readonly="readonly">
				</div>
				<%-- 
				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="author" name="author"
						value="${book.author}">
				</div>
				 --%>
				<input type="hidden" name="imageurl" value="${book.imageurl }">
				<input type="hidden" name="link" value="${book.link}"> <input
					type="hidden" name="publish" value="${book.publish}"><input
					type="hidden" name="summary" value="${book.summary}"> <input
					type="hidden" name="price" value="${book.price}"> <input
					type="hidden" name="id" value="${book.id}">
				<button type="submit" class="btn btn-default">확인</button>
			</form>
		</div>
	</div>
</body>
</html>