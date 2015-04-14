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
			<!-- Blog Entries Column -->
			<div id="searchResultArea">
				<hr>
				<h2>대여요청 현황</h2>
				<hr>
				<table class="table table-striped table-bordered ">
					<thead>
						<tr class="hidden-xs title">
							<td>도서명</td>
							<td>대여일자</td>
							<td>반납일자</td>
							<td>카테고리</td>
							<td>대출자</td>
							<td>상태</td>
						</tr>
					</thead>
					<c:forEach items="${bookList}" var="book" varStatus="loop">

						<tbody>
							<tr>
								<td width="30%" align="left">${book.bookname }</td>
								<td width="15%" align="left">${book.borrowdate }</td>
								<td width="15%" align="left">${book.returndate }</td>
								<td width="15%" align="left">${book.genre }</td>

								<td>ID : ${book.id}</td>


								<td><button class="btn btn-default" type="button"
										id="reservebook"
										onClick="location.href='/confirmBorrowBook?bookCode=${book.bookCode}'">승인</button>
								</td>
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

	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>
