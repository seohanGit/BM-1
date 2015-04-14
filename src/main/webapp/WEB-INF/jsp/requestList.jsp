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
<title>대여 요청 목록</title>
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
<script>
	function del() {
		alert("승인되었습니다.");
	}
</script>


</head>

<body>
	<jsp:include page="nav.jsp" />


	<div class="container">
		<hr>
		<div class="row panel panel-default">

			<div class="btn-group panel-heading" role="group" aria-label="..."
				style="width: 100%;">
				<button type="button" class="btn btn-default" id="requestList">구매요청
				</button>
				<button type="button" class="btn btn-default" id="borrowListAll">대여요청</button>
				<button type="button" class="btn btn-default" id="rentListAll">대여현황</button>
				<button type="button" class="btn btn-default"
					id="reservationListAll">예약현황</button>
				<button type="button" class="btn btn-default" id="recordListAll">대여기록</button>
				<button type="button" class="btn btn-default" id="noticeList">공지사항</button>
			</div>
			<div id="searchResultArea">
				<hr>
				<!-- Blog Entries Column -->
				<div>
					<h2>구매요청 목록</h2>
					<hr>
					<table class="table table-striped table-bordered">
						<thead>
							<tr class="hidden-xs title">
								<td width="10%">표지</td>
								<td width="20%">도서명</td>
								<td width="9%">가격</td>
								<td width="9%">수량</td>
								<td width="15%">저자</td>
								<td width="12%">장르</td>
								<td width="11%">신청자</td>
								<td width="14%">요청일자</td>
								<td width="60px"></td>
							</tr>
						</thead>


						<c:forEach items="${bookList}" var="book" varStatus="status">
							<tbody class="visible-xs-block">
								<tr>
									<td rowspan="4" style="max-width: 60px" align="left"><img
										src="${book.imageurl}"></td>
								</tr>
								<tr>
									<td width="40%" align="left">${book.bookname }</td>
									<td width="30%" align="left">${book.writer }</td>
									<td width="20%" align="right"></td>
								</tr>
								<tr>
									<td>${book.genre}</td>
									<td>요청자 : ${book.name}</td>
									<td>
										<button class="btn btn-default" type="button"
											onClick="location.href='${book.link}'">구매</button>
									</td>
								</tr>
								<tr>
									<td>${book.priceSales}원</td>
									<td>수량 : ${book.quantity}</td>
									<td>
										<button class="btn btn-default" type="button"
											onClick="location.href='deleteRequest?bookCode=${book.bookCode}'; del();">삭제</button>
									</td>
								</tr>
							</tbody>


							<tbody>
								<tr class="hidden-xs">
									<td><img src="${book.imageurl}" style="width: 100%"></td>
									<td>${book.bookname }</td>
									<td>${book.priceSales}원</td>
									<td align="center">${book.quantity}</td>
									<td>${book.writer}</td>
									<td>${book.genre}</td>
									<td>${book.id}</td>
									<td>${book.requestdate}</td>
									<td><button class="btn btn-default" type="button"
											id="buyBook" onClick="location.href='${book.link}'">구매</button>

										<hr>
										<button class="btn btn-default" type="button"
											onClick="location.href='deleteRequest?bookCode=${book.bookCode}'; del();">삭제</button></td>

								</tr>
							</tbody>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>

		<script src="/resources/js/common.js"></script>
		<script>
			function del() {
				alert("삭제되었습니다.");
			}
		</script>