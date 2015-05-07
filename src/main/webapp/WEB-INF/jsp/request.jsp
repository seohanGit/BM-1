<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>구매요청 기록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 70px;
}
</style>


</head>

<body>
	<jsp:include page="nav.jsp" />


	<div class="container">
		<div class="row" id="searchResultArea">
			<hr>
			<!-- Blog Entries Column -->


			<c:choose>
				<c:when test="${empty bookList}">
					<div>
						<h2>구매요청 목록</h2>
					</div>
					<br>
					<p></p>
					<div>
						<h3>구매 요청한 도서가 없습니다.</h3>
					</div>
				</c:when>
				<c:otherwise>
					<div class="left">
						<h2>구매요청 목록</h2>
					</div>
					<br>
					<p></p>

					<table class="table table-striped table-bordered">

						<thead>
							<tr class="hidden-xs title">

								<td id="tb-img">표지</td>

								<td id="tb-author">도서명</td>
								<td id="tb-author">저자</td>
								<td id="tb-b_group">가격</td>
								<td id="tb-b_group">수량</td>
								<td id="tb-b_group">신청자</td>
								<td id="tb-date">요청일자</td>

							</tr>
						</thead>

						<c:forEach items="${bookList}" var="book" varStatus="status">

							<tbody class="visible-xs-block" style="width: 100%">
								<tr>

									<td rowspan="4" style="width: 50px" align="left"><img
										style="width: 50px" src="${book.imageurl}"></td>

								</tr>
								<tr>
									<td style="width: 40%" align="left"><a href="${book.link}">${book.title }</a></td>
									<td style="width: 40%" align="left">${book.author }</td>

								</tr>
								<tr>
									<td>${book.b_group}</td>
									<td>요청자 : ${book.id}</td>

								</tr>
								<tr>
									<td>${book.price}원</td>
									<td>수량 : ${book.quantity}</td>

								</tr>
							</tbody>


							<tbody>
								<tr class="hidden-xs">

									<td><img style="width: 50px" src="${book.imageurl}"></td>
									<td><a href="${book.link}">${book.title }</a></td>
									<td>${book.author}</td>

									<td>${book.price}원</td>
									<td align="center">${book.quantity}</td>
									<td>${book.id}</td>
									<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
											value="${book.reqdate}" /></td>

								</tr>

							</tbody>

						</c:forEach>
					</table>

				</c:otherwise>
			</c:choose>


		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
	</script>
</body>
</html>
