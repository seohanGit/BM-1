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
			<td>빌린권수</td>
			<td>연체권수</td>
			<td>endday</td>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${blackList}" var="black">

			<tr>
			<td>${black.id}</td>
			<td>${black.name}</td>
			<td>${black.email}</td>
			<td>${black.address}</td>
		    <td>${black.cell}</td>
		    <td>${black.home}</td>
		    <td>권</td>
		    <td>${black.numarrear}권</td>
		    <td>${black.endday}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
