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
<title>공지사항</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div id="searchResultArea" class="row">
			<hr>
			<h2>
				공지사항
				<button class="btn btn-default" style="position: relative;"
					onClick="location.href='/writeNotice'">추가</button>
			</h2>
			<hr>

			<table class="table table-striped table-bordered ">

				<thead>
					<tr class="hidden-xs title">
						<td>공지일자</td>
						<td>공지사항 내용</td>
						<td></td>
						<td></td>
					</tr>
				</thead>


				<tbody>

					<c:forEach items="${noticeList}" var="notice" varStatus="status">

						<tr>
							<form action="/modifyNotice" method="post">
								<td width="15%" align="left"><fmt:formatDate
										value="${notice.registerdate}" pattern="yyyy-MM-dd" /></td>
								<td width="60%" align="left"><input class="form-control"
									id="content" name="content" type="text"
									placeholder="${notice.content}"><input type="hidden"
									name="boardnum" value="${notice.boardnum }"></td>

								<td><button class="btn btn-default" type="submit"
										id="modifyNotice">수정</button></td>
							</form>
							<td><button class="btn btn-default" type="button"
									id="reservebook"
									onClick="location.href='/deleteNotice?boardnum=${notice.boardnum}'">삭제</button></td>
						</tr>

						<tr>

							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</c:forEach>

				</tbody>

			</table>
		</div>

	</div>
	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("승인되었습니다.");
		}
	</script>
</body>
</html>