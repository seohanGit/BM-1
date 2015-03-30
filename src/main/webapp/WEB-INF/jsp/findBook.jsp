<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${bookList}" var="book" varStatus="status">
	
	<table width="100%" border="10px" bordercolor="#fff">
		<tbody>
			<tr>
			
				<td><span class="goods_cnt"></span> <img
					src="${book.imageurl}" width="95px" height="170px"></td>
				<td class="goods_infogrp">
				
					<p><a href="${book.link}">${book.bookname}</a></p>
					
					<p>${book.writer}    |    ${book.priceSales}</p>

					<button class="btn btn-default" type="button" id="buybook"
						onClick="location.href='/buybook?${book}'">구매</button>

					
				</td>
			
			</tr>


		</tbody>
	</table>
</c:forEach>
<script>
	
</script>