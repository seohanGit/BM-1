<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width:35%; float:left">
	<table id="bookCount" class="highchart" data-graph-container-before="1"
		data-graph-type="pie" style="display: none"
		data-graph-container="#graphcontainer">
		<caption>분류별 보유현황</caption>

		<thead>
			<tr>
				<th></th>
				<th>보유권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookCount }" var="bookCount">
				<tr>
					<td>${bookCount.b_group}</td>
					<td>${bookCount.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div style="width:65%; float: right;" >
	<table class="highchart" data-graph-container-before="1"
		data-graph-type="column" style="display: none"
		data-graph-container="#graphcontainer">
		<caption>팀별 연간 대여현황</caption>

		<thead>
			<tr>
				<th></th>
				<th>대여권수</th>
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