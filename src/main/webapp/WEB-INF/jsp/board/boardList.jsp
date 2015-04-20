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
<title>게시판 관리</title>
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
			<h2>게시판 관리</h2>
			
			<table class="table  table-condensed">
				<thead>
					<tr>
						<td id="tb-status">ID</td>
						<td id="tb-status">제목</td>
						<td>내용</td>
						<td>최종 수정일</td>
						<td id="tb-date"></td>

					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<c:forEach items="${boardList}" var="board" varStatus="status">
					<tbody>

						<form action="/modifyBoard" method="post">
							<tr>
								<td style="vertical-align: top;">${board.id}</td>
								<td style="vertical-align: top;"><input id="title"
									name="title" type="text" style="width: 90%;"
									value="${board.title}" /></td>
								<td style="width: 60%; height: auto;" align="left"><textarea
										autofocus="autofocus" class="form-control " id="content"
										name="content" style="width: 90%;" rows="5"
										onKeyDown="setLine( this )"> ${board.content}</textarea></td>


								<td style="width: 10%;"><fmt:formatDate
										value="${board.modifidate}" pattern="yyyy-MM-dd" /></td>

								<td><input type="hidden" name="boardnum"
									value="${board.boardnum }">
									<button class="btn btn-default btn-sm" type="submit"
										id="modifyBoard">수정</button> <hr>
									<button class="btn btn-default btn-sm" type="button"
										id="deleteBoard"
										onClick="location.href='/deleteBoard?boardnum=${board.boardnum}'">삭제</button>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</form>
					</tbody>
				</c:forEach>

			</table>


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