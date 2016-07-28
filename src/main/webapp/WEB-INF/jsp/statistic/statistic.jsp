<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
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
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$.ajax({

			type : "GET", // GET or POST
			url : "/rentByMonth", // URL
			datatype : "xml",
			// html, xml, json, jsonp, script, text
			data : {
				year : $('#year').val(),
				month : $('#month').val(),
				which : 'table'
			},
			// parameters as plain object
			error : function() { // Ajax error handler
				alert('검색어를 입력하세요');
			},
			success : function(data, status) { // Ajax complete handelr
				$('#full').empty().append(data);
				//$('#table').empty();
				$('#chart').empty();
				$('table.highchart').highchartTable();
			}
		});
		$('.highcharts-container').css('display', 'inline');

	});
</script>
<script type="text/javascript" src="/resources/js/highchartTable.js"></script>
<script type="text/javascript" src="/resources/js/highcharts.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
}

.chart div {
	font: 10px sans-serif;
	background-color: steelblue;
	text-align: right;
	padding: 3px;
	margin: 1px;
	color: black;
}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">

		<div class="col-md-12"><jsp:include page="../menu.jsp" />

			<div class="col-xs-12 panel panel-default">
				<div class="panel-body">


					<select class="selectpicker"
						style="height: 22px; vertical-align: bottom; width: 100px"
						id="year">
						<%Calendar cal = Calendar.getInstance(); 
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy");%>
						<option value="<%=sdf.format(cal.getTime()) %>" selected><%=sdf.format(cal.getTime()) %>
						<%cal.add(cal.YEAR, -1); %>
						<option value="<%=sdf.format(cal.getTime()) %>"><%=sdf.format(cal.getTime()) %>
						<%cal.add(cal.YEAR, -1); %>
						<option value="<%=sdf.format(cal.getTime()) %>"><%=sdf.format(cal.getTime()) %>
					</select> <select class="selectpicker"
						style="height: 22px; vertical-align: bottom;" id="month">
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
						<option value="6">6
						<option value="7">7
						<option value="8">8
						<option value="9">9
						<option value="10">10
						<option value="11">11
						<option value="12">12
						<option value="" selected>연간조회
					</select>
					<button class="btn btn-sm" id="rentByMonth" type="button">연간
						대출 현황</button>
					<button class="btn btn-sm" id="purchaseMonth" type="button">연간
						예산 현황</button>
					<button class="btn btn-sm" id="bookCount" type="button">보유
						현황</button>
					<button class="btn btn-sm" id="teamCount" type="button">
						팀별 현황</button>
					<button class="btn btn-sm" id="rankGroupByB" type="button">분류별
						대출 순위</button>
					<button class="btn btn-sm" id="rankGroupByBook" type="button">도서별
						대출 순위</button>
					<button class="btn btn-sm" id="rentByPerson" type="button">개인별
						대출 순위</button>

					<div id="chart" class="row" style="width: 49%; float: left">

					</div>
					<div id="table-wrap" class="row" style="width: 49%; float: right"></div>
					<div id="full" class="row" style="width: 100%"></div>

				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/statistic.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	
</body>
</html>