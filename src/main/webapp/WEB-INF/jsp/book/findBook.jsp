<%@page import="com.baron.member.model.BookModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>인터파크 검색</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index.css" rel="stylesheet">

<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/jquery/book.js"></script>
<script type="text/javascript">
	function request() {
		alert("구매요청되엇습니다.");
	}
	/* 
	 function next() {
	 var totalPage = "${totalPage}";

	 if($('#next') ){
	 for (var i = 10; i < 20; i++) {
	 var page = "<b> <a href='findBook?keyword=${keyword}&page="
	 + i + "''>" + i + "</a></b> &nbsp;";
	 $('#page').append(page);
	 }}
	 });
	 */
	$(document).ready(
			function() {
				var lastpage = "${totalPage}";
				lastpage = "<b><a href='findBook?keyword=${keyword}&page="
						+ lastpage + "'>" + lastpage + "</a></b>";
				for (var i = 1; i < 11; i++) {
					var page = "<b> <a href='findBook?keyword=${keyword}&page="
							+ i + "''>" + i + "</a></b> &nbsp;";
					$('#page').append(page);
				}
				$('#page').append(lastpage);
			});
</script>
</head>
<body onload="pagenation()">
	<jsp:include page="../nav.jsp" />
	<!-- Page Content -->
	<div id="searchResultArea">
		<div class="container">
			<h4>원하는 책이 없다면 인터넷에서 주문하세요 !</h4>
			<div class="input-group ">
				<form action="/findBook" method="get">
					<span class="input-group-btn"> <input type="text"
						class="form-control" id="query" name="keyword"
						placeholder="인터파크 검색">
						<button class="btn btn-default" type="submit" id="btn_find">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</form>
			</div>


			<table style="width=:90%; bordercolor:#fff">

				<thead>
					<tr>
						<td id="td-img">표지</td>
						<td id="td-title">도서명</td>
						<td id="td-author">저자</td>
						<td id="td-genre">장르</td>
						<td id="td-author">출판사</td>
						<td id="td-date">가격</td>
						<td id="td-date"></td>
						<td></td>
					</tr>
				</thead>
				<c:forEach items="${bookList}" var="book" varStatus="status">
					<tbody>

						<tr>
							<td rowspan="3" style="width: 50px" align="left"><img
								style="width: 50px" src="${book.imageurl}"></td>
						</tr>
						<tr>
							<td align="left"><a href="${book.link}">${book.bookname}</a></td>
							<td align="left">${book.writer }</td>
							<td align="left">${book.genre}</td>
							<td align="left">${book.publisher}</td>
							<td align="left">${book.priceSales}원</td>

							<form action="/requestbook" method="get">
								<td style="width: 20px"><input type="hidden"
									value="${book.isbn}" name="isbn"> <input type="number"
									name="quantity" placeholder="구매 수량" style="width: 90px"></td>
								<td>
									<button class="btn btn-default" type="submit" id="requestbook">구매요청</button>


									<%-- 
					<button class="btn btn-default" type="button" id="requestbook"
						onClick="location.href='/requestbook?isbn=${book.isbn}'">구매</button>
					&writer=${book.writer}&publisher=${book.publisher}&imageurl=${book.imageurl}
 --%>
								</td>
							</form>
						</tr>

					</tbody>
				</c:forEach>
			</table>


		</div>
	</div>
	<div id="page"></div>

	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</footer>
	<script src="/resources/js/jquery/common.js"></script>
</body>
</html>