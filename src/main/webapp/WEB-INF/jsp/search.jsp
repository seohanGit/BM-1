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
						<c:choose>
							<c:when test="${book.borrowcheck eq '1'}"> 대여중</c:when>
							<c:otherwise> 대여가능</c:otherwise>
						</c:choose>
					</p>
					<p>${book.genre}
						|
						<c:choose>
							<c:when test="${empty book.resernum}"> 예약 가능</c:when>
							<c:otherwise> 예약 중</c:otherwise>
						</c:choose>
					<p>
						<button class="btn btn-default" type="button" id="reservebook"
							onClick="location.href='/borrow?booknum=${book.booknum}'">대출</button>
						<button class="btn btn-default" type="button" id="reservebook"
							onClick="location.href='/return?booknum=${book.booknum}'">반납</button>
						<button class="btn btn-default" type="button" id="reservebook"
							onClick="location.href='/reservation?booknum=${book.booknum}'">예약</button>
						<button class="btn btn-default" type="button" id="modifybook"
							onClick="location.href='/modifyBookForm?booknum=${book.booknum}'">도서수정</button>
						<button class="btn btn-default" type="button" id="deletebook"
							onClick="location.href='/deletebook?booknum=${book.booknum}'; del();">도서삭제</button>

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