<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div >
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="bar"
		style="display: none">
		<caption>�з��� �뿩��Ȳ</caption>

		<thead>
			<tr>
				<th>�з�</th>
				<th>�뿩�Ǽ�</th>
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