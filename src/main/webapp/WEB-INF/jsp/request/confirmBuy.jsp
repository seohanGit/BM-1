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
<title>도서 구매 요청</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2>도서 구매 요청</h2>

		<div class="panel panel-default">
			<div style="float: left; width: 50%">
				<input style="width: 90%; margin: 20px; float: center" type="image"
					name="imageurl" src="${book.imageurl}">
				<h3>도서 정가 ${book.price }원</h3>
			</div>

			<form action="/confirmBuy" method="post" class="panel-body">
				<div style="float: right; width: 48%;">
					<label for="exampleInputEmail1">도서코드</label>
					<div class="form-group">
						<div style="float: left; width: 60%">
							<select class="selectpicker" name="b_group">
								<c:forEach items="${BCodeList}" var="code">
									<option value="${code.code}-${code.name}">${code.code}-${code.name}
								</c:forEach>
							</select>
						</div>
						<div class="right" style="width: 40%">
							<select class="selectpicker" name="c_group">
								<c:forEach items="${CCodeList}" var="code">
									<option value="${code.code}-${code.name}">${code.code}-${code.name}
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">${book.book_cd}</label> <input
							type="text" class="form-control" id="book_cd" name="book_cd"
							placeholder="" required="required">
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">ISBN</label> <input type="text"
							class="form-control" id="isbn" name="isbn" value="${book.isbn}">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">도서명</label> <input type="text"
							class="form-control" id="title" name="title"
							value="${book.title }" required="required">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">수량</label> <input type="text"
							class="form-control" id="quantity" name="quantity"
							value="${book.quantity}">
					</div>

					<div class="form-group">
						<label for="exampleInputPassword1">저자</label> <input type="text"
							class="form-control" id="author" name="author"
							value="${book.author }">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">구매요청자</label> <input
							type="text" class="form-control" id="kname" name="kname"
							value="${book.kname }">
					</div>
					<%-- 
				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="author" name="author"
						value="${book.author}">
				</div>
				 --%>
					<input type="hidden" name="id" value="${book.id}"> <input
						type="hidden" name="imageurl" value="${book.imageurl}"> <input
						type="hidden" name="link" value="${book.link}"> <input
						type="hidden" name="publish" value="${book.publish}"><input
						type="hidden" name="summary" maxlength="2500"
						value="${book.summary}"> <input type="hidden" name="price"
						value="${book.price}"> <input type="hidden" name="reqdate"
						value="${book.reqdate}"><input type="hidden" name="req_cd"
						value="${book.req_cd}">

					<button type="submit" class="btn btn-default">확인</button>
				</div>
			</form>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>