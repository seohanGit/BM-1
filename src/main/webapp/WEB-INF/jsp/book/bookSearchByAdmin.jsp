<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<!-- Blog Entries Column -->
		<div class="col-md-8">
			<h2>도서검색 목록</h2>
			<hr>
			<c:forEach items="${bookList}" var="book" varStatus="loop">

				<table width="100%">
					<tbody>
						<tr>
							<td width="115px" style="margin: 10px" class="goods_img"><span
								class="goods_cnt"></span> <img src="${book.imageurl}"
								width="95px" height="150px"></td>
							<td class="goods_infogrp">
								<p>${book.isbn}| ${book.bookname}</p>
								<p>${book.writer}| ${book.publisher}|</p>
								<p>${book.genre}
									|
									<c:choose>
										<c:when test="${empty book.reservecheck}"> 예약 가능</c:when>
										<c:otherwise> 예약 중</c:otherwise>
									</c:choose>
								<p>

									<button class="btn btn-default" type="button" id="reservebook"
										onClick="location.href='/reservation?bookCode=${book.bookCode}'">대출
										정지</button>

									<button class="btn btn-default" type="button" id="modifybook"
										onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
									<button class="btn btn-default" type="button" id="deletebook"
										onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>

								</p>
							</td>
						</tr>


					</tbody>
				</table>
			</c:forEach>
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
