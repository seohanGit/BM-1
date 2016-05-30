<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div style="margin-left: 10px">

	<h3>����Ʈ ����</h3>

	<table class="table-admin table table-striped "
		style="width: 100%; table-layout: fixed;">
		<tr class="table-admin">
			<th style="width: 60%"><strong>������</strong></th>
			<th class="hidden-xs">����</th>
			<th style="text-align: right;; width: 90px">�뿩Ƚ��</th>
		</tr>
		<c:forEach items="${bestBook}" var="best" begin="0" end="4">
			<tr class="table-admin">
				<td class="td-title" style="width: 60%"><strong>${best.title}</strong></td>
				<td class="hidden-xs"
					style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">${best.author}</td>
				<td style="text-align: right;; width: 90px"><mark>${best.count}
						ȸ</mark></td>
			</tr>
		</c:forEach>
	</table>


	<%-- 	
	<table class="table table-striped " style="width: 100%">
		<c:forEach items="${bestTeam}" var="team" begin="0" end="4">
			<tr class="table-admin">

				<td style="width: 70%">���� : <mark>${team.count}</mark></td>
				<td style="width: 15%"><strong>${team.team_nm}</strong></td>
			</tr>

		</c:forEach>
	</table>

	<h3>ȸ�� Top 3</h3>
	<c:forEach items="${bestBook}" var="book" begin="0" end="2">

		<table style="width: 100%">
			<tr> 
				<td style="width: 35%"><strong>${book.team_nm}</strong></td>
				<td id="tb-genre">${book.kname}</td>
				<td style="width: 35%">���� : <mark>${book.score}</mark></td>
			</tr>
		</table>
	</c:forEach>
 --%>

	<!-- /.col-lg-6 -->

	<!-- /.row -->
	<%-- 


	<h3>����Ʈ ����</h3>
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
				<p class="caption">����Ƚ�� :ȸ</p>
			</div>
		</div>
		<hr>
	</c:forEach>

 --%>
</div>