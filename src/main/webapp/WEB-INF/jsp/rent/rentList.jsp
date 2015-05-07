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
<title>대여현황 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">


</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">

					<div>
						<h2>대여현황 목록</h2>
					</div>
					<br>
					<p></p>
					<c:choose>
						<c:when test="${empty bookList}">
							<div>
								<h3>대여중인 도서가 없습니다.</h3>
							</div>
						</c:when>
						<c:otherwise>
							<form action="returnBookList" method="post">
								<div class="right right-end">
									<button class="btn btn-default" type="submit">반납</button>
								</div>

								<table class="table table-striped table-bordered "
									id="dataTable">
									<thead>
										<tr class="hidden-xs title">
											<th><input type="checkbox" id="allCheck"></th>
											<th id="tb-title">도서명</th>
											<th id="tb-date">대여일</th>
											<th id="tb-date">반납일</th>
											<th id="tb-status">대여자</th>
											<th id="tb-status">반납</th>
											<th id="tb-status">연장</th>
										</tr>
									</thead>

									<c:set var="now" value="<%=new java.util.Date()%>" />


									<tbody>
										<c:forEach items="${bookList}" var="book" varStatus="loop">

											<tr>
												<td><input type="checkbox" name="bookCode"
													value="${book.book_cd}"></td>
												<td align="left">${book.title }</td>
												<td align="left"><fmt:formatDate type="date"
														pattern="yyyy-MM-dd" value="${book.rentdate }" /></td>
												<c:choose>
													<c:when test="${book.returndate < now}">
														<td align="left"
															style="text-decoration: underline; text-align: right;"><fmt:formatDate
																type="date" pattern="yyyy-MM-dd"
																value="${book.returndate }" /></td>
													</c:when>
													<c:otherwise>
														<td align="left"><fmt:formatDate type="date"
																pattern="yyyy-MM-dd" value="${book.returndate }" /></td>
													</c:otherwise>
												</c:choose>
												<td>${book.id}</td>
												<%-- 
							<td><button class="btn btn-default" type="button"
									id="extendbook"
									onClick="location.href='/extendBorrowBook?book_cd=${book.book_cd}'">연장</button>
							</td>
 --%>
												<td><button class="btn btn-default btn-sm"
														type="button" id="reservebook"
														onClick="location.href='/returnBookByAdmin?book_cd=${book.book_cd}'; re_turn();">반납</button>
												</td>
												<td><button class="btn btn-default btn-sm"
														type="button" id="reservebook"
														onClick="location.href='/extendBorrowBook?book_cd=${book.book_cd}'; extend();">연장</button></td>
											</tr>



										</c:forEach>
									</tbody>

								</table>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>


	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#dataTable').DataTable({
				"pageLength" : 30,
				paging : true,
				ordering : true,
				"columns" : [ null, {
					"searchable" : false
				}, {
					"searchable" : false
				}, null ]

			});
		});
	</script>
</body>
</html>