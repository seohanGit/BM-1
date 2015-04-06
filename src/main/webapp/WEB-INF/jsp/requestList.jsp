<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped">
	<thead>
		<tr>
			<td>표지</td>
			<td>아이디</td>
			<td>가격</td>
			<td>저자</td>
			<td>출판사</td>
			<td>장르</td>
			<td>요청일자</td>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${bookList}" var="book" varStatus="status">
			<form action="/requestOk" method="post">
				<input type="hidden" value="${book.imageurl}"> <input
					type="hidden" value="${book.requestid}"> <input
					type="hidden" value="${book.priceSales}"> <input
					type="hidden" value="${book.writer}"> <input type="hidden"
					value="${book.publisher}"> <input type="hidden"
					value="${book.genre}"> <input type="hidden"
					value="${book.requestDate}">
				<tr>
					<td><img src="${book.imageurl}"></td>
					<td>${book.requestid}</td>
					<td>${book.priceSales}</td>
					<td>${book.writer}</td>
					<td>${book.publisher}</td>
					<td>${book.genre}</td>
					<td>${book.requestDate}</td>
					<td><button type="submit"> 승인 </button>
				</tr>
			</form>
		</c:forEach>
	</tbody>
</table>
