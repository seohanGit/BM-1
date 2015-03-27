<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${bookList}" var="book" varStatus="status">

	<table width="100%" border="10px" bordercolor="#fff">
		<tbody>
			<tr>
				<td class="goods_img"><sapn class="goods_cnt"></sapn> <img
					src="${book.imageurl}" width="95px"></td>
				<td class="goods_infogrp">
					<p>${book.link}|${book.bookname}</p>
					<p>${book.writer}|${book.priceSales}</p>
					
						<button class="btn btn-default" type="button" id="borrowbook"
							onClick="location.href='/borrow?booknum=${book.booknum}'">대출</button>
					
					</p>
				</td>
			</tr>

			</c:forEach>
		</tbody>
	</table>
	<script>
	</script>