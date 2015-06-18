<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<table class="highchart table table-bordered"
	data-graph-container-before="1" data-graph-type="line"
	data-graph-yaxis-2-opposite="1" style="display: none" >
	<caption style="font-size:20px"> 연간 예산 현황</caption>

	<thead>
		<tr>
			<th class="td-img"></th>
			<th data-graph-type="column" data-graph-yaxis="1">구매권수</th>
			<th>사용예산</th>
			<th data-graph-type="line">배정예산</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${SumPurchase}" var="SumPurchase" begin="0"
			end="11" varStatus="status">
			<tr>
				<td>${SumPurchase.month}월</td>
				<td>${SumPurchase.count}권</td>
				<td>${SumPurchase.price}원</td>
				<td>750000원</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
