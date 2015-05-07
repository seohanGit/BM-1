<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>베스트 셀러</h3>
<c:forEach items="${bestseller}" var="book" begin="0" end="2" step="1"
	varStatus="status">

	<div class="row " align="center">
		<div class="thumbnail" align="left"
			style="max-height: 150px; max-width: 100px">
			<img src="${book.imageurl}" height="100%" width="100%">
		</div>
		<div align="left">
			<p class="caption">${book.title}</p>
			<p class="caption">${book.author}</p>
			<p class="caption">${book.b_group}</p>
		</div>
	</div>
	<hr>
</c:forEach>