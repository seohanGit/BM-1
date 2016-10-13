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
<title>대출 현황</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 70px;
}
</style>
</head>

<body>
	<jsp:include page="../nav.jsp" />

	<div class="container">

		<div class="row panel panel-default">
			<h2>대출 요청 현황</h2>
			<br>
			<div id="searchResultArea">
				<c:choose>
					<c:when test="${empty bookList}">
						<h3>대출 요청중인 도서가 없습니다.</h3>
					</c:when>

					<c:otherwise>
						<h2>대출 요청 목록</h2>
						<table class="table table-striped table-bordered ">
							<thead>
								<tr class="title">
									<th class="hidden-xs genre">표지</th>
									<th>도서명</th>
									<th class="hidden-xs author">저자</th>
									<th class="hidden-xs hidden-sm genre">분류</th>
									<th class="hidden-xs genre">대출일</th>
									<th class="genre">반납일</th>
									<th class="genre">상태</th>
									<th class="genre">비고</th>
								</tr>
							</thead>



							<tbody>
								<c:forEach items="${bookList}" var="book" varStatus="loop">
									<tr>
										<td class="hidden-xs" align="center"><c:if
												test="${!empty book.imageurl }">
												<img style="width: 50px" src="${book.imageurl}">
											</c:if></td>

										<td class="title" align="left">${book.title }</td>
										<td class="hidden-xs " align="left"><nobr>${book.author}</nobr></td>
										<td class="hidden-xs hidden-sm " align="left">${book.b_group}</td>


										<td class="hidden-xs">${book.rentdate}</td>
										<td>${book.returndate}</td>
										<c:choose>
											<c:when test="${book.rentchk=='1'}">
												<td>요청중</td>
												<td>
													<button class="btn btn-sm btn-default" type="button"
														id="reservebook"
														onClick="location.href='/cancleBorrowBook?book_cd=${book.book_cd}'; cancel();">취소</button>
												</td>
											</c:when>
											<c:when test="${book.rentchk=='2'}">
												<td>대출중</td>
												<td></td>
											</c:when>
											<c:otherwise>
												<td>대출취소</td>
												<td></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>


						</table>
					</c:otherwise>
				</c:choose>



			</div>
		</div>
	</div>

	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		var table = $('#dataTable').DataTable();
	</script>
</body>
</html>
