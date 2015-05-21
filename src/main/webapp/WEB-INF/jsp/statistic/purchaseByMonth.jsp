<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="column">
		<caption>분류별 대여현황</caption>

		<thead>
			<tr>
				<th class="td-title"></th>
				<th data-graph-type="line">대여권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SumPurchase }" var="SumPurchase" begin="0"
				end="11" varStatus="status">
				<tr>

					<td>${status.index+1}월</td>
					<td><c:if test="${status.index+1 == SumPurchase.month}">
							${SumPurchase.price}
						</c:if></td>
					<td>750000원</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
