<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- /.row -->
<br>
<br>
<br>
<br>
<div>
	<h3>Best ���</h3>
	<table class="table table-nobordered table-admin" cellpadding="3px" style="width: 100%">
		<c:forEach items="${bestMember}" var="best" begin="0" end="2">

			<tr class="table-admin">
				<td style="width: 35%"><strong>${best.team_nm}</strong></td>
				<td id="tb-genre">${best.kname}</td>
				<td style="width: 35%">���� : <mark>${best.count}</mark></td>
			</tr>
		</c:forEach>
	</table>


</div>
