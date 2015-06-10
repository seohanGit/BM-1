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
			url : "/rentByPerson", // URL
			datatype : "xml",
			// html, xml, json, jsonp, script, text
			data : {
				year : $('#year').val(),
				month : $('#month').val()
			},
			// parameters as plain object
			error : function() { // Ajax error handler

				alert('검색어를 입력하세요');
			},
			success : function(data, status) { // Ajax complete handelr
				$('#container').empty().append(data);
				$('table.highchart').highchartTable();
			}
		});
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
						style="height: 22px; vertical-align: bottom; width:100px" id="year">
						<option value="2015" selected>2015
						<option value="2014">2014
						<option value="2013">2013
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
						대여 현황</button>
					<button class="btn btn-sm" id="purchaseMonth" type="button">연간
						예산 현황</button>
					<button class="btn btn-sm" id="bookTeamCount" type="button">보유
						현황, 팀별 현황</button>

					<button class="btn btn-sm" id="selectGroupByB" type="button">분류별,
						도서별 대여순위</button>

					<button class="btn btn-sm" id="rentByPerson" type="button">개인별
						대여순위</button>

					<div id="container" class="row" style="width: 100%"></div>

				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/ajax.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>

</body>
</html>