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
<title>대여현황 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">


</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="row" id="searchResultArea">
			<hr>
			<h2>대여현황 목록</h2>
			<hr>
			<table class="table table-striped table-bordered ">
				<c:choose>
					<c:when test="${empty bookList}">
						<h3>대여중인 도서가 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<thead>
							<tr class="hidden-xs title">

								<td id="tb-title">도서명</td>
								<td id="tb-date">대여일자</td>
								<td id="tb-date">반납일자</td>
								<td id="tb-status">대출자</td>
								<td id="tb-status">반납</td>
								<td id="tb-status">연장</td>
							</tr>
						</thead>
					</c:otherwise>
				</c:choose>
				<c:set var="now" value="<%=new java.util.Date()%>" />

				<c:forEach items="${bookList}" var="book" varStatus="loop">

					<tbody>
						<c:choose>
							<c:when test="${book.returndate < now}">
								<tr >
									<td align="left">${book.bookname }</td>
									<td align="left">${book.borrowdate }</td>

									<td align="left" style="text-decoration:underline; text-align: right; ; ">${book.returndate }</td>

									<td>ID : ${book.id}</td>
									<%-- 
							<td><button class="btn btn-default" type="button"
									id="extendbook"
									onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'">연장</button>
							</td>
 --%>
									<td><button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/returnBookByAdmin?bookCode=${book.bookCode}'; re_turn();">반납</button>
									</td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'; extend();">연장</button></td>

								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td align="left">${book.bookname }</td>
									<td align="left">${book.borrowdate }</td>

									<td align="left">${book.returndate }</td>

									<td>ID : ${book.id}</td>
									<%-- 
							<td><button class="btn btn-default" type="button"
									id="extendbook"
									onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'">연장</button>
							</td>
 --%>
									<td><button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/returnBookByAdmin?bookCode=${book.bookCode}'; re_turn();">반납</button>
									</td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'; extend();">연장</button></td>
								</tr>
							</c:otherwise>

						</c:choose>

						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>
	</div>
	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("승인되었습니다.");
		}
	</script>
</body>
</html>