<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<table class="table table-striped ">
	<thead>
		<tr>
			<td width="12%">표지</td>
			<td width="15%">도서명</td>
			<td width="13%">저자</td>
			<td width="10%">장르</td>

			<td width="16%">대여상태</td>
			<td width="60px"></td>
		</tr>
	</thead>
	<%-- 
						
 --%>
	<c:forEach items="${bookList}" var="book" varStatus="loop">
		<tbody>


			<tr>
				<td rowspan="2" style="max-width: 80%" align="left"><img
					src="${book.imageurl}"></td>
			</tr>
			<tr>
				<td width="30%" align="left">${book.bookname }</td>
				<td width="20" align="left">${book.writer }</td>
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
				<td>
					<button class="btn btn-default" type="button" id="borrowbook"
						onClick="location.href='/borrowbook?bookCode=${book.bookCode}'">대출</button>
					<button class="btn btn-default" type="button" id="returnbook"
						onClick="location.href='/returnbook?bookCode=${book.bookCode}'">반납</button>
					<button class="btn btn-default" type="button" id="reservebook"
						onClick="location.href='/reservation?bookCode=${book.bookCode}'">예약</button>

				</td>
			</tr>
			<tr>
				<td width="20%" align="left">${book.bookname }</td>
				<td width="10%" align="left">${book.writer }</td>
				<td width="10%" align="left">${book.genre}</td>
				<td width="10%" align="left"></td>
			</tr>
		</tbody>
	</c:forEach>
</table>
<script src="/resources/js/common.js"></script>
<script>
	
</script>