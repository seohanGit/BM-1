<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>대여현황 목록</h2>
	<div class="form-group">
		<hr>
		<c:forEach items="${bookList}" var="book" varStatus="loop">

			<table width="100%">

				<tbody>

					<tr>
						<td><input type="checkbox" value="${book.bookCode}"></td>
						<td class="goods_img"><span class="goods_cnt"></span> <img
							src="${book.imageurl}" width="95px" height="170px"></td>
						<td class="goods_infogrp">
							<p>${book.isbn}|${book.bookname}</p>
							<p>${book.writer}|${book.publisher}|</p>
							<p>${book.genre}|${book.id}</p>
							<p>${book.borrowdate}|${book.returndate}
							<p>${book.borrowcheck}
								== 1 then 대여요청 ==2 대여 중
								<button class="btn btn-default" type="button" id="reservebook"
									onClick="location.href='/confirmBorrowBook?bookCode=${book.bookCode}'">승인</button>

							</p>
						</td>
					</tr>
				</tbody>

			</table>

		</c:forEach>
	</div>
	<hr>
	
<script>
	function del() {
		alert("승인되었습니다.");
	}
</script>