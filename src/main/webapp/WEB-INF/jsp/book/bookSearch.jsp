<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="row row-offcanvas row-offcanvas-right ">

			<div id="searchResultArea">
				<hr>
				<h2>도서검색 목록</h2>
				<hr>


				<table class="table table-striped ">
					<thead>
						<tr>
							<td width="8%">표지</td>
							<td>도서명</td>
							<td>저자</td>
							<td>장르</td>

							<td>대여상태</td>
							<td width="60px"></td>
						</tr>
					</thead>
					<%-- 
						
 --%>
					<c:forEach items="${bookList}" var="book" varStatus="loop">
						<tbody>


							<tr>
								<td rowspan="3" width="8%" align="left"><img
									src="${book.imageurl}"></td>
							</tr>
							<tr>
								<td width="35%" align="left">${book.bookname }</td>
								<td width="20%" align="left">${book.writer }</td>
								<td width="15%" align="left">${book.genre}</td>
								<td width="15%" align="left"><c:choose>
										<c:when test="${book.borrowcheck=='0'}">
			대출가능</c:when>

										<c:when test="${book.borrowcheck=='1'}">
			대여요청중</c:when>
										<c:when test="${book.borrowcheck=='2'}">
			대출중</c:when>
										<c:when test="${book.borrowcheck=='4'}">
			대출정지</c:when>
										<c:when test="${book.borrowcheck=='5'}">
			예약중</c:when>
									</c:choose></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td width="10%" align="left"><button
										class="btn btn-default" type="button" id="borrowbook"
										onClick="location.href='/borrowbook?bookCode=${book.bookCode}'">대출</button></td>
								<td width="10%" align="left">
									<button class="btn btn-default" type="button" id="returnbook"
										onClick="location.href='/returnbook?bookCode=${book.bookCode}'">반납</button>
								</td>
								<td width="10%" align="left">
									<button class="btn btn-default" type="button" id="reservebook"
										onClick="location.href='/reservation?bookCode=${book.bookCode}'">예약</button>
								</td>
							</tr>


						</tbody>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>
	</div>


	<script src="/resources/js/common.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
		function reserve() {
			alert("예약되었습니다.");
		}
	</script>
</body>
</html>