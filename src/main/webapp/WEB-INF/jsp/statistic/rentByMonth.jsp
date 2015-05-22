<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<table class="highchart table table-bordered"
	data-graph-container-before="1" data-graph-type="column"
	style="display: none">
	<caption>연간 대여 현황</caption>

	<thead>
		<tr>
			<th class="td-title">월</th>
			<th class="td-img">대여권수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${rentByMonth }" var="rentByMonth"
			begin="0" end="11">
			<tr>

				<td>${rentByMonth.month}월</td>
				<td>${rentByMonth.count}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

