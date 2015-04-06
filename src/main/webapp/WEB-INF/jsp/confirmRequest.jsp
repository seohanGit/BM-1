<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>


<c:forEach items="${book}" var="book">
	<div class="container">
		<h2>구매 요청 확인</h2>

		<div class="panelpanel-default">
			<form action="/insertbook" method="post" class="panel-body">
				<div class="form-group">
					<label for="exampleInputEmail1">도서번호</label> <input type="text"
						class="form-control" id="isbn" name="isbn"
						placeholder="${book.isbn}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">도서명</label> <input type="text"
						class="form-control" id="bookname" name="bookname"
						placeholder="${book.bookname }">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">장르</label> <input type="text"
						class="form-control" id="genre" name="genre"
						placeholder="${book.genre}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">출판사</label> <input type="text"
						class="form-control" id="publisher" name="publisher"
						placeholder="${book.publisher}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">저자</label> <input type="text"
						class="form-control" id="writer" name="writer"
						placeholder="${book.writer}">
				</div>
				<button type="submit" class="btn btn-default">확인</button>
			</form>

		</div>

	</div>
</c:forEach>
