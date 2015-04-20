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

		<div id="searchResultArea" class="row">
			<hr>
			<h2>공지사항</h2>
			<hr>


			<c:forEach items="${noticeList}" var="notice" varStatus="status">
				
					<ul>
						<li width="15%" align="left"><fmt:formatDate
								value="${notice.registerdate}" pattern="yyyy-MM-dd" /></li>
						<li style="width: 90%; height: auto;" align="left"><textarea
								class="content ellipsis" id="content" name="content"
								style="width: 100%;" rows="2" readonly>${notice.content }</textarea></li>


					</ul>
				
			</c:forEach>


		</div>

	</div>
	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>

</body>
</html>