<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div id="bestPerson" class="right">
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="column">
		<caption>���� ������Ȳ</caption>

		<thead>
			<tr>
				<th class="td-title"></th>
				<th class="td-img">��뿹��</th>
				<th data-graph-type="line">��밡�ɿ���</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SumPurchase }" var="SumPurchase" begin="0"
				end="11" varStatus="status">
				<tr>

					<td>${status.index+1}��</td>
					<td><c:if test="${status.index+1 == SumPurchase.month}">
							${SumPurchase.price}
						</c:if></td>
					<td>750000��</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
