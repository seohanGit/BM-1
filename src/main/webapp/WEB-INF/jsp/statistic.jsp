<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>통계 현황</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 70px;
}
</style>
</head>
<body><jsp:include page="nav.jsp" />

	<!-- Blog Entries Column -->
	<div class="col-md-8 ">
		<div id="chart"
			style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	</div>

	<table class="highchart" data-graph-container-before="1"
		data-graph-type="column">
		<thead>
			<tr>
				<th></th>
				<th>대여권수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookCount }" var="count">
				<tr>
					<td>${count.b_group}</td>
					<td>${count.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/highchartTable.js"></script>
	<script src="/resources/js/highcharts.js"></script>




</body>
</html>