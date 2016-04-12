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
<title>도서 추가 페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
</head>
<body>
	<div class="container">
		<div class="left"  ><h2>도서 추가 페이지</h2></div>
		<div class="input-group right"
			style="width: 40%; float: right; margin-right: 8%">
			<span class="input-group-btn"> <input type="hidden" id="type"
				name="type" value="isbn"> <input type="text"
				class="form-control" id="keyword" name="keyword"
				placeholder="인터파크 검색">
				<button class="btn btn-default" type="submit" id="getBookInfo">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</span>
		</div>
		<div id="insertForm" class=" col-xs-12 col-sm-12">
			<div class="panel panel-default ">
				<form action="/insertbook" method="post" class="panel-body"
					name="insertForm">
					<div class="form-group">
						<label for="exampleInputEmail1">도서번호</label> <input type="text"
							class="form-control" id="book_cd" name="book_cd">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">도서명</label> <input type="text"
							class="form-control" id="title" name="title" placeholder="도서명">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">장르</label> <input type="text"
							class="form-control" id="b_group" name="b_group" placeholder="장르">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">출판사</label> <input type="text"
							class="form-control" id="publish" name="publish"
							placeholder="출판사">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">저자</label> <input type="text"
							class="form-control" id="author" name="author" placeholder="저자">
					</div>
					<button type="submit" class="btn btn-default"
						onClick="opener.document.location.href='/searchBook?listType=title&keyword='; formChk();opener.focus(); self.close(); ">확인</button>
				</form>
			</div>

		</div>
		<div id="searchResultArea"></div>

	</div>
	<script type="text/javascript">
 
	 function formChk() {
		 var book_cd= $('#book_cd').val();
		 var title = $('#title').val();
		var isbn = $('#isbn').val();
		var author = $('#author').val();
		var publish = $('#publish').val();
		var price = $('#price').val();
		var reason = $('#reason').val();
		
		title.attr("required", true);
	
		if (book_cd == '') {
			alert('도서명을 입력하시기 바랍니다.');
			book_cd.focus();
			return false;
		}else if (title == '') {
			alert('도서명을 입력하시기 바랍니다.');
			title.focus();
			return false; 
		}else if (author == '') {
			alert('저자를 입력하시기 바랍니다.');
			author.focus();
			return false;
		}else if (publish == '') {
			alert('출판사를 입력하시기 바랍니다.');
			publish.focus();
			return false;
		}else if (price == '') {
			alert('가격을 입력하시기 바랍니다.');
			price.focus();
			return false; 
		}else{
			document.requestForm.submit();
			return true;
		}
	 }
	</script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/book.js"></script>
</body>
</html>