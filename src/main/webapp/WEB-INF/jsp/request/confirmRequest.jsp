<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>도서 구매 요청</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>

</head>
<body>
	<div class="container">
		<h2>도서 구매 요청</h2>
		<div class="panelpanel-default">
			<form action="/confirmRequest" method="post" class="panel-body">
				<div class="col-md-4 col-sm-4	col-xs-4 ">
					<input type="image" name="imageurl" src="${book.imageurl}">
				</div>
				<div class=" col-md-8 col-sm-8	col-xs-8">
					<div class="col-md-12 col-sm-12	col-xs-12">
						ISBN <input type="number" maxlength="13" class="form-control"
							id="isbn" name="isbn" value="${book.isbn}" readonly="readonly">
					</div>
					<div class="col-md-12 col-sm-12	col-xs-12">
						도서명 <input type="text" class="form-control" id="title"
							name="title" value="${book.title }" readonly="readonly">
					</div>
					<div class="col-md-12 col-sm-12	col-xs-12">
						저자 <input type="text" class="form-control" id="author"
							name="author" value="${book.author }" readonly="readonly">
					</div>
					<div class="col-md-7 col-sm-7	col-xs-7 left">
						대분류 <select class="selectpicker form-control" name="b_group">
							<optgroup label="대분류">
								<option value="B-도서(단행본)">B-도서(단행본)
								<option value="E-기타매체">E-기타매체
								<option value="J-정기간행물">J-정기간행물
								<option value="P-특허자료">P-특허자료
								<option value="R-보고서">R-보고서
								<option value="S-규격/사전">S-규격/사전
								<option value="T-논문">T-논문
							</optgroup>
						</select>
					</div>
					<div class="col-md-5 col-sm-5	col-xs-5 right">
						소분류 <select class="selectpicker form-control" name="c_group">
							<optgroup label="소분류">
								<option value="010-일반">일반
								<option value="020-기계공학">기계공학
								<option value="030-재료/소재">재료/소재
								<option value="040-전기/전자제어">전기/전자제어
								<option value="050-소음/진동/NVH">소음/진동/NVH
								<option value="060-CAD/CAE/PLM">CAD/CAE/PLM
								<option value="070-자동차">자동차
								<option value="080-산업공학/품질">산업공학/품질
								<option value="090-컴퓨터/OA">컴퓨터/OA
								<option value="100-기타">기타
							</optgroup>
						</select>
					</div>

					<br>

					<div class="col-md-6 col-sm-6	col-xs-6">
						가격<input type="number" class="form-control" name="price"
							id="price" value="${book.price}" readonly="readonly">
					</div>
					<div class="col-md-6 col-sm-6	col-xs-6">
						수량<input type="number" class="form-control" id="quantity"
							name="quantity" value="1">
					</div>
					<div class="col-md-12 col-sm-12	col-xs-12">
						신청 사유<input type="text" class="form-control" name="reason"
							id="reason" required="required">
					</div>
					<div class="col-md-6 col-sm-6	col-xs-6">
						구매요청자<input type="text" class="form-control" id="kname"
							name="kname" value="${sessionScope.kname}" readonly="readonly">
					</div>
					<div id="chief" class="col-md-6 col-sm-6	col-xs-6">
						결재자 <select class="selectpicker form-control" name="chief">
							<option value="${sessionScope.chief}"  selected>${sessionScope.chief}
						</select>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<input type="hidden" name="imageurl" value="${book.imageurl }">
						<input type="hidden" name="link" value="${book.link}"> <input
							type="hidden" name="publish" value="${book.publish}"><input
							type="hidden" name="summary" value="${book.summary}"> <input
							type="hidden" name="id" value="${book.id}">
						확인
						<button type="submit" class="btn btn-default form-control">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var price = $('#price').val();
			if (price > 100000) {
				alert("100,000원 이상 도서 구매시 팀장 결재 필요합니다.");
				$('#cheif').show();
				/* $('#top').append("<select name="chief" >");
				$('#top')
						.append(
								"<option value="${member.chief}" selected>${member.chief}");
				$('#top').append("</select>"); */
			} else {
				$('#cheif').hide();
			}
			if ($('quantity').val() > 5) {
				alert("5권이상은 선행기획팀 서하림 사원에게 문의하십시오.")
			}
		});
	</script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/common.js"></script>

</body>
</html>