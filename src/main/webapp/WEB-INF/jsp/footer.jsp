<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div>
	<h3>Best 도서</h3>
	<c:forEach items="${bestBook}" var="best" begin="0" end="2">

		<table style="width: 100%">
			<tr>
				<td style="width: 35%"><strong>${best.title}</strong></td>
				<td id="tb-genre">${best.author}</td>
				<td style="width: 35%">대출 : <mark>${best.score}</mark></td>
			</tr>
		</table>
	</c:forEach>

	<h3>Best 부서</h3>
	<c:forEach items="${bestTeam}" var="team" begin="0" end="2">

		<table style="width: 100%">
			<tr>

				<td style="width: 70%">대출 : <mark>${team.score}</mark></td>
				<td style="width: 20%"><strong>${team.team_nm}</strong></td>
			</tr>
		</table>
	</c:forEach>
<%-- 
	<h3>회원 Top 3</h3>
	<c:forEach items="${bestBook}" var="book" begin="0" end="2">

		<table style="width: 100%">
			<tr>
				<td style="width: 35%"><strong>${book.team_nm}</strong></td>
				<td id="tb-genre">${book.kname}</td>
				<td style="width: 35%">대출 : <mark>${book.score}</mark></td>
			</tr>
		</table>
	</c:forEach>
 --%>

	<!-- /.col-lg-6 -->

	<!-- /.row -->
	<%-- 


	<h3>베스트 셀러</h3>
	<hr>
	<c:forEach items="${bestseller}" var="book" begin="0" end="2" step="1"
		varStatus="status">
		<hr>
		<div align="center">
			<div class="thumbnail" align="left" style="height: 90px; width: 60px">
				<img src="${book.imageurl}" height="100%" width="100%">
			</div>
			<div align="left">
				<p class="caption">
					<a href="${book.link}">${book.title}</a>
				</p>
				<p class="caption">${book.author}</p>
				<p class="caption">대출횟수 :회</p>
			</div>
		</div>
		<hr>
	</c:forEach>

 --%>
</div>