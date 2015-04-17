<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="/resources/css/index.css" rel="stylesheet">
</head>
<body>
	<h3>베스트 회원 Top 3</h3>
	<br>
	<div>

		<div align="center">
			<c:forEach items="${bestList}" var="best" begin="0" end="2">
				<div align="left" style="padding-left: 10px">
					<table style="width: 100%">
						<tr>
							<td style="width: 40%"><strong>${best.id}</strong></td>
							<td id="tb-genre">${best.name}<strong>${best.score}점</strong></td>
							<td style="width: 30%">대출 : <mark>${best.numborrow}</mark></td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>

		<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->
	<h3>신간도서</h3>
	<hr>
	<c:forEach items="${newbook}" var="newbook" begin="0" end="2" step="1"
		varStatus="status">
		<hr>
		<div align="center" >
			<div class="thumbnail" align="left" style="height: 90px; width: 60px">
				<img src="${newbook.imageurl}" height="100%" width="100%">
			</div>
			<div align="left">
				<p class="caption">
					<a href="${newbook.link}">${newbook.bookname}</a>
				</p>
				<p class="caption">${newbook.writer}</p>
				<p class="caption">${newbook.genre}</p>
			</div>
		</div>
		<hr>
	</c:forEach>
	<h3>베스트 셀러</h3>
	<hr>
	<c:forEach items="${bestseller}" var="book" begin="0" end="2" step="1"
		varStatus="status">
		<hr>
		<div  align="center">
			<div class="thumbnail" align="left" style="height: 90px; width: 60px">
				<img src="${book.imageurl}" height="100%" width="100%">
			</div>
			<div align="left">
				<p class="caption">
					<a href="${book.link}">${book.bookname}</a>
				</p>
				<p class="caption">${book.writer}</p>
				<p class="caption">${book.genre}</p>
			</div>
		</div>
		<hr>
	</c:forEach>
</body>
</html>