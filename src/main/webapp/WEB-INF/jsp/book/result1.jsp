<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-default ">
	<form action="/insertbook" method="post" class="panel-body"
		onsubmit="formChk(); return false">
		<div class="form-group  ">
			<img src="${book.imageurl}"  >
		</div>
		<div class="form-group">
						<label style="width:10%;" for="exampleInputEmail1">ISBN</label> <input style="width:70%; display:-webkit-inline-box;"
							 class="form-control" type="text" id="isbn"
							name="isbn" value="${book.isbn }" required="required">
					<button style="width:10%" class="btn btn-default" type="submit" id="getBookInfo">
						<span class="glyphicon glyphicon-search"></span>
					</button>
					</div> 
		<div class="form-group">
			<label for="exampleInputEmail1">도서번호</label> <input type="text"
				class="form-control" id="book_cd" name="book_cd" required="required">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">도서명</label> <input type="text"
				class="form-control" id="title" name="title" placeholder="도서명"
				value="${book.title }">
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
		<div class="form-group">
			<label for="exampleInputPassword1">출판사</label> <input type="text"
				class="form-control" id="publish" name="publish" placeholder="출판사"
				value="${book.publish }">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">저자</label> <input type="text"
				class="form-control" id="author" name="author" placeholder="저자"
				value="${book.author}">
		</div>
		<div class="form-group left" style="width: 50%">
			<label for="exampleInputPassword1">수량</label> <input type="number"
				class="form-control" id="quantity" min="0" name="quantity" value="1"
				required="required" style="width: 80%;"
				onkeypress="quantityCheck();">
		</div>
		<div class="form-group right" style="width: 50%">
			<label for="exampleInputPassword1">가격</label> <input type="number"
				class="form-control" style="width: 80%;" name="price" id="price"
				min="0" required="required" value="${book.price}">
		</div><input
			type="hidden" name="link" value="${book.link}"> <input
			type="hidden" name="summary" value="${book.summary}">			
			<input type="hidden" name="imageurl"  value="${book.imageurl}">
		<button type="submit" class="btn btn-default" onClick="formChk()" >확인</button>
		<!-- 		  -->
	</form>
</div>
<script type="text/javascript">
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
	$('#c_group').change(
			function() {
				var book_cd = $('#b_group').val().substr(0, 1)
						+ this.value.substr(0, 3) + '-';
				$('#book_cd').val(book_cd);
				$('#book_cd').focus();
			})
</script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery/jquery.js"></script>