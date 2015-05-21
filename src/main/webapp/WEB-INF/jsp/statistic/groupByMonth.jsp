<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery/jquery.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$(document).ready(function() {
			$('table.highchart').highchartTable();
		});
	});
</script>
</head>
<body>
	<div id="bestPerson" class="right">
		<table class="highchart table table-bordered"
			data-graph-container-before="1" data-graph-type="column"
			style="display: none">
			<caption>월별 예산현황</caption>

			<thead>
				<tr>
					<th class="td-title"></th>
					<th class="td-img">사용예산</th>
					<th>사용가능예산</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rentMonth }" var="rentMonth" begin="0" end="11">
					<tr>

						<td>${rentMonth.month}월</td>
						<td>${rentMonth.count}</td>
						<td>750000원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>