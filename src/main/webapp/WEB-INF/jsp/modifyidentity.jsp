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
<script src="/resources/js/jquery/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<style type="text/css">
body {
    padding-top: 70px;
}
</style>
</head>
<body>
    <div class="container">
        <h2>사용자 정보 변경</h2>
        <div class="panelpanel-default">
            <form action="/modifySuccess" method = "post" class="panel-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">변경 후 password</label> <input type="password"
                        class="form-control" id="password" name ="password" placeholder="password">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">변경 후 password 확인</label> <input type="password"
                        class="form-control" placeholder="password">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">e-mail변경</label> <input type="text"
                        class="form-control" id="email" name ="email" placeholder="email">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">주소 변경</label> <input type="text"
                        class="form-control" id="address" name ="address" placeholder="주소">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">핸드폰변경</label> <input type="text"
                        class="form-control" id="cell" name ="cell" placeholder="핸드폰번호">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">집전화 변경</label> <input type="text"
                        class="form-control" id="cell" name ="home" placeholder="집전화">
                </div>
                <button type="submit" class="btn btn-default">확인</button>
            </form>
        </div>
    </div>
</body>
</html>