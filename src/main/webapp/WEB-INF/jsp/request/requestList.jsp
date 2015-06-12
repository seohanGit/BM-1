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
	<jsp:include page="../nav.jsp" />
	<div class="container">

		<div class="col-md-12"><jsp:include page="../menu.jsp" />
			<div class="col-xs-12 panel panel-default">
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

							<form action="confirmBuyList" method="post">
								<div class="right right-end">
									<button class="btn btn-default" type="submit">구매</button>
									<button class="btn btn-default" type="button"
										onClick="location.href='modifiReqForm'">수정</button>
								</div>
								<table class="table table-striped table-bordered" id="dataTable">

									<thead>
										<tr class="title ">

											<th class="td-chk"><input type="checkbox" id="allCheck" ></th>
											<th class="hidden-sm hidden-xs hidden-md td-author">도서코드</th>
											<th>도서명</th>

											<th class="hidden-sm hidden-xs td-date">가격</th>
											<th class="td-img">수량</th>
											<th class="hidden-xs td-date">신청</th>

											<th class="hidden-sm hidden-xs hidden-md td-genre">요청일자</th>
											<th class="td-img">상태</th>
											<th class="td-genre"></th>

										</tr>
									</thead>


									<tbody>
										<c:forEach items="${bookList}" var="book" varStatus="status">
											<tr>
												<td><input type="checkbox" name="req_cd"
													value="${book.req_cd}"></td>
												<td class="hidden-sm hidden-xs hidden-md ">${book.book_cd}</td>
												<td class="td-title"><a href="${book.link}">${book.title }</a></td>


												<td class="hidden-sm hidden-xs  ">${book.price}원</td>
												<td align="center">${book.quantity}</td>
												<td class=" hidden-xs  "><c:choose>
														<c:when test="${empty book.kname}">${book.id}</c:when>
														<c:otherwise>${book.kname}</c:otherwise>
													</c:choose></td>
												<td class="hidden-sm hidden-xs hidden-md "><fmt:formatDate
														type="date" pattern="yyyy-MM-dd" value="${book.reqdate}" /></td>

												<c:choose>
													<c:when test="${book.reqstatus =='0'}">
														<td>대기</td>
														<td><button class="btn btn-sm btn-default"
																type="button" id="buyBook"
																onClick="location.href='buyRequest?req_cd=${book.req_cd}'">구매</button>

															<button class="btn btn-sm btn-default" type="button"
																onClick="location.href='rejectRequest?req_cd=${book.req_cd}'; del();">반려</button>
														</td>
													</c:when>
													<c:when test="${book.reqstatus =='1'}">
														<td class="ok" align="left">승인</td>
														<td></td>

													</c:when>
													<c:when test="${book.reqstatus =='2'}">
														<td class="no">반려</td>
														<td></td>

													</c:when>
												</c:choose>



											</tr>
										</c:forEach>
									</tbody>


								</table>
							</form>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		function del() {
			alert("삭제되었습니다.");
		}
	</script>
</body>
</html>