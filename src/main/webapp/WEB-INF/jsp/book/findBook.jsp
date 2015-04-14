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
			<c:forEach items="${bookList}" var="book" varStatus="status">

				<table width="100%" border="10px" bordercolor="#fff">

					<tbody>

						<tr>

							<td width="115px" style="margin: 10px"><span
								class="goods_cnt"></span> <img src="${book.imageurl}"
								width="95px" height="150px"></td>
							<td class="goods_infogrp" align="left" style="margin-left: 10px">

								<p>
									<a href="${book.link}">${book.bookname}</a>
								</p>

								<p>${book.writer}|${book.priceSales}원</p>
								<form action="/requestbook" method="get">
									<input type="hidden" value="${book.isbn}" name="isbn">
									<input type="number" name="quantity" placeholder="구매 수량">
									<button class="btn btn-default" type="submit" id="requestbook">구매요청</button>

								</form> <%-- 
					<button class="btn btn-default" type="button" id="requestbook"
						onClick="location.href='/requestbook?isbn=${book.isbn}'">구매</button>
					&writer=${book.writer}&publisher=${book.publisher}&imageurl=${book.imageurl}
 --%>

							</td>

						</tr>

					</tbody>
				</table>

			</c:forEach>
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