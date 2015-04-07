<%@page import="com.baron.member.model.BookModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/jquery/book.js"></script>
<script type="text/javascript">
	function request() {
		alert("구매요청되엇습니다.");
	}
</script>
<c:forEach items="${bookList}" var="book" varStatus="status">

	<table width="100%" border="10px" bordercolor="#fff">

		<tbody>

			<tr>

				<td width="115px" style="margin: 10px"><span class="goods_cnt"></span>
					
					<img src="${book.imageurl}" width="95px" height="150px"></td>
				<td class="goods_infogrp" align="left" style="margin-left: 10px">

					<p>
						<a href="${book.link}">${book.bookname}</a>
					</p>

					<p>${book.writer} | ${book.priceSales}원</p>
					<form action="requestbook" method="get">
					<input type="hidden" value="${book.isbn}" name="isbn">
					<input type="number" name="quantity" placeholder="구매 수량">
						<button class="btn btn-default" type="submit" id="requestbook">구매</button>

					</form>

				
					<%-- 
					<button class="btn btn-default" type="button" id="requestbook"
						onClick="location.href='/requestbook?isbn=${book.isbn}'">구매</button>
					&writer=${book.writer}&publisher=${book.publisher}&imageurl=${book.imageurl}
 --%>

				</td>

			</tr>

		</tbody>
	</table>

</c:forEach>
