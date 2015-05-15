<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<th class="td-title">도서코드 수정</th>
<td><input type="text" name="book_cd"
													value="${book.book_cd}"><input type="hidden"
													name="req_cd" value="${book.req_cd}"></td>
</body>
</html>