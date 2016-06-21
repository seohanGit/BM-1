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
<title>대여 기록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
 
</head>

<body class="main">
	<jsp:include page="../nav.jsp" />
	<div id="loadingBar"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center; margin: 0 auto; z-index: 100000;">
		<table width="100%" height="100%" border="0" bgcolor="#000000">
			<tr>
				<td align="center">
					<div style="text-align: center;">
						<IMG SRC="resources/img/loading_map.gif">
					</div>
					<div
						style="margin-top: 20px; color: #FFF; text-align: center; font-weight: bold;">L
						o a d i n g . . .</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="divLoadBody" style="display: none;" class="container">
		<div class="col-md-12"><jsp:include page="../menu.jsp" />
			<div class="col-xs-12 panel panel-default">
				<div class="panel-body">
					<div class="left">
						<h2>연체중 도서</h2>
					</div>
						<div class="dataTable_wrapper"> 
						<table class="table table-striped table-bordered" id="dataTable">
							<thead>
								<tr class="  title">
									<th class="td-title">도서명</th>
									<th class="td-date">대여자</th>
									<th class="hidden-sm hidden-xs hidden-md td-author">분류</th>
									<th class="td-author hidden-xs">대여일</th>
									<th class="td-author">반납일</th>
									<th class="td-img">반납</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${bookList}" var="book" varStatus="status"> 
									<tr> 
										<td class="td-title" align="left">${book.title }</td>
										<td><c:choose>
												<c:when test="${empty book.kname}">${book.id}</c:when>
												<c:otherwise>${book.kname}</c:otherwise>
											</c:choose></td>
										<td class="hidden-sm hidden-xs hidden-md" id="b_group"
											align="left">${book.b_group}</td>
										<td class="hidden-xs" align="left"> ${book.rentdate } </td>
										<td align="left"> ${book.returndate } </td> 
										<td><button class="btn btn-default btn-sm"
														type="button" id="reservebook"
														onClick="location.href='/returnBook?book_cd=${book.book_cd}'; re_turn();">반납</button>
												</td>
									</tr> 
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#dataTable').DataTable({
				"pageLength" : 50,
				paging : true,
				"order" : [],
				"columns" : [ {
					"searchable" : true
				}, {
					"searchable" : true
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				} ]

			});

			new $.fn.dataTable.FixedHeader(table);
		});
		var loadingBar = document.getElementById("loadingBar");
		var divLoadBody = document.getElementById("divLoadBody");

		divLoadBody.style.display = "";
		loadingBar.style.display = "none";

		$("#select").change(function() {
			var options = $(this).val();
			$('table tr').show();
			$("#dataTable tbody tr").each(function() {
				var tr = $(this);
				var td = tr.find("td:eq(2)")
				if (td.text() !== options) {
					tr.hide();
				}
			})

		});
	</script>
</body>
</html>