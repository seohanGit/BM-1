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
<title>구매요청 기록</title>
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

		<hr>
		<div class="row panel panel-default">
			<!-- Blog Entries Column -->
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
			<div>
				<hr>
				<h2>구매요청 목록</h2>

				<table class="table table-striped table-bordered">

					<c:choose>
						<c:when test="${empty bookList}">

							<h3>구매 요청한 도서가 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<thead>
								<tr class=" title">

									<td class="hidden-xs td-img">표지</td>
									<td class="td-title">도서명</td>
									<td class="hidden-xs td-author">저자</td>
									<td style="width:50px">가격</td>
									<td class="td-chk">수량</td>
									<td class="hidden-xs td-genre">요청일자</td>
									<td class="td-chk">상태</td>

								</tr>
							</thead>

							<c:forEach items="${bookList}" var="book" varStatus="status">

								<tbody class="hidden" style="width: 100%">
									<tr>

										<td rowspan="4" style="width: 50px" align="left"><img
											style="width: 50px" src="${book.imageurl}"></td>

									</tr>
									<tr>
										<td style="width: 40%" align="left"><a
											href="${book.link}">${book.title }</a></td>
										<td style="width: 40%" align="left">${book.author }</td>

									</tr>
									<tr>
										<td>${book.b_group}</td>
										<td>요청자 : ${book.id}</td>

									</tr>
									<tr>
										<td>${book.price}원</td>
										<td>수량 : ${book.quantity}</td>

									</tr>
								</tbody>


								<tbody>
									<tr>

										<td class="hidden-xs"><img style="width: 50px" src="${book.imageurl}"></td>
										<td><a href="${book.link}">${book.title }</a></td>
										<td class="hidden-xs">${book.author}</td>

										<td>${book.price}원</td>
										<td align="center">${book.quantity}</td>

										<td class="hidden-xs"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${book.reqdate}" /></td>
										<c:choose>
												<c:when test="${book.reqstatus=='0'}"><td>대기</td></c:when>
												<c:when test="${book.reqstatus=='1'}"><td class="ok">승인</td></c:when>
												<c:when test="${book.reqstatus=='2'}"><td class="no">반려</td></c:when>
											</c:choose>
									</tr>

								</tbody>

							</c:forEach>

						</c:otherwise>
					</c:choose>
				</table>

				<hr>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
	</script>
</body>
</html>
