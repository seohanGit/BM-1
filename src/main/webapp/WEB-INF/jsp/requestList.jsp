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
<title>구매 요청 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/common.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>


</head>

<body>
	<jsp:include page="nav.jsp" />


	<div class="container">
		<jsp:include page="menu.jsp" />
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
					<form action="confirmBuyList" method="post">
						<div class="right right-end">
							<button class="btn btn-default" type="submit">구매</button>
						</div>
						<table class="table table-striped table-bordered" id="dataTable">

							<thead>
								<tr class="hidden-xs ">
									<th><input type="checkbox" id="allCheck"></th>
									<th id="td-img">표지</th>

									<th id="td-author">도서명</th>
									<th id="td-author">저자</th>
									<th id="td-b_group">가격</th>
									<th id="td-b_group">수량</th>
									<th id="td-b_group">신청자</th>
									<th id="td-date">요청일자</th>
									<th width="60px"></th>
									<th width="60px"></th>
								</tr>
							</thead>

							<c:forEach items="${bookList}" var="book" varStatus="status">

								<tbody class="visible-xs-block" style="width: 100%">
									<tr>
										<td><input type="checkbox" name="bookCode"
											value="${book.book_cd}"></td>
										<td rowspan="4" style="width: 50px" align="left"><img
											style="width: 50px" src="${book.imageurl}"></td>

									</tr>
									<tr>
										<td style="width: 40%" align="left"><a
											href="${book.link}">${book.title }</a></td>
										<td style="width: 40%" align="left">${book.author }</td>
										<td align="right"></td>
									</tr>
									<tr>
										<td>${book.b_group}</td>
										<td>요청자 : ${book.id}</td>
										<td>
											<button class="btn btn-default" type="button"
												onClick="location.href='buyRequest?book_cd=${book.book_cd}'">구매</button>
										</td>
									</tr>
									<tr>
										<td>${book.price}원</td>
										<td>수량 : ${book.quantity}</td>
										<td>
											<button class="btn btn-default" type="button"
												onClick="location.href='deleteRequest?book_cd=${book.book_cd}'; del();">삭제</button>
										</td>
									</tr>
								</tbody>


								<tbody>
									<tr class="hidden-xs">
										<td><input type="checkbox" name="book_cd"
											value="${book.book_cd}"></td>
										<td><img style="width: 50px" src="${book.imageurl}"></td>
										<td><a href="${book.link}">${book.title }</a></td>
										<td>${book.author}</td>

										<td>${book.price}원</td>
										<td align="center">${book.quantity}</td>
										<td>${book.id}</td>
										<td>${book.reqdate}</td>
										<td><button class="btn btn-default" type="button"
												id="buyBook"
												onClick="location.href='buyRequest?book_cd=${book.book_cd}'">구매</button>
										</td>
										<td>
											<button class="btn btn-default" type="button"
												onClick="location.href='deleteRequest?book_cd=${book.book_cd}'; del();">삭제</button>
										</td>

									</tr>

								</tbody>

							</c:forEach>
						</table>
					</form>
				</c:otherwise>
			</c:choose>


		</div>
	</div>


	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
	</script>