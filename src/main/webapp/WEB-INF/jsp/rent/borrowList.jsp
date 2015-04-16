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
	<jsp:include page="../nav.jsp" />

	<div class="container">
		<hr>
		<div class="row panel panel-default">

			<h4>원하는 책이 없다면 인터넷에서 주문하세요 !</h4>
			<div class="input-group" style="width: 90%">
				<form action="/findBook" method="get">
					<span class="input-group-btn"> <input type="text"
						class="form-control" id="query" name="keyword"
						placeholder="인터파크 검색">
						<button class="btn btn-default" type="submit" id="btn_find">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</form>
			</div>
			<div id="searchResultArea">
				<hr>
				<h2>사용자 대여 현황</h2>
				<hr>

				<table class="table table-striped table-bordered ">
					<c:choose>
						<c:when test="${empty bookList}">
							<h3>대여한 도서가 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<thead>
								<tr class="hidden-xs title">
									<td id="tb-img">표지</td>
									<td id="tb-title">도서명</td>
									<td id="tb-author">저자</td>
									<td id="tb-genre">장르</td>

									<td id="tb-date">대여일자</td>
									<td id="tb-date">반납일자</td>
									<td id="tb-status">상태</td>
									<td>비고</td>
								</tr>
							</thead>
						</c:otherwise>
					</c:choose>
					<c:forEach items="${bookList}" var="book" varStatus="loop">

						<tbody>
							<tr>
								<td style="width: 50px" align="left"><img
									style="width: 50px" src="${book.imageurl}"></td>

								<td align="left">${book.bookname }</td>
								<td align="left">${book.writer }</td>
								<td align="left">${book.genre}</td>


								<td>${book.borrowdate}</td>
								<td>${book.returndate}</td>
								<c:choose>
									<c:when test="${book.borrowcheck=='1'}">
										<td>대여요청중</td>
										<td>
											<button class="btn btn-default" type="button"
												id="reservebook"
												onClick="location.href='/cancleBorrowBook?bookCode=${book.bookCode}'">취소</button>
										</td>
									</c:when>
									<c:when test="${book.borrowcheck=='2'}">
										<td>대출중</td>
										<td><button class="btn btn-default" type="button"
												id="reservebook"
												onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'">연장</button></td>
									</c:when>
								</c:choose>

							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>

	</div>
	<hr>

	<script src="/resources/js/common.js"></script>
</body>
</html>
