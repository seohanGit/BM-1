<%@ page language="java" contentType="text/html; charset=EUC-kr"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>구매 요청 목록</title>
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

		<div class="col-md-12"><jsp:include page="../menu.jsp" />
			<div class="panel panel-default">
				<div class="panel-body">

					<!-- Blog Entries Column -->
					<div class="left">
						<h3>도서코드 구매 후 변경 불가 !!</h3>
					</div>
					<form action="modifiRequest" method="post">
						<div class="right right-end">
							<button class="btn btn-default" type="submit">수정</button>
						</div>
						<table class="table table-striped table-bordered" id="dataTable">



							<thead>
								<tr class="title ">
									<th class="td-genre">도서코드 수정</th>

									<th>도서명</th>
									<th class="hidden-sm hidden-xs hidden-md td-author">저자</th>
									<!-- <th class="author">대분류</th>
									<th class="author">소분류</th> -->
									<th class="td-date hidden-sm hidden-xs">가격</th>
									<th class="td-date">수량</th>



								</tr>
							</thead>



							<tbody>
								<c:forEach items="${bookList}" var="book" varStatus="status">
									<tr>
										<td><c:choose>
												<c:when test="${book.reqstatus == 0}">
													<input type="text" name="book_cd" value="${book.book_cd}">
													<input type="hidden" name="req_cd" value="${book.req_cd}">
												</c:when>
												<c:otherwise>
													<input type="text" value="${book.book_cd}" readonly>
													<input type="hidden" name="req_cd" value="${book.req_cd}">
												</c:otherwise>
											</c:choose></td>

										<td><a href="${book.link}" tabindex="0">${book.title }</a></td>
										<td class="hidden-sm hidden-xs hidden-md ">${book.author}</td>
										<%-- 	<td><select name="b_group" tabindex="${status.index }">
												<!-- <optgroup
													label="대분류"> -->

												<c:forEach items="${BCodeList }" var="b_code">
													<option value="${b_code.code}">${b_code.code}-${b_code.name}</option>
												</c:forEach>
										</select></td>
										<td><select name="c_group" tabindex="${status.index }">
												<!-- <optgroup
													label="소분류"> -->

												<c:forEach items="${CCodeList }" var="c_code">
													<option value="${c_code.code}">${c_code.code}-${c_code.name}
												</c:forEach>
										</select></td> --%>

										<td class="hidden-sm hidden-xs" style="text-align: right; ">${book.price}원</td>
										<td class="hidden-sm hidden-xs" style="text-align: right;">${book.price}원</td>

										<td align="center"><c:choose>
												<c:when test="${book.reqstatus == 0}">
													<input type="number" name="quantity" min="1"
														placeholder="수량" value="${book.quantity}">
												</c:when>
												<c:otherwise>
													<input type="number" name="quantity" min="1"
														value="${book.quantity}" readonly>
												</c:otherwise>
											</c:choose></td>

									</tr>
								</c:forEach>
							</tbody>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/common.js"></script>
	<script src="/resources/js/jquery/book.js"></script>

</body>
</html>