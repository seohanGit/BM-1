<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- /.row -->
<br>
<br>
<div>
	<h3>����Ʈ ���</h3>
	<table class="table table-nobordered table-admin" cellpadding="3px"
		style="width: 100%">
		<tr class="table-admin">
			<th style="width: 60%"><strong>�μ���</strong></th>
			<th>����</th>
			<th>�뿩Ƚ��</th>
		</tr>
		<c:forEach items="${bestMember}" var="best" begin="0" end="2">

			<tr class="table-admin">
				<td style="width: 50%"><strong>${best.team_nm}</strong></td>
				<td style="width: 70px">${best.kname}</td>
				<td style="text-align: right; width: 90px"><mark>${best.count}ȸ</mark></td>
			</tr>
		</c:forEach>
	</table>
	<h3>����Ʈ �μ�</h3>

	<c:forEach items="${bestTeam}" var="team" begin="0" end="4">
		<div class="progress">
			<div class="progress-bar progress-bar-info" role="progressbar"
				style="width: ${team.count/team.max*100}%">${team.team_nm}-
				${team.count}��&nbsp;</div>
		</div>

	</c:forEach>
</div>

