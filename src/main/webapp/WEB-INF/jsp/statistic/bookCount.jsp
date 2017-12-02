<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center"><h2>분류별 보유현황</h2></div>
<div class="chart-wrap">
	<table class="highchart" data-graph-container-before="1"
		data-graph-type="pie" style="display: none" data-graph-datalabels-enabled="1">
		<thead>
			<tr class="title">
				<th></th>
				<th >보유권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookCount }" var="bookCount">
				<tr>
					<td>${bookCount.b_group}</td>
					<td data-graph-name="${bookCount.b_group}">${bookCount.count}권</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="table-wrap" style="margin-top: 40px">
	
	<table class="table table-bordered" id="bookCount">

		<thead>
			<tr>
				<th class="td-title">도서 분류</th>
				<th class="td-count" >보유권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookCount }" var="bookCount">
				<tr>
					<td>${bookCount.b_group}</td>
					<td class="td-count count">${bookCount.count}권</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="summary">
				<td>T o t a l : </td>
				<td class="td-count" id="total_price"></td>
								
			</tr>
		</tfoot>
	</table>
</div>

