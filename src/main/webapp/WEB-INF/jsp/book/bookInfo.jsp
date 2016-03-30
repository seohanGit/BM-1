<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=850px, height=500px, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>도서정보 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">

</head>
<body>
	<div class="container">


		<div class="left"  >
			<h2>도서정보</h2>
		</div>
		<div class="right form-group" style="margin-top: 40px">
			<c:choose>
				<c:when test="${book.rentchk=='0'}">
					<mark>대출가능</mark>
					<button class="btn btn-default" type="button" id="borrowbook"
						onClick="opener.document.location.href='/borrowbook?book_cd=${book.book_cd}'; borrow(); opener.focus(); self.close();">대출</button>
				</c:when>

				<c:when test="${book.rentchk=='1' and book.reservechk=='1'}">	예약중
						</c:when>
				<c:when test="${book.rentchk=='1' and book.reservechk=='0'}"> 대여요청중<button
						class="btn btn-default" type="button" id="reservebook"
						onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button>
				</c:when>

				<c:when test="${book.rentchk=='2' and book.reservechk=='1'}">	예약중 	
								
						</c:when>
				<c:when test="${book.rentchk=='2' and book.reservechk=='0'}"> 대출중 <button
						class="btn btn-default" type="button" id="reservebook"
						onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button>
				</c:when>

				<c:when test="${book.rentchk=='4'}">대출정지
						</c:when>
				<c:when test="${book.rentchk=='5'}"> 예약중
						</c:when>
			</c:choose>
		</div>

		<div class="panel panel-default">
			<c:choose>
				<c:when test="${empty book.imageurl }">
				</c:when>
				<c:otherwise>
					<div style="width: 35%; height:600px" class="left">
						<img style="width: 100%;" src="${book.imageurl}">
					</div>
				</c:otherwise>
			</c:choose>

			<div  style="width:60%; float:right">
				<table class="table table-bordered">

					<tr>
						<th>도서번호</th>
						<td>${ book.book_cd }</td>
					</tr>
					<tr>
						<th>도서명</th>
						<td>${book.title}</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>${book.b_group}</td>
					</tr>
					<tr>
						<th>출판사</th>
						<td>${book.publish}</td>
					</tr>
					<tr>
						<th>저자</th>
						<td>${book.author}</td>
					</tr>
				</table>
			</div>
			<%-- 


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
			<c:choose>
				<c:when test="${book.publish == '' }">
					<div></div>
				</c:when>
				<c:otherwise>
					<div class="right form-group">
						<label for="exampleInputPassword1">출판사</label>
						<h4>${book.publish}</h4>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${book.author == '' }">
					<div></div>
				</c:when>
				<c:otherwise>
					<div class="right form-group">
						<label for="exampleInputPassword1">저자</label>
						<h4>${book.author }</h4>
					</div>
				</c:otherwise>
			</c:choose> --%>
			<c:choose>
				<c:when test="${book.summary == '' }">

				</c:when>
				<c:otherwise>
					<div id="bulletin" class="board " style="width:60%; float:right">
						<p class="content ellipsis">${book.summary}</p>
						<c:choose>
							<c:when test="${empty book.summary}"></c:when>
							<c:otherwise>
								<a class="btn btn-default">펼쳐보기 »</a>
							</c:otherwise>
						</c:choose>
						<p></p>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>