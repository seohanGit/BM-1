<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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

					<form action="modifiRequest" method="post">
						<div class="right right-end">
							<button class="btn btn-default" type="submit">수정</button>
						</div>
						<table class="table table-striped table-bordered" id="dataTable">



							<thead>
								<tr class="title ">
									<th class="td-title">도서코드 수정</th>

									<th>도서명</th>
									<th class="hidden-sm hidden-xs hidden-md td-author">저자</th>
									<th class="td-date">가격</th>
									<th class="td-img">수량</th>



								</tr>
							</thead>


							<tbody>
								<c:forEach items="${bookList}" var="book" varStatus="status">
									<tr>
										<td><input type="text" name="book_cd"
											value="${book.book_cd}"><input type="hidden"
											name="req_cd" value="${book.req_cd}"></td>

										<td><a href="${book.link}">${book.title }</a></td>
										<td class="hidden-sm hidden-xs hidden-md ">${book.author}</td>

										<td class="hidden-sm hidden-xs  ">${book.price}원</td>
										<td align="center"><input type="number" name="quantity"
											min="1" placeholder="수량" value="${book.quantity}"></td>

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