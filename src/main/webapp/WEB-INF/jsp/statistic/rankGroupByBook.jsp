<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div class="chart-wrap">
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="column"
		style="display: none;" data-graph-inverted="0"
		data-graph-datalabels-enabled="1" data-graph-xaxis-labels-enabled="0" >
		<caption>도서별 대여순위</caption>

		<thead>
			<tr>
				<th class="td-title"></th>
				<th class="td-img">대여권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bestBook }" var="bestBook" begin="0" end="9">
				<tr>
					<td>${bestBook.title}</td>
					<td>${bestBook.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="table-wrap">
<table class="table table-bordered ">
	<caption>도서별 대여순위</caption>

	<thead>
		<tr>
			<th class="td-title">도서명</th>
			<th >대여권수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bestBook }" var="bestBook" begin="0" end="9">
			<tr>
				<td>${bestBook.title}</td>
				<td class="td-count">${bestBook.count}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>