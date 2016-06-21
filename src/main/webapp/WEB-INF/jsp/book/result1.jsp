<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div id="insertForm" class=" col-xs-12 col-sm-12">
		<div class="panel panel-default ">
		<form action="/insertbook" method="post" class="panel-body" onsubmit="formChk(); return false">
			<div class="form-group">
				<label for="exampleInputEmail1">도서번호</label> <input type="text"
					class="form-control" id="book_cd" name="book_cd" 
					 required="required">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">도서명</label> <input type="text"
					class="form-control" id="title" name="title" placeholder="도서명"
					value="${book.title }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">장르</label> <input type="text"
					class="form-control" id="b_group" name="b_group" placeholder="장르"
					value="${book.b_group }">
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
					required="required" style="width: 80%;" onkeypress="quantityCheck();">
			</div>
			<div class="form-group right" style="width: 50%">
				<label for="exampleInputPassword1">가격</label> <input type="number" 
					class="form-control" style="width: 80%;" name="price" id="price" min="0" required="required"
					value="${book.price}">
			</div>
			<input type="hidden" name="isbn" value="${book.isbn}">
			<input type="hidden" name="imageurl" value="${book.imageurl}">
			<input type="hidden" name="summary" value="${book.summary}">
			<button type="submit" class="btn btn-default"
			 onClick="formChk();   ">확인</button>
<!-- 		  -->
		</form>
		</div> 
	</div>  
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>