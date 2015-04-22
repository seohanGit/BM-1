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
<title>대여 요청 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
<script>
	function del() {
		alert("삭제되었습니다.");

	}
</script>


</head>

<body>
	<jsp:include page="../nav.jsp" />

	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="row" id="searchResultArea">
			<form action="stopBorrow" method="post">
				<div class="left">
					<h2>도서목록</h2>
				</div>

				<div class="right-end">
					<button style="width: 100px" class="btn btn-default" type="button"
						id="insertBook">도서추가</button>

					<button style="width: 100px" class="btn btn-default" type="submit">대출정지</button>
				</div>
				<hr>

				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<td><input type="checkbox" id="allCheck"></td>
							<td id="tb-img">표지</td>
							<td id="tb-author">도서명</td>
							<td id="tb-author">저자</td>
							<td id="tb-status">장르</td>

							<td width="10%">대여상태</td>
							<td width="25%"></td>
						</tr>
					</thead>
					<%-- 
						
 --%>
					<c:forEach items="${bookList}" var="book" varStatus="loop">
						<tbody>


							<tr>
								<td><input type="checkbox" id="allCheck"></td>
								<td rowspan="2" style="width: 50px" align="left"><img
									style="width: 50px" src="${book.imageurl}"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
							<tr>
								<td></td>
								<td align="left">${book.bookname }</td>
								<td align="left">${book.writer }</td>
								<td align="left">${book.genre}</td>
								<c:choose>
									<c:when test="${book.borrowcheck=='0'}">
										<td align="left">대출가능</td>
										<td>
											<button class="btn btn-default btn-sm" type="button"
												id="reservebook"
												onClick="location.href='/stopBorrow?bookCode=${book.bookCode}'">대출정지</button>
											<button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
										</td>
									</c:when>
									<c:when test="${book.borrowcheck=='1'}">
										<td><mark>대여요청중</mark></td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
										</td>
									</c:when>
									<c:when test="${book.borrowcheck=='2'}">
										<td>대출중</td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
										</td>
									</c:when>
									<c:when test="${book.borrowcheck=='4'}">
										<td><mark>대출정지</mark></td>
										<td></td>
									</c:when>
									<c:when test="${book.borrowcheck=='5'}">
										<td><mark>예약중</mark></td>
										<td><button class="btn btn-default btn-sm" type="button"
												id="modifybook"
												onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deletebook"
												onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
										</td>
									</c:when>
								</c:choose>


							</tr>
							<tr>
								<td></td>
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
			</form>
			<div align="center">
				<c:forEach var="seq" begin="1" end="${total}" step="1">
					<a class="page" href="/page?seq=${seq}">${seq} &nbsp;</a>
				</c:forEach>

				<a class="page" style="float: right;" href="/page?seq=${total}"><mark>${total}</mark></a>
			</div>
		</div>
	</div>
	<script src="/resources/js/common.js"></script>
	<script>
		
	</script>
</body>
</html>