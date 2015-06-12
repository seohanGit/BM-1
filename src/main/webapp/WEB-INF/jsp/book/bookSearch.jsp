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
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">


</head>
<body onload="parent.resizeTo(1400,1000);">
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
		<div class="col-md-12 col-xs-12 col-sm-9">
			<div class="panel panel-default">

				<div class="panel-body">
					
					<div style="width: 100%; float: left;">
						<h2>도서검색 목록</h2>
					</div>



					<div style="float: right; vertical-align: baseline; width: 90%;"
						align="right">
						<div align="right" class="input-group "
							style="vertical-align: baseline; float: left; width: 60%">
							<form action="/searchBook" method="post">
								<span class="input-group-btn"> <input type="text"
									class="form-control" id="keyword" name="keyword"
									placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
									<button class="btn btn-default" type="submit" id="btn_find">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</form>
						</div>
						<div class="input-group"
							style="width: 20%; vertical-align: baseline; float: right; margin-right: 30px;">
							<select class="selectpicker"
								style="width: 10%; font-size: 14px; margin-top: 10px; vertical-align: baseline;"
								id="select">
								<optgroup label="대분류">
									<option value="B-도서(단행본)">B-도서(단행본)
									<option value="E-기타매체">E-기타매체
									<option value="J-정기간행물">J-정기간행물
									<option value="P-특허자료">P-특허자료
									<option value="R-보고서">R-보고서
									<option value="S-규격/사전">S-규격/사전
									<option value="T-논문">T-논문
								</optgroup>
							</select>
						</div>
					</div>
					<div class="dataTable_wrapper">
						<table class="table table-striped table-bordered " id="dataTable">


							<thead>
								<tr>

									<th>도서명</th>

									<th class="hidden-xs td-author">저자</th>
									<th class="hidden-xs hidden-sm td-genre">출판사</th>
									<th class="hidden-xs td-genre" style="width: 120px">분류</th>
									<th style="width: 100px">대여상태</th>



									<th class="td-img"></th>
								</tr>
							</thead>

							<tbody>

								<c:forEach items="${bookList}" var="book">

									<tr>

										<td class="td-title" align="left"><a href="#"
											onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=850');">
												${book.title }</a></td>
										<td class="hidden-xs" align="left">${book.author }</td>
										<td class="hidden-xs hidden-sm genre" align="left">${book.publish}</td>
										<td class="hidden-xs td-genre" align="left">${book.b_group }</td>
										<c:choose>
											<c:when test="${book.rentchk=='0'}">
												<td align="left"><mark>대출가능</mark></td>
												<td align="left"><button class="btn btn-default"
														type="button" id="borrowbook"
														onClick="location.href='/borrowbook?book_cd=${book.book_cd}'; borrow();">대출</button></td>
											</c:when>

											<c:when test="${book.rentchk=='1' and book.reservechk=='1'}">
												<td>예약중</td>
												<td></td>
											</c:when>
											<c:when test="${book.rentchk=='1' and book.reservechk=='0'}">
												<td>~ <fmt:formatDate type="date" pattern="MM-dd"
														value="${book.returndate}" /></td>
												<td><button class="btn btn-default" type="button"
														id="reservebook"
														onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button></td>
											</c:when>

											<c:when test="${book.rentchk=='2' and book.reservechk=='1'}">
												<td>예약중</td>
												<td></td>
											</c:when>
											<c:when test="${book.rentchk=='2' and book.reservechk=='0'}">
												<td>~ <fmt:formatDate type="date" pattern="MM-dd"
														value="${book.returndate}" /></td>
												<td><button class="btn btn-default" type="button"
														id="reservebook"
														onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button></td>
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
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').dataTable({
				"language" : {
					"url" : "dataTables.korean.lang"
				},
				/* "pageLength" : 10, */
				"pageLength" : 100,
				paging : false,
				searching : false,
				"columns" : [ null, null, null, {
					"searchable" : false

				}, {
					"searchable" : false
				}, {
					"searchable" : false,

				} ]

			});
			/* .columnFilter({

				aoColumns : [ null, null, null, {
					type : "select"
				}, {
					type : "select",
					values : [ '대여요청중', '대출', '대출' ]
				}, null ]
			}); */
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