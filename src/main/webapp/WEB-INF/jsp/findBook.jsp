<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/resources/js/jquery/jquery.js"></script>
<script type="text/javascript">
	function request(){
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

					<p>${book.writer}|${book.priceSales}</p>

					<button class="btn btn-default" type="button" id="requestbook"
						onClick="location.href='/requestbook?bookname=${book.bookname}&booknum=${book.booknum}&
						genre=${book.genre}&writer=${book.writer}&publisher=${book.publisher}&
						imageurl=${book.imageurl}'">구매</button>


				</td>

			</tr>


		</tbody>
	</table>

</c:forEach>
