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
<title>대여요청 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
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
		<jsp:include page="../menu.jsp" />
		<!-- Blog Entries Column -->
		<div id="searchResultArea" class="row">
			<form action="confirmBorrowBookList" method="post">
				<hr>

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
								<tr class="hidden-xs title">
									<th><input type="checkbox" id="allCheck"></th>
									<th id="tb-title">도서명</th>
									<th id="tb-date">대여일자</th>
									<th id="tb-date">반납일자</th>
									<th id="tb-genre">장르</th>
									<th id="tb-genre">대출자</th>
									<th></th>

								</tr>
							</thead>




							<tbody>
								<c:forEach items="${bookList}" var="book" varStatus="loop">
									<tr>
										<td><input type="checkbox" name="bookCode"
											value="${book.book_cd}"></td>
										<td align="left">${book.title}</td>
										<td align="left">${book.rentdate }</td>
										<td align="left">${book.returndate }</td>
										<td align="left">${book.b_group }</td>

										<td>${book.id}</td>

										<td><button class="btn btn-default btn-sm" type="button"
												id="reservebook"
												onClick="location.href='/confirmBorrowBook?book_cd=${book.book_cd}&id=${book.id}'; ok();">승인</button>

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
	<%-- 
 --%>
	<hr>
	
</body>
</html>
