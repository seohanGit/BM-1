<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div >
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="bar"
		style="display: none">
		<caption>분류별 대여현황</caption>

		<thead>
			<tr>
				<th>분류</th>
				<th>대여권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rankGroupByB }" var="b_group"
				varStatus="status">
				<tr>


					<td>${b_group.b_group}</td>
					<td>${b_group.count }</td>
				</tr>



			</c:forEach>
		</tbody>
	</table>
</div>