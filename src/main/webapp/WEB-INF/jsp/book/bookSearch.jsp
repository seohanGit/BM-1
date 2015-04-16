<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row row-offcanvas row-offcanvas-right ">

	<div id="searchResultArea">
		<hr>
		<h2>도서검색 목록</h2>
		<hr>


		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<td id="td-img">표지</td>
					<td id="td-title">도서명</td>
					<td id="td-author">저자</td>
					<td id="td-genre">장르</td>
					<td id="td-author">출판사</td>
					<td id="td-author">대여상태</td>
					<td id="td-empty"></td>
				</tr>
			</thead>
			<%-- 
						
 --%>
			<c:forEach items="${bookList}" var="book" begin="0" end="49" step="1"
				varStatus="loop">
				<tbody>


					<tr>
						<td rowspan="3" style="width: 50px" align="left"><img
							style="width: 50px" src="${book.imageurl}"></td>
					</tr>
					<tr>
						<td align="left">${book.bookname }</td>
						<td align="left">${book.writer }</td>
						<td align="left">${book.genre}</td>
						<td align="left">${book.publisher}</td>
						<td align="left"><c:choose>
								<c:when test="${book.borrowcheck=='0'}">
									<mark>대출가능</mark>
									<td align="left"><button class="btn btn-default"
											type="button" id="borrowbook"
											onClick="location.href='/borrowbook?bookCode=${book.bookCode}'">대출</button></td>
								</c:when>

								<c:when test="${book.borrowcheck=='1'}">
			대여요청중 	<td><button class="btn btn-default" type="button"
											id="reservebook"
											onClick="location.href='/reservation?bookCode=${book.bookCode}'">예약</button></td>
								</c:when>
								<c:when test="${book.borrowcheck=='2'}">
			대출중 	<td><button class="btn btn-default" type="button"
											id="reservebook"
											onClick="location.href='/reservation?bookCode=${book.bookCode}'">예약</button></td>
								</c:when>
								<c:when test="${book.borrowcheck=='4'}">
			대출정지<td></td>
								</c:when>
								<c:when test="${book.borrowcheck=='5'}">
			예약중<td></td>
								</c:when>
							</c:choose></td>

					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
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