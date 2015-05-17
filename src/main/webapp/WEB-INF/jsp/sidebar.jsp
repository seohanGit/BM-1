<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- /.row -->

<div>

	<h3>신간도서</h3>

	<c:forEach items="${newbook}" var="newbook" begin="0" end="2" step="1"
		varStatus="status">
		<hr>
		<div align="center">
			<div class="thumbnail" align="left" style="height: 90px; width: 60px">
				<img src="${newbook.imageurl}" height="100%" width="100%">
			</div>
			<div align="left">
				<p class="caption">
					<a href="${newbook.link}">${newbook.title}</a>
				</p>
				<p class="caption">${newbook.author}</p>
				<p class="caption">입고일 : ${newbook.rcv_date}</p>
			</div>
		</div>
		<hr>
	</c:forEach>

</div>
