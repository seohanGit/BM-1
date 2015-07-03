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
<style type="text/css">
body {
	padding-top: 70px;
}

span {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<h2>도서 구매 요청</h2>
		<div class="panel panel-default">
			<form action="/confirmRequest" method="post" class="panel-body">
				<div id="top">
					<div class="form-group">
						<label for="exampleInputEmail1">ISBN</label> <input type="text"
							class="form-control" id="isbn" name="isbn">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">도서명</label> <input type="text"
							class="form-control" id="title" name="title">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">저자</label> <input type="text"
							class="form-control" id="author" name="author">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">출판사</label> <input type="text"
							class="form-control" id="publish" name="publish">
					</div>
					<div class="form-group left" style="width: 50%">
						<label for="exampleInputPassword1">대분류</label> <select
							class="selectpicker" name="b_group">
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
					<div class="form-group right" style="width: 50%;">
						<label for="exampleInputPassword1">소분류</label> <select
							class="selectpicker" name="c_group">
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


					<div class="form-group">
						<label for="exampleInputPassword1">수량</label> <input type="number"
							class="form-control" id="quantity" name="quantity" value="1">
					</div>


					<div class="form-group">
						<label for="exampleInputPassword1">가격</label> <input type="number"
							class="form-control" name="price" id="price">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">신청 사유</label> <input
							type="text" class="form-control" name="reason" id="reason">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">구매요청자</label> <input
							type="text" class="form-control" id="kname" name="kname"
							value="${sessionScope.kname}" readonly="readonly"><span>focus
							fire</span>

					</div>
					<%-- 
				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="author" name="author"
						value="${book.author}">
				</div>
				 --%>
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="cheifId" value="${sessionScope.cheifId}">
					<button id="confirm" type="submit" class="btn btn-default">확인</button>
					<%-- <select name="chief">
						<option value="${member.chief}" selected>${member.chief}
					</select> --%>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		
	
		$(document).ready(function() {
			
						
			
			if ($('price').val > 100000) {
				alert('100,000원 이상 도서 구매시 팀장 결재 필요합니다.');
				/* $('#top').append("<select name="chief" >");
				$('#top')
						.append(
								"<option value="${member.chief}" selected>${member.chief}");
				$('#top').append("</select>"); */
			}
			if ($('quantity').val > 5) {
				alert("5권이상은 선행기획팀 서하림 사원에게 문의하십시오.")
			}
		});
		$('#price')
				.bind(
						'focusout',
						function() {
							var price = $('#price').val();
							$(this).next('span').css('display', 'inline')
									.fadeOut(1000);
							if (price > 100000) {
								alert("100,000원 이상 도서 구매시 팀장 결재 필요합니다.");
								$('#top').append('<select name="chief">');
								$('#top')
										.append(
												'<option value="${member.chief}" selected>${member.chief}');
								$('#top').append('</select>');
							}
						});
		$('#quantity').bind('click', function() {
			if ($('#quantity').val > 5) {
				alert('5권이상은 선행기획팀 서하림 사원에게 문의하십시오.')
			}
		});
		
		$('#confirm').bind('click', function() {
			var title = $('#title').val();
			var isbn = $('#isbn').val();
			var author = $('#author').val();
			var publish = $('#publish').val();
			var price = $('#price').val();
			var reason = $('#reason').val();
			
			if (title.isEmpty) {
				alert('도서명을 입력하시기 바랍니다.');
			}
			if (isbn.is('')) {
				alert('ISBN을 입력하시기 바랍니다.');
			}
			if (author = '') {
				alert('저자를 입력하시기 바랍니다.');
			}
			if (publish = '') {
				alert('출판사를 입력하시기 바랍니다.');
			}
			if (price = '') {
				alert('가격을 입력하시기 바랍니다.');
			}
			if (reason = '') {
				alert('신청사유를 입력하시기 바랍니다.');
			}
			
			
		});
		
	</script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>	
	<script src="/resources/js/common.js"></script>
</body>
</html>