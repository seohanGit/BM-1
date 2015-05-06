<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<!-- Blog Entries Column -->
		<div class="col-md-8">
			<h2>도서검색 목록</h2>
			<hr>
			<table class="table table-striped  table-bordered " id="dataTable">
				<thead>
					<tr>

						<th id="td-img">표지</th>
						<th id="td-author">도서명</th>
						<th id="td-author">저자</th>
						<th>대여상태</th>
						<th width="230px"></th>

						<td id="tb-img">표지</td>
						<td id="tb-author">도서명</td>
						<td id="tb-author">저자</td>


						<td width="90px">대여상태</td>
						<td width="230px"></td>

					</tr>
				</thead>
				<%-- 
						
 --%>
				<tbody>
					<c:forEach items="${bookList}" var="book" varStatus="loop">
						<tr>

							<td style="width: 40px" align="left"><img
								style="width: 40px" src="${book.imageurl}"></td>


							<td align="left">${book.title }</td>
							<td align="left">${book.author }</td>

							<c:choose>
								<c:when test="${book.borrowchk=='0'}">
									<td align="left">대출가능</td>
									<td>
										<button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/stopBorrow?bookCode=${book.book_cd}'">대출정지</button>
										<button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.borrowcheck=='1'}">
									<td><mark>대여요청중</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.borrowcheck=='2'}">
									<td>대출중</td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.borrowcheck=='4'}">
									<td><mark>대출정지</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/recoverBook?book_cd=${book.book_cd}'">대출재개</button></td>
								</c:when>
								<c:when test="${book.borrowcheck=='5'}">
									<td><mark>예약중</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?book_cd=${book.book_cd}'">도서수정</button>
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

		</div>
	</div>
</div>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/jquery.dataTables.min.js"></script>
<script src="/resources/js/dataTables.bootstrap.min.js"></script>
<script>
	$(document).ready(function() {

		$('#dataTable').DataTable({
			"pageLength" : 10,
			paging : true,
			ordering : true,
			"columns" : [ {
				"searchable" : false
			}, null, null, {
				"searchable" : false
			}, {
				"searchable" : false
			} ],

		});
	});
</script>
