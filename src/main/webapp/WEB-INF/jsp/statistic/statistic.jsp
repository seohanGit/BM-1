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
<script type="text/javascript" src="/resources/js/jquery/jquery.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$(document).ready(function() {
			$('table.highchart').highchartTable();
		});
	});
</script>
<script src="/resources/js/highchartTable.js"></script>
<script src="/resources/js/highcharts.js"></script>

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
					<div class="row">
						<div class="left" style="width: 45%" id="graphcontainer">
							<table id="bookCount" class="highchart"
								data-graph-container-before="1" data-graph-type="pie"
								style="display: none" data-graph-container="#graphcontainer">
								<caption>분류별 보유현황</caption>

								<thead>
									<tr>
										<th></th>
										<th>보유권수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${bookCount }" var="book">
										<tr>
											<td>${book.b_group}</td>
											<td>${book.count}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="teamCount" class="right" style="width: 45%">
							<table class="highchart" data-graph-container-before="1"
								data-graph-type="column" style="display: none"
								data-graph-container="#graphcontainer">
								<caption>팀별 연간 대여현황</caption>

								<thead>
									<tr>
										<th></th>
										<th>대여권수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${teamCount }" var="team">
										<tr>
											<td>${team.team_nm}</td>
											<td>${team.count}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div id="bestBook" class="left">
							<table class="highchart table table-bordered"
								data-graph-container-before="1" data-graph-type="column"
								style="display: none" data-graph-inverted="1"
								data-graph-xaxis-labels-enabled="0">
								<caption>도서별 대여순위</caption>

								<thead>
									<tr>
										<th class="td-title"></th>
										<th class="td-img">대여권수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${bestBook }" var="bestBook" begin="0"
										end="9">
										<tr>
											<td>${bestBook.title}</td>
											<td>${bestBook.count}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<select id="year1">
							<option value="2013">2013
							<option value="2014">2014
							<option value="2015">2015
							<option>4
							<option>5
							<option>6
							<option>7
							<option>8
							<option>9
							<option>10
							<option>11
							<option>12
						</select>
						<button id="selectGroupByMonth" type="button">년</button>
						<div id="graphPlace" class="right"></div>

					</div>
					<div class="row">
						<%-- 	<div id="bestPerson" class="chart left">

							<c:forEach items="${bestPerson }" var="bestPerson">
${bestPerson.month}
								<c:choose>
									<c:when test=" ${bestPerson.month == '1'}">
										${bestPerson.month}<div style="width:${bestPerson.count}%;">${bestPerson.kname}
											: ${bestPerson.count}</div>
									</c:when>




									<c:when test=" ${bestPerson.month == '2'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}
											: ${bestPerson.count}</div>
									</c:when>


									<c:when test=" ${bestPerson.month == '3'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}
											: ${bestPerson.count}</div>
									</c:when>


									<c:when test=" ${bestPerson.month == '4'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}
											: ${bestPerson.count}</div>
									</c:when>


									<c:when test=" ${bestPerson.month == '5'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}
											: ${bestPerson.count}</div>
									</c:when>

									<c:when test=" ${bestPerson.month == '6'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}:
											${bestPerson.count}</div>
									</c:when>

									<c:when test=" ${bestPerson.month == '7'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}:
											${bestPerson.count}</div>
									</c:when>


									<c:when test=" ${bestPerson.month == '8'}">
										<div style="width:${bestPerson.count}%;">${bestPerson.kname}:
											${bestPerson.count}</div>
									</c:when>

								</c:choose>
							</c:forEach>

						</div> --%>

						<select id="year">
							<option value="2013">2013
							<option value="2014">2014
							<option value="2015">2015
							<option>4
							<option>5
							<option>6
							<option>7
							<option>8
							<option>9
							<option>10
							<option>11
							<option>12
						</select>
						<button id="getMonth" type="button">월</button>
						<div id="rentMonth" class="right">
							<table class="highchart table table-bordered"
								data-graph-container-before="1" data-graph-type="column"
								style="display: none">
								<caption>월별 예산현황</caption>

								<thead>
									<tr>
										<th class="td-title">월</th>
										<th class="td-img">대여권수</th>
										<th>사용가능예산</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${rentMonth }" var="rentMonth" begin="0"
										end="11">
										<tr>

											<td>${rentMonth.month}월</td>
											<td>${rentMonth.count}</td>
											<td>750000원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>




					</div>
				</div>
			</div>
		</div>
		<script src="/resources/js/common.js"></script>

		<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>