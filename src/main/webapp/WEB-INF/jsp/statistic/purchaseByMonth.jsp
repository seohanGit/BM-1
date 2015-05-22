<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<table class="highchart table table-bordered"
	data-graph-container-before="1" data-graph-type="column"
	style="display: show" >
	<caption style="font-size:20px"> �з��� �뿩��Ȳ (��뿹��, �������� ��ư�� ���� ���űǼ��� �� �� �ֽ��ϴ�.)</caption>

	<thead>
		<tr>
			<th class="td-title"></th>
			<th>���űǼ�</th>
			<th>��뿹��</th>
			<th data-graph-type="line">��������</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${SumPurchase}" var="SumPurchase" begin="0"
			end="11" varStatus="status">
			<tr>
				<td>${SumPurchase.month}��</td>
				<td>${SumPurchase.count}��</td>
				<td>${SumPurchase.price}��</td>
				<td>750000��</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
