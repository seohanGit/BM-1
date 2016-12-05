<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>
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
<title>대출현황</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
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

		<div class="col-xs-12"><jsp:include page="../menu.jsp" />
			<div class="col-xs-12 panel panel-default">
				
				<br><div class="panel-body">
					<div>
						<h2>대출현황 목록</h2>
					</div>

					<c:choose>
						<c:when test="${empty rentList}">
							<div>
								<h3>대출중인 도서가 없습니다.</h3>
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
											<th class="td-chk"><input type="checkbox" id="allCheck"></th>
											<th>도서명</th>
											<th class="genre">대출일</th>
											<th class="genre">반납일</th>
											<th class="hidden-xs td-date">대출자</th>
											<th class="image">반납</th>
											<th class="image">연장</th>
										</tr>
									</thead>
								<% SimpleDateFormat sdf =  new SimpleDateFormat("yyyyMMdd");
								Calendar cal = Calendar.getInstance(); %>
									<c:set var="now" value="<%= sdf.format(cal.getTime())%>" />


									<tbody>
										<c:forEach items="${rentList}" var="rent" varStatus="loop"> 
											<tr>
												<td><input type="checkbox" name="book_cd"
													value="${rent.book_cd}"></td>
												<td align="left">${rent.title }</td> 
 												<td align="left"> ${rent.rentdate} </td>
												<c:choose>
													<c:when test="${rent.returndate < now}">
														<td align="left"
															style="text-decoration: underline; text-align: right;"><mark> 
																<fmt:parseDate
													value="${rent.returndate}000000" pattern="yyyyMMddHHmmss"
													var="rentDate" scope="page" /> <fmt:formatDate
													value="${rentDate}" pattern="yyyy-MM-dd" /> - 연체중
															</mark></td>
													</c:when>
													<c:otherwise>
														<td align="left"><fmt:parseDate
													value="${rent.returndate}000000" pattern="yyyyMMddHHmmss"
													var="returnDate" scope="page" /> <fmt:formatDate
													value="${returnDate}" pattern="yyyy-MM-dd" /> </td> 
													</c:otherwise>
												</c:choose>

												<td class="hidden-xs"><c:choose>
														<c:when test="${empty rent.kname}">${rent.id}</c:when>
														<c:otherwise>${rent.kname}</c:otherwise>
													</c:choose></td>
												<%-- 
							<td><button class="btn btn-default" type="button"
									id="extendbook"
									onClick="location.href='/extendBorrowBook?book_cd=${rent.book_cd}'">연장</button>
							</td>
 --%>
												<td><button class="btn btn-default btn-sm"
														type="button" id="reservebook"
														onClick="location.href='/returnBook?book_cd=${rent.book_cd}'; re_turn();">반납</button>
												</td>

												<c:choose>
													<c:when
														test="${rent.reservechk=='0'||empty rent.reservechk}">
														<td><button class="btn btn-default btn-sm"
																type="button" id="reservebook"
																onClick="location.href='/extendBorrowBook?book_cd=${rent.book_cd}'; extend();">연장</button></td>

													</c:when>
													<c:when test="${rent.reservechk=='1' }">
														<td>예약중</td>

													</c:when>
												</c:choose>

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
</body>
</html>
