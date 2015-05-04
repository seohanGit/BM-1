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
<title>민상훈책방 회원가입</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<h1>회원가입</h1>
		<div class="panel panel-default">
			<form action="/join" method="post" class="panel-body">
				<div class="form-group">
					<label for="id">ID</label> <input type="text" class="form-control"
						id="id" name="id" placeholder="아이디">
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="비밀번호">
				</div>
				<div class="form-group">
					<label for="passwordConfirm">Password 확인</label> <input
						type="password" class="form-control" id="passwordConfirm"
						placeholder="비밀번호 확인">
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="이름">
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input type="email"
						class="form-control" id="email" name="email" placeholder="email">
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="team" name="team" placeholder="부서">
				</div>
				<div class="form-group">
					<label for="cell">핸드폰</label> <input type="tel"
						class="form-control" id="cell" name="cell" placeholder="핸드폰">
				</div>
				
				<button type="submit" class="btn btn-default">가입</button>
			</form>
		</div>
	</div>
</body>
</html>