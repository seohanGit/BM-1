<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div class="chart-wrap">
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-inverted="0"
		data-graph-type="column" style="display: none" data-graph-datalabels-enabled="1">
		<caption>���κ� �뿩����</caption>
		<thead>
			<tr>
				<th class="td-title"></th>
				<th class="td-img">�뿩�Ǽ�</th>
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
</div>
<div class="table-wrap">
	<table class="table table-bordered">
		<caption>���κ� �뿩����</caption>
		<thead>
			<tr>
				<th class="td-title">�뿩��</th>
				<th >�뿩�Ǽ�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bestPerson }" var="bestPerson">
				<tr>
					<td>${bestPerson.team_nm}${bestPerson.kname}</td>
					<td class="td-count">${bestPerson.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>