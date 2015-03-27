<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${bookList}" var="book" varStatus="status">
	${status.index+1}번째 : ${book.bookname }
	<table width="100%" border="10px" bordercolor="#fff">
		<tbody>
			<tr>
				<td class="goods_img"><span class="goods_cnt"></span> <img
					src="${book.imageurl}" width="95px"></td>
				<td class="goods_infogrp">
					<p><a href="${book.link}">${book.bookname}</a></p>
					
					<p>${book.writer}  |  ${book.priceSales}</p>

					<button class="btn btn-default" type="button" id="borrowbook"
						onClick="location.href='/borrow?booknum=${book.booknum}'">구매</button>

					
				</td>
			</tr>


		</tbody>
	</table>
</c:forEach>
<script>
	
</script>