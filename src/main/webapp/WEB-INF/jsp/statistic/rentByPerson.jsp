<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<table class="highchart table table-bordered"
	data-graph-container-before="1" data-graph-inverted="0"
	data-graph-type="column" style="display: show">
	<caption>개인별 대여순위</caption>

	<thead>
		<tr>
			<th class="td-title"></th>
			<th class="td-img">대여권수</th>

		</tr>
	</thead>
	<tbody>

		<c:forEach items="${bestPerson }" var="bestPerson">
			<tr>

				<td>${bestPerson.team_nm}${bestPerson.kname}</td>
				<td>${bestPerson.count}</td>

			</tr>
		</c:forEach>
	</tbody>
</table>