<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${bookList}" var="book" varStatus="status">

	<table width="100%" border="10px" bordercolor="#fff">
		<tbody>
			<tr>

				<td width="115px" style="margin: 10px"><span class="goods_cnt"></span>
					<img src="${book.imageurl}" width="95px" height="170px"></td>
				<td class="goods_infogrp" align="left" style="margin-left: 10px">

					<p>
						<a href="${book.link}">${book.bookname}</a>
					</p>

					<p>${book.writer} | ${book.priceSales}원</p>
					<form action="requestbook" method="get">
					<input type="hidden" value="${book.isbn}" name="isbn">
					<input type="number" name="quantity" value="1">
						<button class="btn btn-default" type="submit" id="requestbook">구매</button>

					</form>
				</td>

			</tr>


		</tbody>
	</table>

</c:forEach>
