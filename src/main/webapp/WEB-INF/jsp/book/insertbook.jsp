<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>도서 추가 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
</head>
<body>
	<div class="container">
		<div class="left">
			<h2>도서 추가 페이지</h2>
		</div>
		<div id="insertForm" class=" col-xs-12 col-sm-12">
			<div class="panel panel-default ">
				<form action="/insertbook" method="post" class="panel-body"
					enctype="multipart/form-data" name="insertForm">
					
					<input type="hidden" id="type" value="isbn">
					
					<div class="form-group">
						<label style="width:10%;" for="exampleInputEmail1">ISBN</label> <input style="width:70%; display:-webkit-inline-box;"
							 class="form-control" type="text" id="isbn"
							name="isbn"  >
					<button style="width:10%" class="btn btn-default" type="button" id="getBookFromISBN">
						<span class="glyphicon glyphicon-search"></span>
					</button>

					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">도서번호</label> <input type="text"
							class="form-control" id="book_cd" name="book_cd"
							required="required"  >
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">도서명</label> <input type="text"
							class="form-control" id="title" name="title" placeholder="도서명"
							required="required">
					</div>
					<div class="col-md-7 col-sm-7	col-xs-7 left">
						<label for="exampleInputPassword1">대분류</label> <select
							class="selectpicker form-control"
							style="font-size: 14px; margin-top: 10px; vertical-align: baseline;"
							id="b_group" name="b_group">
							<c:forEach items="${BCodeList}" var="code">
								<option value="${code.code}-${code.name}">${code.code}-${code.name}
							</c:forEach>
						</select>
					</div>
					<div class="col-md-5 col-sm-5	col-xs-5 right">
						<label for="exampleInputPassword1">소분류</label> <select
							class="selectpicker form-control"
							style="font-size: 14px; margin-top: 10px; vertical-align: baseline;"
							id="c_group" name="c_group">
							<c:forEach items="${CCodeList}" var="code">
								<option value="${code.code}-${code.name}">${code.code}-${code.name}
							</c:forEach>
						</select>
					</div>
					<div class="col-md-6 col-sm-6	col-xs-6">
						<label for="exampleInputPassword1">출판사</label> <input type="text"
							class="form-control" id="publish" name="publish"
							placeholder="출판사" required="required">
					</div>
					<div class="col-md-6 col-sm-6	col-xs-6">
						<label for="exampleInputPassword1">저자</label> <input type="text"
							class="form-control" id="author" name="author" placeholder="저자">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">요약</label> <input type="text"
							class="form-control" id="summary" name="summary" placeholder="요약">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">가격</label><input type="number"
							class="form-control" name="price" id="price" placeholder="0"
							required="required">
					</div>
<!-- 					<div class="form-group file"> -->
<!-- 						<label for="exampleInputPassword1">파일</label> <input type="file" -->
<!-- 							class="form-control" id="file" name="file" placeholder="파일"> -->
<!-- 					</div> -->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<button type="submit" class="btn btn-default"
							onClick="formChk();  ">확인</button>
					</div>
				</form>
			</div> 
		</div> 

	</div>
	<script type="text/javascript"> 
		function formChk() {
			var book_cd = $('#book_cd').val();
			var title = $('#title').val();
			var isbn = $('#isbn').val();
			var author = $('#author').val();
			var publish = $('#publish').val();
			var price = $('#price').val();
			var reason = $('#reason').val();

			if (book_cd == '') {
				alert('도서번호을 입력하시기 바랍니다.');
				$('#book_cd').focus();
				return false;
			} else if (title == '') {
				alert('도서명을 입력하시기 바랍니다.');
				$('#title').focus();
				return false;
			} else if (author == '') {
				alert('저자를 입력하시기 바랍니다.');
				$('#author').focus();
				return false;
			} else if (publish == '') {
				alert('출판사를 입력하시기 바랍니다.');
				$('#publish').focus();
				return false;
			} else if (price == '') {
				alert('가격을 입력하시기 바랍니다.');
				$('#price').focus();
				return false;
			} else {
				document.requestForm.submit();
				opener.focus(); 
				self.close();
				return true;
			}
		}
		$('#b_group').change(
				function() {
					var book_cd = this.value.substr(0, 1)
							+ $('#c_group').val().substr(0, 3) + '-';
					$('#book_cd').val(book_cd);
					$('#book_cd').focus();
					if ($('#b_group').val().substr(0, 1) == "F") {
						$('.file').show();
					} else {
						$('.file').hide();
					}
				})
	</script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>