<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div  class="chart-wrap">
	<table class="highchart" data-graph-container-before="1"
		data-graph-type="column" style="display: none"
		data-graph-container="#graphcontainer" data-graph-datalabels-enabled="1">
		<caption>���� ���� �뿩��Ȳ</caption>

		<thead>
			<tr>
				<th>�μ���</th>
				<th >�뿩�Ǽ�</th>
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
<div class="table-wrap" >
	<table class=" table table-bordered"  >
		<caption>���� ���� �뿩��Ȳ</caption>
		<thead>
			<tr>
				<th>�μ���</th>
				<th >�뿩�Ǽ�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${teamCount }" var="teamCount">
				<tr>
					<td>${teamCount.team_nm}</td>
					<td class="td-count">${teamCount.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>