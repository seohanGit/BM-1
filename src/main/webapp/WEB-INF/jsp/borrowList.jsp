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
	<jsp:include page="nav.jsp" />

	<div class="container">
		<hr>
		<div class="row panel panel-default">
			<div class="col-xs-12 col-sm-9">
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
						<thead>
							<tr class="hidden-xs title">
								<td width="10%">표지</td>
								<td width="15%">도서명</td>
								<td width="13%">저자</td>
								<td width="10%">장르</td>

								<td width="16%">대여일자</td>
								<td width="18%">상태</td>
								<td width="13%"></td>
							</tr>
						</thead>
						<c:forEach items="${bookList}" var="book" varStatus="loop">
							<tbody>
								<tr>
									<td rowspan="4"><img src="${book.imageurl}"></td>
								</tr>
								<tr>
									<td width="20%" align="left">${book.bookname }</td>
									<td width="10%" align="left">${book.writer }</td>
									<td width="10%" align="left">${book.genre}</td>


									<td>${book.borrowdate}</td>
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
											<td>
												<button class="btn btn-default" type="button"
													id="reservebook"
													onClick="location.href='/cancleBorrowBook?bookCode=${book.bookCode}'">반납</button>
											</td>
										</c:when>
									</c:choose>

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
