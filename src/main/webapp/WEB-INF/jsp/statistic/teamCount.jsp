<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div class="left">
	<table class="highchart" data-graph-container-before="1"
		data-graph-type="column" style="display: none"
		data-graph-container="#graphcontainer">
		<caption>팀별 연간 대여현황</caption>

		<thead>
			<tr>
				<th>부서명</th>
				<th class="td-author">대여권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${teamCount }" var="teamCount">
				<tr>
					<td>${teamCount.team_nm}</td>
					<td>${teamCount.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="right" style="margin-top: 40px">
	<table class=" table table-bordered"  >
		<caption>팀별 연간 대여현황</caption>
		<thead>
			<tr>
				<th ></th>
				<th class="td-genre">대여권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${teamCount }" var="teamCount">
				<tr>
					<td>${teamCount.team_nm}</td>
					<td>${teamCount.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>