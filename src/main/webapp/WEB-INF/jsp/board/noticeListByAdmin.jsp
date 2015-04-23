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

			<div >
				<h2>공지사항</h2>


				<p align="right">
					<button class="btn btn-default" type="button"
						onClick="location.href='/writeNotice'">추가</button>
			</div>


			<p></p>

			<br>
			<c:forEach items="${noticeList}" var="notice" varStatus="status">
				<form action="/modifyNotice" method="post">

					<div>

						<ul class="list-unstyled">

							<li style="text-align: left;"><fmt:formatDate
									value="${notice.registerdate}" pattern="yyyy-MM-dd" /></li>
							<li style="width: 98%; height: auto;"><textarea
									class="form-control " id="content" name="content"
									style="width: 100%;" rows="3" 
									onKeyDown="setLine( this )">${notice.content}</textarea><input type="hidden"
								name="boardnum" value="${notice.boardnum }"></li>

							<button class="btn btn-default btn-sm" type="submit"
								id="modifyNotice">수정</button>

							<button class="btn btn-default btn-sm" type="button"
								id="deleteNotice"
								onClick="location.href='/deleteNotice?boardnum=${notice.boardnum}'">삭제</button>

						</ul>
					</div>
				</form>

			</c:forEach>
		</div>
	</div>


	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function setLine(txa) {
			line = 5 //기본 줄 수

			new_line = txa.value.split("\n").length + 1;
			if (new_line < line)
				new_line = line;

			txa.rows = new_line;
		}
		function del() {
			alert("승인되었습니다.");
		}
	</script>
</body>
</html>