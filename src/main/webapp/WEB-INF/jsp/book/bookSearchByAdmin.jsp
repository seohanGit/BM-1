<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>대여 요청 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
<script>
	function del() {
		alert("삭제되었습니다.");

	}
</script>


</head>

<body>
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

			<div class="panel panel-default">

				<!-- /.panel-heading -->
				<form action="stopBorrowList" method="post">
					<div class="panel-body">

						<div class="left">
							<h2>도서목록</h2>
						</div>

						<div class="right-end"
							style="vertical-align: middle; margin-right: 20px">


							<select class="form-group select"
								style="height: 33.6px; font-size: 14px; vertical-align: baseline;"
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

							<!-- 	<select>
								<option value="B">B-도서(단행본)
								<option value="E">E-기타매체
								<option value="J">J-정기간행물
								<option value="P">P-특허자료
								<option value="R">R-보고서
								<option value="S">S-규격/사전
								<option value="T">T-논문
							</select> -->
							<button style="width: 100px" class="btn btn-default"
								type="button" id="insertBook">도서추가</button>
							<button style="width: 100px" class="btn btn-default"
								type="submit">대출정지</button>
						</div>
					</div>
					<div class="dataTable_wrapper">

						<table class="table table-striped table-bordered " id="dataTable">
							<thead>
								<tr>
									<th style="width: 15px"></th>
									<th>도서명</th>
									<th class=" hidden-xs td-genre">저자</th>
									<th class="hidden-sm hidden-xs hidden-md td-author">분류</th>

									<th style="width: 110px">대여상태</th>

									<th style="width: 90px"></th>
								</tr>
							</thead>
							<%-- 
						
 --%>

							<tbody id="tablebody">
								<c:forEach items="${bookList}" var="book" varStatus="loop">

									<tr>
										<td><input type="checkbox" name="book_cd"
											value="${book.book_cd}"></td>
										<td align="left"><a href="#"
											onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes, width=850, height=850');">
												${book.title }</a></td>
										<td class="hidden-xs" align="left">${book.author}</td>
										<td class="hidden-sm hidden-xs hidden-md"
											id="${book.b_group }" align="left">${book.b_group}</td>
										<c:choose>
											<c:when test="${book.rentchk=='0'}">
												<td align="left">대출가능</td>
												<td>
													<button class="btn btn-default btn-sm" type="button"
														id="reservebook"
														onClick="location.href='/stopBorrow?book_cd=${book.book_cd}'">대출정지</button>
													<button class="btn btn-default btn-sm" type="button"
														id="modifybook"
														onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850px, height=750px');">도서수정</button>
													<button class="btn btn-default btn-sm" type="button"
														id="deletebook"
														onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
												</td>
											</c:when>
											<c:when test="${book.rentchk=='1'}">
												<td><mark>대여요청중</mark></td>
												<td><button class="btn btn-default btn-sm"
														type="button" id="modifybook"
														onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
													<button class="btn btn-default btn-sm" type="button"
														id="deletebook"
														onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
												</td>
											</c:when>
											<c:when test="${book.rentchk=='2'}">
												<td>대출중</td>
												<td><button class="btn btn-default btn-sm"
														type="button" id="modifybook"
														onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
													<button class="btn btn-default btn-sm" type="button"
														id="deletebook"
														onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
												</td>
											</c:when>
											<c:when test="${book.rentchk=='4'}">
												<td><mark>대출정지</mark></td>
												<td><button class="btn btn-default btn-sm"
														type="button" id="modifybook"
														onClick="location.href='/recoverBook?book_cd=${book.book_cd}'">대출재개</button></td>
											</c:when>
											<c:when test="${book.rentchk=='5'}">
												<td><mark>예약중</mark></td>
												<td><button class="btn btn-default btn-sm"
														type="button" id="modifybook"
														onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
													<button class="btn btn-default btn-sm" type="button"
														id="deletebook"
														onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
												</td>
											</c:when>
										</c:choose>


									</tr>

								</c:forEach>
							</tbody>

						</table>
				</form>
			</div>

		</div>

	</div>
	<br>


	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/metisMenu.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#dataTable').dataTable({
				"pageLength" : 10,
				paging : true,
				"order" : [],
				"columns" : [ {
					"searchable" : false
				}, null, null, {
					"searchable" : false
				}, {
					"searchable" : false
				}, {
					"searchable" : false
				} ]

			}).columnFilter({
				aoColumns : [ null, null, null, {
					type : "select"
				}, {
					type : "select"
				}, null ]
			});
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
				var td = tr.find("td:eq(3)")
				if (td.text() !== options) {
					tr.hide();
				}
			})

		});
	</script>
</body>
</html>