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
<<<<<<< HEAD
=======

>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc
		<tbody>

			<tr>

				<td width="115px" style="margin: 10px"><span class="goods_cnt"></span>
<<<<<<< HEAD
					<img src="${book.imageurl}" width="95px" height="170px"></td>
=======
					<img src="${book.imageurl}" width="95px" height="150px"></td>
>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc
				<td class="goods_infogrp" align="left" style="margin-left: 10px">

					<p>
						<a href="${book.link}">${book.bookname}</a>
					</p>

<<<<<<< HEAD
					<p>${book.writer} | ${book.priceSales}원</p>
					<form action="requestbook" method="get">
					<input type="hidden" value="${book.isbn}" name="isbn">
					<input type="number" name="quantity" value="1">
						<button class="btn btn-default" type="submit" id="requestbook">구매</button>

					</form>
=======
					<p>${book.writer}|${book.priceSales}</p>
					<button type="button" id="btn_request" class="btn btn-default"
						onClick="location.href='/requestbook?isbn=${book.isbn}'; request(); ">구매</button>
					<%-- 
					<button class="btn btn-default" type="button" id="requestbook"
						onClick="location.href='/requestbook?isbn=${book.isbn}'">구매</button>
					&writer=${book.writer}&publisher=${book.publisher}&imageurl=${book.imageurl}
 --%>
>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc
				</td>

			</tr>

		</tbody>
	</table>

</c:forEach>
