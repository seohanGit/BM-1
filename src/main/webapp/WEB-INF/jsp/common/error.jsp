<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
#container {
    width: auto;
    max-width: 520px;
    padding: 0 15px;
}
</style>
<!-- bootstrap -->
<script src="/resources/js/lib/bootstrap/bootstrap.min.js"></script>
<title>Error</title>
</head>

<body style="background: #FFFFFF;">
    <div id="wrap">

        <div class = "container">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h1 class="panel-title" style="font-size:22px">아래와 같은 오류가 발생했습니다.</h1>
            </div>
            <div class="panel-body">${errorMessage}</div>
        </div>
        </div>
    </div>
</body>
</html>