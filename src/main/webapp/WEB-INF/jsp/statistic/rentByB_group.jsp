<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<div style="width:50%; float:left">
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="column"
		style="display: none">
		<caption>�з��� �뿩��Ȳ</caption>

		<thead>
			<tr>
				<th>�з�</th>
				<th>�뿩�Ǽ�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${selectGroupByB }" var="b_group"
				varStatus="status">
				<tr>


					<td>${b_group.b_group}</td>
					<td>${b_group.count }</td>
				</tr>



			</c:forEach>
		</tbody>
	</table>
</div>
<div style="width:50%; float:right">
	<table class="highchart table table-bordered"
		data-graph-container-before="1" data-graph-type="column"
		style="display: none" data-graph-inverted="0"
		data-graph-xaxis-labels-enabled="0">
		<caption>������ �뿩����</caption>

		<thead>
			<tr>
				<th class="td-title"></th>
				<th >�뿩�Ǽ�</th>
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