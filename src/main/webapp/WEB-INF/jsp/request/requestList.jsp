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
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<link href="/resources/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
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

		<div class="col-md-12"><jsp:include page="../menu.jsp" />
			<div class="col-xs-12 panel panel-default">
				<div class="panel-body">
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
											<th class="td-chk"><input type="checkbox" id="allCheck"></th>
											<th class="hidden-sm hidden-xs hidden-md genre">도서코드</th>
											<th class="longLen">도서명</th>
											<th class="hidden-sm hidden-xs genre">가격</th>
											<th class="shortlen">수량</th>
											<th class="hidden-xs genre">신청</th>
											<th class="hidden-sm hidden-xs hidden-md genre">요청일자</th>
											<th class="genre">상태</th>
											<th class="longlen">비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bookList}" var="book" varStatus="status">
											<tr>
												<td align="center"><input type="checkbox" name="req_cd"
													value="${book.reqdate}-${book.req_cd}"></td>
												<td class="hidden-sm hidden-xs hidden-md ">${book.book_cd}</td>
												<td class="td-title" align="center"><a
													onclick="window.open
									('${book.link}','new','resizeble=yes scrollbars=yes, width=1200, height=1000');">${book.title}</a></td>
												<td class="hidden-sm hidden-xs" align="center">
												<fmt:formatNumber
														value="${book.price}"/>원</td>
												<td align="center"><fmt:formatNumber
														value="${book.quantity}" /></td>
												<td class="hidden-xs" align="center"><c:choose>
														<c:when test="${empty book.kname}">${book.id}</c:when>
														<c:otherwise>${book.kname}</c:otherwise>
													</c:choose></td>
												<td class="hidden-sm hidden-xs hidden-md" align="center">
													<fmt:parseDate value="${book.reqdate}000000"
														pattern="yyyyMMddHHmmss" var="reqDate" scope="page" /> <fmt:formatDate
														value="${reqDate}" pattern="yyyy-MM-dd" />
												</td>
												<c:choose>
													<c:when test="${book.reqstatus =='0'}">
														<td align="center">대기</td>
														<td><button class="btn btn-sm btn-default"
																type="button" id="buyBook"
																onClick="window.open('buyRequest?req_cd=${book.req_cd}&reqdate=${book.reqdate}','new','resizeble=yes scrollbars=yes,  width=750, height=730');">구매</button>

															<button class="btn btn-sm btn-default" type="button"
																onClick="location.href='rejectRequest?req_cd=${book.req_cd}&reqdate=${book.reqdate}'; del();">반려</button>
														</td>
													</c:when>
													<c:when test="${book.reqstatus =='1'}">
														<td class="ok" align="center">승인</td>
														<td></td>
													</c:when>
													<c:when test="${book.reqstatus =='2'}">
														<td align="center" class="no">반려</td>
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
	<script type="text/javascript"> 
// 		$(document).ready(function() {
// 			$('#dataTable').dataTable({
// 				"pageLength" : 10,
// 				paging : true,
// 				"columns" : [ null, null,  {
// 					"searchable" : false
// 				}, {
// 					"searchable" : false
// 				}, {
// 					"searchable" : false
// 				}, null,null,null,null ]
// 			});
// 		});
		$(document).ready(function() {
			var table = $('#dataTable').DataTable({
				"pageLength" : 1000,
				paging : true,
				"order" : [] 
			});

			new $.fn.dataTable.FixedHeader(table);
		});
	</script> 
</body>
</html>