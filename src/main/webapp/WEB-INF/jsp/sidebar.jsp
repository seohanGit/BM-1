<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- /.row -->

<div>
	<h3>Best 사원</h3>
	<c:forEach items="${bestMember}" var="best" begin="0" end="2">

		<table style="width: 100%">
			<tr>
				<td style="width: 35%"><strong>${best.team_nm}</strong></td>
				<td id="tb-genre">${best.kname}</td>
				<td style="width: 35%">대출 : <mark>${best.count}</mark></td>
			</tr>
		</table>
	</c:forEach>
	
	
</div>
