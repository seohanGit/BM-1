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

	<div class="container">
		<div id="container" style="width: 100%; height: 400px;"></div>




	</div>
	<script src="/resources/js/highcharts.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/common.js"></script>
	<script src="/resources/js/jquery/book.js"></script>
	$(function () { $('#container').highcharts({ chart: { type: 'bar' },
	title: { text: 'Fruit Consumption' }, xAxis: { categories: ['Apples',
	'Bananas', 'Oranges'] }, yAxis: { title: { text: 'Fruit eaten' } },
	series: [{ name: 'Jane', data: [1, 0, 4] }, { name: 'John', data: [5,
	7, 3] }] }); });
</body>
</html>