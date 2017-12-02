<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped">
    <thead>
        <tr>
            <td>아이디</td>
            <td>이름</td>
            <td>e-mail</td>
            <td>주소</td>
            <td>Cell</td>
            <td>Home</td>
            <td>빌린날짜</td>
            <td>반납날짜</td>
        </tr>
    </thead>

    <tbody>
        <c:forEach items="${lateList}" var="late">

            <tr>
            <td>${late.id}</td>
            <td>${late.name}</td>
            <td>${late.email}</td>
            <td>${late.address}</td>
            <td>${late.cell}</td>
            <td>${late.home}</td>
            <td>${late.borrowdate}</td>
            <td>${late.returndate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
