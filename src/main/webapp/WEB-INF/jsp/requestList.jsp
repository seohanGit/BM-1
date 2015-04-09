<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped ">
	<thead>
		<tr class="hidden-xs">
			<td width="80px">표지</td>
			<td width="15%">도서명</td>
			<td width="9%">가격</td>
			<td width="6%">수량</td>
			<td width="13%">저자</td>
			<td width="12%">장르</td>
			<td width="8%">아이디</td>
			<td width="12%">요청일자</td>
			<td width="60px"></td>
		</tr>
	</thead>


	<c:forEach items="${bookList}" var="book" varStatus="status">
		<tbody class="visible-xs-block">
			<tr>
				<td rowspan="4" style="max-width: 100px" align="left"><img
					src="${book.imageurl}"></td>
			</tr>
			<tr>
				<td width="40%" align="left">${book.bookname }</td>
				<td width="30%" align="left">${book.writer }</td>
				<td width="20%" align="right"></td>
			</tr>
			<tr>
				<td>${book.genre}</td>
				<td>요청자 : ${book.id}</td>
				<td>
					<button class="btn btn-default" type="button"
						onClick="location.href='${book.link}'">구매</button>
				</td>
			</tr>
			<tr>
				<td>${book.priceSales}원</td>
				<td>수량 : ${book.quantity}</td>
				<td>
					<button class="btn btn-default" type="button"
						onClick="location.href='deleteRequest?bookCode=${book.bookCode}'; del();">삭제</button>
				</td>
			</tr>
		</tbody>


		<tbody>
			<tr class="hidden-xs">
				<td width="80px"><img src="${book.imageurl}"
					style="width: 100%"></td>
				<td>${book.bookname }</td>
				<td>${book.priceSales}원</td>
				<td>${book.quantity}</td>
				<td>${book.writer}</td>
				<td>${book.genre}</td>
				<td>${book.id}</td>
				<td>${book.requestdate}</td>
				<td><button class="btn btn-default" type="button" id="buyBook"
						onClick="location.href='${book.link}'">구매</button>
					<button class="btn btn-default" type="button"
						onClick="location.href='deleteRequest?bookCode=${book.bookCode}'; del();">삭제</button></td>

			</tr>
		</tbody>
	</c:forEach>

</table>
<script>
	function del() {
		alert("삭제되었습니다.");
	}
	
</script>