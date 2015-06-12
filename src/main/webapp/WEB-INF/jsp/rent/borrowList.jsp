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
<title>대여 현황</title>
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

		<div class="row panel panel-default">
			<div class="input-group" style="width: 95%">
				<form action="/searchBook" method="post">
					<span class="input-group-btn"> <input type="text"
						class="form-control" id="keyword" name="keyword"
						placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
						<button class="btn btn-default" type="submit" id="btn_find">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</form>
			</div>
			<h4>인터넷에서 주문하세요 !</h4>
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
				<c:choose>
					<c:when test="${empty bookList}">
					</c:when>

					<c:otherwise>
						<h2>대여 도서 목록</h2>
						<table class="table table-striped table-bordered ">
							<thead>
								<tr class="title">
									<th class="hidden-xs td-img">표지</th>
									<th class="td-title">도서명</th>
									<th class="hidden-xs td-genre">저자</th>
									<th class="hidden-xs hidden-sm td-genre">분류</th>
									<th class="hidden-xs td-genre">대여일</th>
									<th class="td-genre">반납일</th>
									<th class="td-genre">상태</th>
									<th class="td-img"></th>
								</tr>
							</thead>



							<tbody>
								<c:forEach items="${bookList}" var="book" varStatus="loop">
									<tr>
										<td class="hidden-xs" align="left"><c:if
												test="${!empty book.imageurl }">
												<img style="width: 50px" src="${book.imageurl}">
											</c:if></td>

										<td class="td-title" align="left">${book.title }</td>
										<td class="hidden-xs" align="left">${book.author }</td>
										<td class="hidden-xs hidden-sm" align="left">${book.b_group}</td>


										<td class="hidden-xs"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${book.rentdate}" /></td>
										<td style="width: inherit;"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${book.returndate}" /></td>
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
												<td>대여중</td>
												<td></td>
											</c:when>
										</c:choose>


									</tr>
								</c:forEach>
							</tbody>


						</table>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty reserveList}">
					</c:when>
					<c:otherwise>
						<h2>예약 도서 목록</h2>
						<table class="table table-striped table-bordered ">

							<thead>
								<tr class="title">
									<th class="td-title">도서명</th>
									<th class="hidden-xs td-author">저자</th>
									<th class="hidden-xs hidden-sm td-genre">분류</th>
									<th class="td-genre">반납예정일</th>
									<th class="td-date"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${reserveList}" var="reserve">
									<tr>
										<td align="left"><a href="#"
											onclick="window.open('/bookInfo?book_cd=${reserve.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=500');">${reserve.title }</a></td>
										<td class="hidden-xs" align="left">${reserve.author }</td>
										<td class="hidden-xs hidden-sm" align="left">${reserve.b_group}</td>

										<td style="width: inherit;"><fmt:formatDate type="date"
												pattern="yyyy-MM-dd" value="${reserve.returndate}" /></td>
										<td><c:if test="${reserve.rentchk == '0'}">
												<button class="btn btn-default" type="button"
													onclick="location.href='/borrowbook?book_cd=${reserve.book_cd}'; ">대여</button>
											</c:if></td>
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
