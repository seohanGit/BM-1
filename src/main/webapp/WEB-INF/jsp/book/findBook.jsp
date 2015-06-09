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

<!-- <script type="text/javascript">
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
 -->
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="loadingBar"
		style="background-color: #fff; position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center; margin: 0 auto; z-index: 100000;">
		<table width="100%" height="100%" border="0" bgcolor="#fff">
			<tr>
				<td align="center">
					<div style="text-align: center;">
						<IMG SRC="resources/img/loading_map.gif">
					</div>
					<div
						style="margin-top: 20px; color: #000; text-align: center; font-weight: bold; font-size: 40px">L
						o a d i n g . . .</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="divLoadBody" style="display: none;" class="container">

		<!-- Page Content -->
		<div id="searchResultArea">
			<hr>
			<h2>인터파크 검색</h2>

			<h4>원하는 책이 없다면 인터넷에서 주문하세요 !</h4>
			<div class="input-group ">
				<form action="/findBook" method="post">
					<span class="input-group-btn"> <input type="text"
						class="form-control" id="query" name="keyword"
						placeholder="인터파크 검색">
						<button class="btn btn-default" type="submit" id="btn_find">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</form>
			</div>

			<hr>
			<div class="dataTable_wrapper">
				<form action="/requestbook" method="get">
					<table class="table table-striped table-bordered"
						style="width =: 90%; bordercolor: #fff" id="dataTable">

						<thead>
							<tr>
								<td class="hidden-xs" id="td-img">표지</td>
								<td>도서명</td>
								<td class="hidden-xs td-author">저자</td>
								<td class="hidden-sm hidden-xs hidden-md" id="td-genre">분류</td>
								<td class="hidden-xs" id="td-genre">출판사</td>
								<td id="td-date">가격</td>
								<td id="td-date">수량</td>
								<td id="td-date">구매요청</td>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${bookList}" var="book" varStatus="status">
								<tr>
									<td class="hidden-xs" style="width: 50px" align="left"><img
										style="width: 50px" src="${book.imageurl}"></td>

									<td align="left"><a href="${book.link}">${book.title}</a></td>
									<td class="hidden-xs" align="left">${book.author }</td>
									<td class="hidden-sm hidden-xs hidden-md" align="left">${book.b_group}</td>
									<td class="hidden-xs" align="left">${book.publish}</td>
									<td align="left">${book.price}원</td>


									<td style="width: 20px"><input type="hidden"
										value="${book.isbn}" name="isbn"> <input type="number"
										name="quantity" min="1" placeholder="수량" style="width: 40px"></td>
									<td>
										<button class="btn btn-default" type="submit" id="requestbook">구매요청</button>


										<%-- 
					<button class="btn btn-default" type="button" id="requestbook"
						onClick="location.href='/requestbook?isbn=${book.isbn}'">구매</button>
					&writer=${book.writer}&publisher=${book.publisher}&imageurl=${book.imageurl}
 --%>
									</td>

								</tr>
							</c:forEach>
						</tbody>

					</table>
				</form>
			</div>
		</div>
	</div>


	<script src="/resources/js/metisMenu.min.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/common.js"></script>
	<script src="/resources/js/jquery/book.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {

			$('#dataTable').DataTable({
				"pageLength" : 10,
				paging : true,
				startSave : true,
				ordering : true,
				info : false,

				"columns" : [ {
					"searchable" : false
				}, null, null, , {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				} ]

			});
		});
		var loadingBar = document.getElementById("loadingBar");
		var divLoadBody = document.getElementById("divLoadBody");

		divLoadBody.style.display = "";
		loadingBar.style.display = "none";
	</script>
</body>
</html>