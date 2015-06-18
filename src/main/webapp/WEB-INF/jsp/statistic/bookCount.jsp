<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<div id="center">�з��� ������Ȳ</div>
<div class="left">
	<table class="highchart" data-graph-container-before="1"
		data-graph-type="pie" style="display: none"
		data-graph-container="#graphcontainer">


		<thead>
			<tr class="  title">
				<th></th>
				<th class="td-genre">�����Ǽ�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookCount }" var="bookCount">
				<tr>
					<td>${bookCount.b_group}</td>
					<td>${bookCount.count}��</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="right">
	<table class="table table-bordered" id="bookCount">

		<thead>
			<tr>
				<th class="td-title">���� �з�</th>
				<th class="td-date">�����Ǽ�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookCount }" var="bookCount">
				<tr>
					<td>${bookCount.b_group}</td>
					<td class="count">${bookCount.count}��</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="summary">
				<td>T o t a l : </td>
				<td id="total_price"></td>
								
			</tr>
		</tfoot>
	</table>
</div>

