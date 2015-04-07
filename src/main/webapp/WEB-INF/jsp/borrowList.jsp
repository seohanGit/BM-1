<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${bookList}" var="book" varStatus="loop">

	<table width="100%">
		<tbody>
			<tr>
				<td class="goods_img"><span class="goods_cnt"></span> <img
					src="${book.imageurl}" width="95px" height="170px"></td>
				<td class="goods_infogrp">
					<p>${book.booknum}|${book.bookname}</p>
					<p>
						${book.writer} | ${book.publisher} |
						
					</p>
					<p>${book.genre}	|
						
					<p>
						<button class="btn btn-default" type="button" id="reservebook"
							onClick="location.href='/borrowbook?booknum=${book.booknum}'">대출</button>
						<button class="btn btn-default" type="button" id="reservebook"
							onClick="location.href='/returnbook?booknum=${book.booknum}'">반납</button>
					
					</p>
				</td>
			</tr>


		</tbody>
	</table>
</c:forEach>
<script>
	function del() {
		alert("삭제되었습니다.");
	}
	function reserve() {
		alert("예약되었습니다.");
	}
</script>