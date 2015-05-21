<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="bestPerson" class="right">
		<table class="highchart table table-bordered"
			data-graph-container-before="1" data-graph-type="column"
			style="display: show">
			<caption>���� �뿩��Ȳ</caption>

			<thead>
				<tr>
					<th class="td-title">��</th>
					<th class="td-img">�뿩�Ǽ�</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${selectGroupByMonth }" var="selectGroupByMonth"
					begin="0" end="11">
					<tr>

						<td>${selectGroupByMonth.month}��</td>
						<td>${selectGroupByMonth.count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
