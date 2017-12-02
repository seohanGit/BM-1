<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<table id="chart" class="highchart" data-graph-container-before="1"
	data-graph-type="column" style="display: none;">
	<caption>���� �뿩 ��Ȳ</caption>

	<thead>
		<tr>
			<th class="td-title">��</th>
			<th class="td-date">�뿩�Ǽ�</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${rentByMonth }" var="rentByMonth" begin="0"
			end="11">
			<tr>

				<td>${rentByMonth.month}��</td>
				<td>${rentByMonth.count}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="table-bottom" style="float: right; display: inline">
	<table id="table" class="table table-bordered">
		<caption>���� �뿩 ��Ȳ</caption>

		<thead>
			<tr>
				<c:forEach items="${rentByMonth }" var="rentByMonth" begin="0"
					end="11">

					<th>${rentByMonth.month}��</th>

				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach items="${rentByMonth }" var="rentByMonth" begin="0"
					end="11">

					<td class="td-count">${rentByMonth.count}��</td>

				</c:forEach>
			</tr>
		</tbody>
	</table>
</div>
