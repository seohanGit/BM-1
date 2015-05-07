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
<title>대여 요청 목록</title>
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
								<tr class="title">
									<th class="hidden-xs" id="td-img">표지</th>
									<th id="td-title">도서명</th>
									<th class="hidden-xs" id="td-genre">저자</th>
									<th class="hidden-xs hidden-sm" id="td-genre">분류</th>
									<th class="hidden-xs" id="td-author">대여일자</th>
									<th id="td-author">반납일자</th>
									<th id="td-date">상태</th>
									<th></th>
								</tr>
							</thead>
						</c:otherwise>
					</c:choose>
					<c:forEach items="${bookList}" var="book" varStatus="loop">

						<tbody>
							<tr>
								<td class="hidden-xs" style="width: 50px" align="left"><img
									style="width: 50px" src="${book.imageurl}"></td>

								<td align="left">${book.title }</td>
								<td class="hidden-xs" align="left">${book.author }</td>
								<td class="hidden-xs hidden-sm" align="left">${book.b_group}</td>


								<td class="hidden-xs"><fmt:formatDate type="date"
										pattern="yyyy-MM-dd" value="${book.rentdate}" /></td>
								<td style="width: inherit;"><fmt:formatDate type="date"
										pattern="yyyy-MM-dd" value="${book.returndate}" /></td>
								<c:choose>
									<c:when test="${book.rentchk=='1'}">
										<td>대여요청중</td>
										<td>
											<button class="btn btn-default" type="button"
												id="reservebook"
												onClick="location.href='/cancleBorrowBook?book_cd=${book.book_cd}'; cancel();">취소</button>
										</td>
									</c:when>
									<c:when test="${book.rentchk=='2'}">

										<td>대출중</td>
										<td></td>
									</c:when>
								</c:choose>


							</tr>
						</tbody>
					</c:forEach>

				</table>

				<hr>
				<c:choose>
					<c:when test="${empty record}">
					</c:when>
					<c:otherwise>
						<table class="table table-striped table-bordered" id="dataTable">
							<thead>
								<tr class=" title">
									<th id="tb-title">도서명</th>
									<th id="tb-date">대여일자</th>
									<th id="tb-date">반납일자</th>
									<th id="tb-status">대출자</th>



								</tr>
							</thead>


							<c:forEach items="${record}" var="record" varStatus="status">
								<tbody>

									<tr>

										<td align="left">${record.title }</td>
										<td align="left"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${record.rentdate }" /></td>
										<td align="left"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${record.returndate }" /></td>
										<td>${record.id}</td>
										<td><c:choose>
												<c:when test="${book.reservechk=='0'}">대기</c:when>
												<c:when test="${book.reservechk=='1'}">승인</c:when>
												<c:when test="${book.reservechk=='2'}">반려</c:when>
											</c:choose></td>

									</tr>

								</tbody>

							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty reserveList}">
					</c:when>
					<c:otherwise>
						<table class="table table-striped table-bordered">
							<thead>
								<tr class=" title">
									<th id="tb-title">도서명</th>
									<th id="tb-date">대여일자</th>
									<th id="tb-date">분류</th>
									<th id="tb-date">반납일자</th>
									<th id="tb-status">대출자</th>



								</tr>
							</thead>


							<c:forEach items="${reserveList}" var="reser" varStatus="status">
								<tbody>

									<tr>

										<td align="left">${reser.title }</td>
										<td align="left"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${reser.reser_date }" /></td>
										<td class="hidden-xs hidden-sm" align="left">${book.b_group}</td>
										<td align="left">value="${reser.reser_date }"</td>
										<td></td>


									</tr>

								</tbody>

							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
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
		var table = $('#dataTable').DataTable();
	</script>
</body>
</html>
