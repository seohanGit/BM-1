<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<table class="highchart table table-bordered"
	data-graph-container-before="1" data-graph-type="line"
	style="display: none">
	<caption>���� �뿩��Ȳ</caption>

	<thead>
		<tr>
			<th class="td-title">��</th>
			<th class="td-img">�뿩�Ǽ�</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${rentByMonth }" var="rentByMonth"
			begin="0" end="11">
			<tr>

				<td>${rentByMonth.month}��</td>
				<td>${rentByMonth.count}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

