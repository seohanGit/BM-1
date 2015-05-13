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
<title>대여요청 목록</title>
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
	<jsp:include page="../nav.jsp" />
	<div class="container">

		<div class="col-md-12"><jsp:include page="../menu.jsp" />
			<div class="panel panel-default">
				<div class="panel-body">
					<form action="confirmBorrowBookList" method="post">
						<div>
							<h2>대여요청 목록</h2>
						</div>
						<br>
						<c:choose>
							<c:when test="${empty bookList}">


								<div>
									<h3>대여 요청한 도서가 없습니다.</h3>
								</div>
							</c:when>
							<c:otherwise>

								<div class="right right-end">
									<button class="btn btn-default" type="submit">승인</button>
								</div>

								<table class="table table-striped table-bordered">


									<thead>
										<tr class="title">
											<th><input type="checkbox" id="allCheck" class="td-chk"></th>
											<th>도서명</th>
											<th class="td-genre">대여일</th>
											<th class="td-genre hidden-xs">반납일</th>
											<th class="td-genre hidden-xs">분류</th>
											<th class="td-date">대여자</th>
											<th class="td-img"></th>


										</tr>
									</thead>




									<tbody>
										<c:forEach items="${bookList}" var="book" varStatus="loop">
											<tr>
											
												<td><input type="checkbox" name="book_cd"
													value="${book.book_cd}"></td>
												<td align="left">${book.title}</td>
												<td align="left"><fmt:formatDate type="date"
														pattern="yyyy-MM-dd" value="${book.rentdate}" /></td>
												<td class="hidden-xs" style="width: inherit;"><fmt:formatDate
														type="date" pattern="yyyy-MM-dd"
														value="${book.returndate}" /></td>
												<td class="hidden-xs" align="left">${book.b_group }</td>

												<td>${book_cd}<c:choose>
														<c:when test="${empty book.kname}">${book.id}</c:when>
														<c:otherwise>${book.kname}</c:otherwise>
													</c:choose></td>
												<td><button class="btn btn-default btn-sm"
														type="button" id="reservebook"
														onClick="location.href='/confirmBorrowBook?book_cd=${book.book_cd1}'; ok();">승인</button>

												</td>
											</tr>
										</c:forEach>
									</tbody>



								</table>
							</c:otherwise>
						</c:choose>
					</form>
				</div>

			</div>
		</div>
	</div>

	<hr>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>
