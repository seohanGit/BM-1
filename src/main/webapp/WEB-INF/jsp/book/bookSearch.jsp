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
<title>도서 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<link href="/resources/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="loadingBar"
		style="background-color: #fff; position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center; margin: 0 auto; z-index: 100000;">
		<table style="width: 100%; height: 100%; border: 0; bgcolor: #fff">
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
	<div id="divLoadBody" style="display: none;" class="container ">
		<div class="col-md-12">
			<div class="panel panel-default ">
				<div class="panel-body">
					<div class="col-md-12 col-lg-12">
						<form action="/searchBook" method="post">
							<div class="col-md-12 col-lg-12">
								<c:choose>
									<c:when test="${listType=='new'}">

									</c:when>
									<c:otherwise>

										<div class="col-lg-3 col-md-3">
											<h2>도서 목록</h2>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="col-lg-12 col-md-12" style="margin: 3%;">
									<div style="float: left; width: 20%">
										<select class="selectpicker form-control"
											style="font-size: 14px; margin-top: 10px; vertical-align: baseline;"
											id="b_group" name="b_group"><option selected>전체
												<c:forEach items="${BCodeList}" var="code">
													<option value="${code.code}-${code.name}">${code.code}-${code.name}
												</c:forEach></select>
									</div>
									<div class="input-group"
										style="vertical-align: baseline; float: left; width: 70%">

										<span class="input-group-btn"> <input id="listType"
											name="listType" type="hidden" value="${listType }"> <input
											type="text" class="form-control" id="keyword" name="keyword"
											placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]" value="${keyword }">
											<button class="btn btn-default" type="submit" id="btn_find">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>

					<div id="searchResultArea">
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered " id="dataTable">
								<thead>
									<tr>
										<th>도서명</th>
										<th class="hidden-xs hidden-sm hidden-md genre">저자</th>
										<th class="hidden-xs hidden-sm genre">출판사</th>
										<th class="hidden-xs genre" style="width: 120px">분류</th>
										<th class="col-xs-3 col-lg-2 col-md-2">대여상태</th>
										<th class="genre">대출</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${bookList}" var="book">
										<tr>
											<td align="left"><a href="#"
												onclick="window.open('/bookInfo?book_cd=${book.book_cd}&keyword=${keyword }&listType=${listType }',
										'new','resizeble=yes scrollbars=yes,  width=750, height=600');">
													${book.title }</a></td>
											<td class="hidden-xs hidden-sm hidden-md"><nobr>${book.author }</nobr></td>
											<td class="hidden-xs hidden-sm "><nobr>${book.publish}</nobr></td>
											<td class="hidden-xs ">${book.b_group }</td>
											<c:choose>
												<c:when test="${book.rentchk=='0'}">
													<td><mark>대출가능</mark></td>
													<td><button class="btn btn-default borrow"
															type="button" id="borrowbook" value="${book.book_cd}"<%-- 													onClick="location.href='/borrowbook?book_cd=${book.book_cd}&listType=${listType}&keyword=${keyword}';"  --%>
													>대출</button>
													</td>
												</c:when>

												<c:when test="${book.rentchk=='1' and book.reservechk=='1'}">
													<td>예약중</td>
													<td></td>
												</c:when>
												<c:when test="${book.rentchk=='1' and book.reservechk=='0'}">
													<td><p style="color: blue;">대출요청중</p> <%-- 											반납일 : ${book.returndate} --%>
													</td>
													<td>
														<!-- 											<button class="btn btn-default" type="button" -->
														<!-- 													id="reservebook" --> <%-- 													onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button> --%>
													</td>
												</c:when>
												<c:when test="${book.rentchk=='2' and book.reservechk=='1'}">
													<td>예약중</td>
													<td></td>
												</c:when>
												<c:when test="${book.rentchk=='2' and book.reservechk=='0'}">
													<td><p style="color: blue;">대출중</p>
														<p class="hidden-xs">반납일 :${book.returndate}
														<p></td>
													<td></td>
												</c:when>
												<c:when test="${book.rentchk=='4'}">
													<td>대출 정지</td>
													<td></td>
												</c:when>
												<c:when test="${book.rentchk=='5'}">
													<td>예약중</td>
													<td></td>
												</c:when>
											</c:choose>
										</tr>


									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
	<script src="/resources/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var today = new Date();
			var today2 = new Date();
			var dd = today.getDate();
			var mm = today.getMonth(); //January is 0!
			var yyyy = today.getFullYear();
			var dd2 = today.getDate();
			var mm2 = today.getMonth() + 1; //January is 0!
			var yyyy2 = today.getFullYear();
			if (dd > 29) {
			}
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = yyyy + '-' + mm + '-' + dd;
			if (dd2 < 10) {
				dd2 = '0' + dd2
			}
			if (mm2 < 10) {
				mm2 = '0' + mm2
			}
			today2 = yyyy2 + '-' + mm2 + '-' + dd2;

			$('#datePicker1').attr('value', today);
			$('#datePicker2').attr('value', today2);

			$.fn.datepicker.defaults.format = "yyyymmdd";
			$('.datepicker').datepicker({
				format : "yy-mm-dd"
			});
			$('#dataTable').dataTable({
				"bSort" : false,
				"pageLength" : 10,
				paging : true,
				searching : false,
				"columns" : [ null, null, null, {
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

		$('.selectpicker').selectpicker();
	</script>
</body>
</html>