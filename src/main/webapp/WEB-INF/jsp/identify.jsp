<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자 설정 변경 암호 확인</title>
</head>
<body>
	<form action="/modify" method="post">
		<h2>암호 확인</h2>
		<table border=1>
			<tr>
				<td>password</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<button type="submit">확인</button>
			</tr>
		</table>


	</form>
</body>
</html>