
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
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
						<td class="hidden-xs hidden-sm hidden-md" >${book.author }</td>
						<td class="hidden-xs hidden-sm " >${book.publish}</td>
						<td class="hidden-xs " >${book.b_group }</td>
						<c:choose>
							<c:when test="${book.rentchk=='0'}">
								<td ><mark>대출가능</mark></td>
								<td ><button class="btn btn-default borrow"
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
				"bSort" : false,
				"pageLength" : 10,
				paging : true,
				searching : false,
				"columns" : [ null, null, null, {
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

		$('.selectpicker').selectpicker();
	</script>