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
<title>도서 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<link href="/resources/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>  
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

				<div class="panel-body">

					<div style="width: 100%; float: left;">
						<h2>도서목록</h2>
					</div>
					<form action="/searchBookAdmin" method="post">
						<div style="width: 80%; margin-right: 10px;">
							<div class="left" style="width: 50%;" align="right">
								<div style="float: left; width: 40%;">
									<select class="selectpicker form-control"
										style="font-size: 14px; margin-top: 10px; vertical-align: baseline;"
										id="b_group" name="b_group"><option selected>전체
											<c:forEach items="${BCodeList}" var="code">
												<option value="${code.code}-${code.name}">${code.code}-${code.name}
											</c:forEach></select>
								</div>
								<div style="float: right; width: 60%;">
									<select class="selectpicker form-control"
										style="font-size: 14px; margin-top: 10px; vertical-align: baseline;"
										id="c_group" name="c_group"><option selected>전체
											<c:forEach items="${CCodeList}" var="code">
												<option value="${code.code}-${code.name}">${code.code}-${code.name}
											</c:forEach></select>
								</div>
							</div>
							<div class="input-group right"
								style="vertical-align: baseline; float: left; width: 50%">

								<span class="input-group-btn"> <input id="listType"
									name="listType" type="hidden" value="${listType }"> <input
									type="text" class="form-control" id="keyword" name="keyword"
									placeholder="기술자료실 도서 검색 [ 소문자로 입력 ]">
									<button class="btn btn-default" type="submit" id="btn_find">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>

							</div>
						</div>
						<div class="input-group right" align="right" style="width: 20%;">
							<button style="width: 100px; vertical-align: baseline;"
								class="btn btn-default" type="button" id="insertBook"
								onclick="window.open('/insertbookForm','new','resizeble=yes, scrollbars=yes, width=500, height=650');">
								도서추가</button>

							<!-- 								<button style="width: 100px; vertical-align: baseline;" -->
							<!-- 									class="btn btn-default" type="submit">대출정지</button> -->
						</div>
					</form>
					<div id="searchResultArea">
						<form action="stopBorrowList" method="post">
							<div class="dataTable_wrapper">
								<div class="left"
									style="vertical-align: baseline; margin-right: 20px"></div>
								<table class="table table-striped table-bordered "
									id="dataTable">
									<thead>
										<tr>
											<th class="genre">도서코드</th>
											<th>도서명</th>
											<th class="hidden-xs genre">저자</th>
											<th class="hidden-sm hidden-xs hidden-md genre">분류</th>
											<th style="width: 40px">추천</th>
											<th style="width: 90px">대출상태</th>
											<th style="width: 230px">비고</th>
										</tr>
									</thead>
									<tbody id="tablebody">
										<c:forEach items="${bookList}" var="book" varStatus="loop">
											<tr>
												<td class="book_cd"><input type="checkbox"
													name="book_cd" value="${book.book_cd}">${book.book_cd}</td>
												<td class="title" align="left"><a href="#"
													onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes, width=750, height=600');">
														${book.title }</a></td>
												<td class="hidden-xs genre"><nobr>${book.author }</nobr></td>
												<td class="hidden-sm hidden-xs hidden-md b_group"
													id="${book.b_group }">${book.b_group}</td>

												<td class="rcmdChk" align="center"><c:choose>
														<c:when test="${book.rcmdChk=='1' }">

															<input name="rcmdChk" value="1" type="checkbox"
																checked="checked">
															<%-- 											onclick="location.href='/setRecommend?book_cd=${book.book_cd}&rcmdChk=0';"> --%>
														</c:when>
														<c:otherwise>
															<input name="rcmdChk" value="0" type="checkbox">
															<%-- 											onclick="location.href='/setRecommend?book_cd=${book.book_cd}&rcmdChk=1';">											 --%>

														</c:otherwise>
													</c:choose></td>
												<c:choose>
													<c:when test="${book.rentchk=='0'}">
														<td align="center">대출가능</td>
														<td>
															<button class="btn btn-default btn-sm" type="button"
																id="deletebook"
																onClick="location.href='/deletebook?book_cd=${book.book_cd}&keyword=${keyword}'; del();">도서삭제</button>
															<button class="btn btn-default btn-sm" type="button"
																id="reservebook"
																onClick="location.href='/stopBorrow?book_cd=${book.book_cd}'">대출정지</button>
															<button class="btn btn-default btn-sm" type="button"
																id="modifybook"
																onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850px, height=750px');">도서수정</button>

														</td>
													</c:when>
													<c:when test="${book.rentchk=='1'}">
														<td align="center"><mark>대출요청중</mark></td>
														<td><button class="btn btn-default btn-sm"
																type="button" id="modifybook"
																onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
															<button class="btn btn-default btn-sm" type="button"
																id="deletebook"
																onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
														</td>
													</c:when>
													<c:when test="${book.rentchk=='2'}">
														<td align="center">대출중</td>
														<td><button class="btn btn-default btn-sm"
																type="button" id="modifybook"
																onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
															<button class="btn btn-default btn-sm" type="button"
																id="deletebook"
																onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
														</td>
													</c:when>
													<c:when test="${book.rentchk=='4'}">
														<td align="center"><mark>대출정지</mark></td>
														<td><button class="btn btn-default btn-sm"
																type="button" id="modifybook"
																onClick="location.href='/recoverBook?book_cd=${book.book_cd}'">대출재개</button></td>
													</c:when>
													<c:when test="${book.rentchk=='5'}">
														<td align="center"><mark>예약중</mark></td>
														<td><button class="btn btn-default btn-sm"
																type="button" id="modifybook"
																onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
															<button class="btn btn-default btn-sm" type="button"
																id="deletebook"
																onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
														</td>
													</c:when>
													<c:otherwise>
														<td></td>
														<td></td>
													</c:otherwise>
												</c:choose>


											</tr>

										</c:forEach>
									</tbody>

								</table>
							</div>

						</form>



					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/metisMenu.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').dataTable({
				"pageLength" : 100,
				paging : true,
				searching : false,
				"order" : [],
				"columns" : [ {
					"searchable" : false
				}, null, null, {
					"searchable" : false
				}, {
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
				}, null, null ]
			});
		});

		var loadingBar = document.getElementById("loadingBar");
		var divLoadBody = document.getElementById("divLoadBody");

		divLoadBody.style.display = "";
		loadingBar.style.display = "none";
	</script>

</body>
</html>