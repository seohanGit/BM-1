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
<title>자료 구입신청</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
 

</head>

<body class="main">
	<jsp:include page="../nav.jsp" />
	<div class="container">

		<div class="row panel panel-default">
			<!-- Blog Entries Column -->

			<div>
				<h2>자료 구입신청</h2>

				<div class="input-group" style="float: left; width: 70%">
					<form action="/findBook" method="post">
						<input type="hidden" name="type" value="">
						<span class="input-group-btn"> <input type="text"
							class="form-control" id="query" name="keyword"
							placeholder="검색가능도서 - ISBN, 도서명, 저자 검색">
							<button class="btn btn-default" type="submit" id="btn_find">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
				<div style="float: right;"> 
					<button class="btn btn-default" type="button"
						onclick="window.open
							('/requestbook?type=isbn&keyword=','new','resizeble=yes scrollbars=yes, width=500, height=700');">
							ISBN 미보유 도서</button>
				</div>
				<br>
				<div style="margin-top: 20px; padding-top: 20px">
					<table class="table table-striped table-bordered" id="dataTable">

						<c:choose>
							<c:when test="${empty bookList}">

								<h3>구매 요청한 도서가 없습니다.</h3>
							</c:when>
							<c:otherwise>
								<thead>
									<tr class=" title">

										<th class="hidden-xs midlen">표지</th>
										<th class="title">도서명</th>
										<th class="hidden-xs author">저자</th>
										<th class="hidden-xs midlen">가격</th>
										<th style="width: 50px">수량</th>
										<th class="hidden-xs longlen">요청일자</th>
										<th class="genre">상태</th>

									</tr>
								</thead>

								<c:forEach items="${bookList}" var="book" varStatus="status"> 
									<tbody class="hidden-xs">
										<tr>
											<td align="center" class="hidden-xs"><img style="width: 50px"
												src="${book.imageurl}"></td>
											<td align="left" class="td-title"><c:choose>
													<c:when test="${not empty book.link}">
														<a 
														onclick="window.open('/bookInfo?reqdate=${book.reqdate}&req_cd=${book.req_cd}',
												'new','resizeble=yes scrollbars=yes,  width=750, height=600');">${book.title }</a>
													</c:when>
													<c:otherwise>
													${book.title }
													</c:otherwise>
												</c:choose>
												</td>
											<td align="center" class="hidden-xs">${book.author}</td>
											<td align="right" >${book.price}원</td>
											<td align="center">${book.quantity}</td>
											<td align="center" class="hidden-xs"><fmt:parseDate value="${book.reqdate}000000"
														pattern="yyyyMMddHHmmss" var="reqDate" scope="page" /> <fmt:formatDate
														value="${reqDate}" pattern="yyyy-MM-dd" /> </td>
											<c:choose>
												<c:when test="${book.reqstatus=='0'}">
													<td align="center" >대기</td>
												</c:when>
												<c:when test="${book.reqstatus=='1'}">
													<td align="center" class="ok">승인</td>
												</c:when>
												<c:when test="${book.reqstatus=='2'}">
													<td align="center" class="no">반려</td>
												</c:when>
											</c:choose>
										</tr>
									</tbody>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<hr>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
	</script>
</body>
</html>
