<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>구매 요청 목록</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">


<style type="text/css">
body {
	padding-top: 70px;
}
</style>


</head>

<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">

					<!-- Blog Entries Column -->


					<c:choose>
						<c:when test="${empty bookList}">
							<div>
								<h2>구매요청 목록</h2>
							</div>
							<br>
							<p></p>
							<div>
								<h3>구매 요청한 도서가 없습니다.</h3>
							</div>
						</c:when>
						<c:otherwise>
							<div class="left">
								<h2>구매요청 목록</h2>
							</div>
							<br>
							<p></p>
							<form action="confirmBuyList" method="post">
								<div class="right right-end">
									<button class="btn btn-default" type="submit">구매</button>
								</div>
								<table class="table table-striped table-bordered" id="dataTable">

									<thead>
										<tr class="title ">
											<th style="width:20px"><input type="checkbox" id="allCheck"></th>
											<th id="td-img">표지</th>

											<th id="td-title">도서명</th>
											<th class="hidden-sm hidden-xs hidden-md " id="td-author">저자</th>
											<th class="hidden-sm hidden-xs " id="td-date">가격</th>
											<th id="td-img">수량</th>
											<th id="td-date">신청자</th>

											<th class="hidden-sm hidden-xs hidden-md " id="td-date">요청일자</th>
											<th id="td-img">상태</th>
											<th style="width:30px"></th>
											<th style="width:30px"></th>
										</tr>
									</thead>

									<c:forEach items="${bookList}" var="book" varStatus="status">

										<tbody class="hidden" style="width: 100%">
											<tr>
												<td><input type="checkbox" name="bookCode"
													value="${book.book_cd}"></td>
												<td rowspan="4" style="width: 50px" align="left"><img
													style="width: 50px" src="${book.imageurl}"></td>

											</tr>
											<tr>
												<td style="width: 40%" align="left"><a
													href="${book.link}">${book.title }</a></td>
												<td style="width: 40%" align="left">${book.author }</td>
												<td align="right"></td>
											</tr>
											<tr>
												<td>${book.b_group}</td>
												<td>요청자 : ${book.id}</td>
												<td>
													<button class="btn btn-default" type="button"
														onClick="location.href='buyRequest?book_cd=${book.book_cd}'">구매</button>
												</td>
											</tr>
											<tr>
												<td>${book.price}원</td>
												<td>수량 : ${book.quantity}</td>
												<td>
													<button class="btn btn-default" type="button"
														onClick="location.href='deleteRequest?book_cd=${book.book_cd}'; del();">삭제</button>
												</td>
											</tr>
										</tbody>


										<tbody>
											<tr >
												<td><input type="checkbox" name="book_cd"
													value="${book.book_cd}"></td>
												<td><img style="width: 50px" src="${book.imageurl}"></td>
												<td><a href="${book.link}">${book.title }</a></td>
												<td class="hidden-sm hidden-xs hidden-md ">${book.author}</td>

												<td class="hidden-sm hidden-xs  ">${book.price}원</td>
												<td align="center">${book.quantity}</td>
												<td>${book.id}</td>

												<td class="hidden-sm hidden-xs hidden-md "><fmt:formatDate type="date"
														pattern="yyyy-MM-dd" value="${book.reqdate}" /></td>

												<c:choose>
													<c:when test="${book.reqstatus =='0'}">
														<td>대기</td>
														<td><button class="btn btn-default" type="button"
																id="buyBook"
																onClick="location.href='buyRequest?book_cd=${book.book_cd}'">구매</button>
														</td>
														<td>
															<button class="btn btn-default" type="button"
																onClick="location.href='deleteRequest?book_cd=${book.book_cd}'; del();">삭제</button>
														</td>
													</c:when>
													<c:when test="${book.reqstatus =='1'}">
														<td align="left">승인</td>
														<td></td>
														<td></td>
													</c:when>
													<c:when test="${book.reqstatus =='2'}">
														<td>반려</td>
														<td></td>
														<td></td>
													</c:when>
												</c:choose>



											</tr>

										</tbody>

									</c:forEach>
								</table>
							</form>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
	</script>