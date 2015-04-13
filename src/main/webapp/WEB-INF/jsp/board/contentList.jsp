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
<title>공지사항</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">


</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div id="searchResultArea">
				<hr>
				<h2>공지사항</h2>
				<hr>
				<table class="table table-striped table-bordered ">

					<thead>
						<tr class="hidden-xs title">
							<td>대여일자</td>
							<td>공지사항 내용</td>
							<td></td>
							<td></td>
						</tr>
					</thead>

					<c:forEach items="${nociceList}" var="notice" varStatus="loop">

						<tbody>

							<tr>
								<td width="15%" align="left">${notice.noticedate}</td>
								<td width="30%" align="left">${notice.content }</td>

								<td><button class="btn btn-default" type="button"
										id="extendbook"
										onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'">수정</button>
								</td>
								<td><button class="btn btn-default" type="button"
										id="reservebook"
										onClick="location.href='/returnBook?bookCode=${book.bookCode}'">삭제</button>
								</td>
							</tr>
							<tr>

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