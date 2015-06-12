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
<title>예약현황 목록</title>
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
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<div class="col-md-12"><jsp:include page="../menu.jsp" />
			<div class="panel panel-default">
				<div class="panel-body">

					<div>
						<h2>예약현황 목록</h2>
					</div>
					<br>
					<c:choose>
						<c:when test="${empty bookList}">
							<div>
								<h3>대여 요청한 도서가 없습니다.</h3>
							</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped table-bordered">
								<thead>
									<tr class="hidden-xs title">

										<th>도서명</th>

										<th class="td-genre">분류</th>
										<th class="td-date">신청자</th>
										<th class="td-genre">예약일</th>
										<th class="td-img">알림</th>
										<th class="td-img">대여</th>
									</tr>
								</thead>



								<tbody>
									<c:forEach items="${bookList}" var="book" varStatus="status">
										<tr>

											<td class="td-title" align="left">${book.title }</td>

											<td align="left">${book.b_group }</td>
											<td><c:choose>
													<c:when test="${empty book.kname}">${book.id}</c:when>
													<c:otherwise>${book.kname}</c:otherwise>
												</c:choose></td>
											<td align="left"><fmt:formatDate type="date"
													pattern="yyyy-MM-dd" value="${book.reser_date }" /></td>
											<td><button class="btn btn-default btn-sm" type="button"
													id="extendbook"
													onClick="location.href='/notifiReser?book_cd=${book.book_cd}'; notifiReser();">알림</button>
											</td>
											<td><c:choose>
													<c:when test="${book.rentchk=='0' }">
														<button class="btn btn-default btn-sm" type="button"
															id="extendbook"
															onClick="location.href='/deleteReserve?book_cd=${book.book_cd}'">대여</button>
													</c:when>
												</c:choose></td>
										</tr>

									</c:forEach>
								</tbody>


							</table>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>

	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>