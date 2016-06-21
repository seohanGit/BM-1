<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<table class="highchart" data-graph-container-before="1"
	data-graph-type="line" data-graph-yaxis-2-opposite="1"
	style="display: none" >
	<caption style="font-size: 20px">연간 예산 현황</caption>

	<thead>
		<tr>
			<th class="td-img"></th>
			<th data-graph-type="column" data-graph-yaxis="1" data-graph-datalabels-color="blue" data-graph-datalabels-enabled="1">구매권수</th>
			<th data-graph-datalabels-color="red" data-graph-datalabels-enabled="1">사용예산</th>
			<th data-graph-type="line" >배정예산</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${SumPurchase}" var="SumPurchase" begin="0" end="11"
			varStatus="status">
			<tr>
				<td>${SumPurchase.month}월</td>
				<td>${SumPurchase.count}권</td>
				<td >${SumPurchase.price}원</td>
				<td>750000원</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="table-bottom">
	<table class="table table-bordered">
		<caption >연간 예산 현황</caption>
		<thead>
			<tr>
				<th>월</th>
				<c:forEach items="${SumPurchase}" var="SumPurchase" begin="0"
					end="11" varStatus="status">
					<th>${SumPurchase.month}월</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>구매권수</td>
				<c:forEach items="${SumPurchase}" var="SumPurchase" begin="0"
					end="11" varStatus="status">
					<td class="td-count">${SumPurchase.count}권</td>
				</c:forEach>
			</tr>
			<tr>
				<td>사용예산</td>
				<c:forEach items="${SumPurchase}" var="SumPurchase" begin="0"
					end="11" varStatus="status">
					<td class="td-count">${SumPurchase.price}원</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
</div>