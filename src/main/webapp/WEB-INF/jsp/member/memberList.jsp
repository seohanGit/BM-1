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
<title>사원 목록</title>
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
			<h2>사원 목록</h2>
			<hr>
			<table class="table table-striped table-bordered ">

				<thead>
					<tr class="hidden-xs title">

						<td id="tb-title">부서명</td>
						<td id="tb-date">성명</td>
						<td id="tb-date">연체상태</td>
						<td id="tb-date">대여권수</td>
						<td id="tb-status">사원번호</td>
						<td id="tb-status">Mobile</td>
						<td id="tb-status">Email</td>

					</tr>
				</thead>

				<c:forEach items="${memberList}" var="member" varStatus="loop">

					<tbody>

						<tr>
							<td align="left">${member.team }</td>
							<td align="left">${member.name }</td>
							<c:choose>
								<c:when test="${member.numarrear!='0'}">
									<td align="left">연체자</td>
								</c:when>
								<c:otherwise>
									<td align="left">정상사원</td>
								</c:otherwise>
							</c:choose>
							<td align="left">총 <mark>${member.numborrow}</mark>권 </td>
							<td>ID : ${member.id}</td>
							<td>${member.cell}</td>
							<td>${member.email}</td>
							<%-- 
							<td><button class="btn btn-default" type="button"
									id="extendbook"
									onClick="location.href='/extendBorrowBook?bookCode=${book.bookCode}'">연장</button>
							</td>
 --%>

						</tr>
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