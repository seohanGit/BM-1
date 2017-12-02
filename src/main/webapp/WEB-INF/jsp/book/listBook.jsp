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
<link href="/resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/book.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.datepicker').datepicker({
					showOn : "button",
					buttonImage : "/resources/img/calendar.gif",
					buttonImageOnly : true,
					buttonText : "Select date",
					dateFormat: 'yymmdd'
				});
				
				var myDate = new Date();
				var year = myDate.getFullYear();
				for (var i = 2000; i < year + 1; i++) {
					$('#year').prepend(
							'<option value="'+i+'">' + i + '</option>')
							.selectpicker('refresh');
				}
				for (var i = 1; i < 13; i++) {
					if (i < 10) {
						i = '0' + i;
					}
					$('#month').append(
							'<option value="'+i+'">' + i + '</option>');
				}
				$('#year').selectpicker('val', year);
				$('#month').selectpicker('val', mm2);
				$('.selectpicker').selectpicker('refresh');
			});
</script>
</head>
<body class="main">
	<jsp:include page="../nav.jsp" />
	<div id="loadingBar"
		style="background-color: #fff; position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center; margin: 0 auto; z-index: 100000;">
		<table style="width:100%; height:100%; border:0 ; bgcolor:#fff" >
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
							<input id="listType" name="listType" type="hidden" value="${listType }">
							<input id="keyword" name="keyword" type="hidden" value="${keyword}">
							<div class="col-md-12 col-lg-12">
								<c:choose>
									<c:when test="${listType=='new'}">
										<div class="row" style="margin: auto; vertical-align: middle;">
											<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
												<h2>신간도서</h2>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"
												style="margin-top: 3%;">
												<div class="input-group date" data-provide="datepicker">
													<input class="datepicker" id="datepicker1"
														name="datepicker1" type="text" value="${date1}">
												</div>
											</div>

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"
												style="margin-top: 3%;">
												<div class="input-group date" data-provide="datepicker">
													<input class="datepicker" id="datepicker2"
														name="datepicker2" type="text" value="${date2}">
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${listType=='recommend'}">

										<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
											<h2>추천도서</h2>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-lg-3 col-md-3 col-sm-7 col-xs-7">
											<div style="margin: 5px">
												<h2>베스트도서</h2>
											</div>
										</div>
										<div class="row col-lg-8 col-md-8 col-sm-5 col-xs-5" style="padding-top:2%">
											<select class="selectpicker bestpicker"
												style="font-size: 14px; width: 100%" id="year" name="year">

											</select>년 <select class="selectpicker bestpicker"
												style="font-size: 14px; width: 100%" id="month" name="month">

											</select>월
										</div>										
									</c:otherwise>
								</c:choose>
							</div>
						</form>
					</div>
					<div id="searchResultArea">
						<div class="dataTable_wrapper ">
							<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
								<table class="table table-striped table-bordered "
									id="dataTable">
									<thead>
										<tr>
											<th class="hidden-xs hidden-sm hidden-md genre">표지</th>
											<th>도서명</th>
											<th class="hidden-xs hidden-sm hidden-md genre">저자</th>
											<th class="hidden-xs hidden-sm genre">출판사</th>
											<th class="hidden-xs genre" style="width: 120px">분류</th>
											<th class="genre">대여상태</th>
											<th class="genre">대출</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${bookList}" var="book">
											<tr>
												<td class="hidden-xs hidden-sm hidden-md genre" align="left" ><c:choose>
														<c:when test="${empty book.imageurl }">
															<a href="#"
													onclick="window.open('/bookInfo?book_cd=${book.book_cd}&keyword=${keyword }&listType=${listType }',
															'new','resizeble=yes scrollbars=yes,  width=750, height=600');">
														<img src="/resources/img/noimage.png" style="width: 50px" > </a>
														</c:when>
														<c:otherwise>
															<a href="#"
													onclick="window.open('/bookInfo?book_cd=${book.book_cd}&keyword=${keyword }&listType=${listType }',
															'new','resizeble=yes scrollbars=yes,  width=750, height=600');">														
														<img src="${book.imageurl}" style="width:90%">
														</a>
														</c:otherwise>
													</c:choose></td>
												<td align="left"><a href="#"
													onclick="window.open('/bookInfo?book_cd=${book.book_cd}&keyword=${keyword }&listType=${listType }',
																'new','resizeble=yes scrollbars=yes,  width=750, height=600');">
														${book.title }</a></td>
												<td class="hidden-xs hidden-sm hidden-md genre" align="left"><nobr>${book.author }</nobr></td>
												<td class="hidden-xs hidden-sm genre" align="left"><nobr>${book.publish}</nobr></td>
												<td class="hidden-xs genre" align="left">${book.b_group }</td>
												<c:choose>
													<c:when test="${book.rentchk=='0'}">
														<td align="left"><mark>대출가능</mark></td>
														<td align="left"><button class="btn btn-default borrow"
																type="button" id="borrowbook" value="${book.book_cd}"
																>대출</button></td>
													</c:when>
													<c:when
														test="${book.rentchk=='1' and book.reservechk=='1'}">
														<td>예약중</td>
														<td></td>
													</c:when>
													<c:when
														test="${book.rentchk=='1' and book.reservechk=='0'}">
														<td><p style="color: blue;">대출요청중</p>  	</td>
														<td>
<!-- 														<button class="btn btn-default" type="button" -->
<!-- 																id="reservebook" -->
<%-- 																onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button> --%>
																</td>
													</c:when>
													<c:when
														test="${book.rentchk=='2' and book.reservechk=='1'}">
														<td>예약중</td>
														<td></td>
													</c:when>
													<c:when
														test="${book.rentchk=='2' and book.reservechk=='0'}">
														<td><p style="color: blue;">대출중</p> 반납일
															:${book.returndate}</td>
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
													<c:otherwise>
														<td>-</td>
														<td>-</td>
													</c:otherwise>
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
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').dataTable({ 
				"pageLength" : 10,
				paging : true,
				searching : true,
				"columns" : [{
					"searchable" : false
				}, null, null, null, {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : false,
				} ]
			});
		});

		var loadingBar = document.getElementById("loadingBar");
		var divLoadBody = document.getElementById("divLoadBody");

		divLoadBody.style.display = "";
		loadingBar.style.display = "none";
		$("#select").change(function() {
			var options = $(this).val();
			$('#dataTable tbody tr').show();
			$("#dataTable tbody tr").each(function() {
				var tr = $(this);
				var td = tr.find("td:eq(3)")
				if (td.text() !== options) {
					tr.hide();
				}
			})
		});

		$('.selectpicker').selectpicker();
	</script>
</body>
</html>