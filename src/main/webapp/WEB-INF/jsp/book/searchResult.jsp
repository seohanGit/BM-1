
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="dataTable_wrapper ">
	<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
		<table class="table table-striped table-bordered " id="dataTable">
			<thead>
				<tr>
					<th class="hidden-xs hidden-sm hidden-md image">표지</th>
					<th>도서명</th>
					<th class="hidden-xs hidden-sm hidden-md author">저자</th>
					<th class="hidden-xs hidden-sm genre">출판사</th>
					<th class="hidden-xs genre" style="width: 120px">분류</th>
					<th class="author">대여상태</th>
					<th class="image"></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${bookList}" var="book">
					<tr>
						<td class="hidden-xs hidden-sm hidden-md image" align="left"><c:choose>
								<c:when test="${empty book.imageurl }">
									<a href="#"
										onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=750, height=500');">
										<img src="/resources/img/noimage.png" style="width: 90%"> </a>
								</c:when>
								<c:otherwise>
									<a href="#"
										onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=750, height=500');">
										<img src="${book.imageurl}" style="width: 90%">
									</a>
								</c:otherwise>
							</c:choose></td>
						<td align="left"><a href="#"
							onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=750, height=500');">
								${book.title }</a></td>
						<td class="hidden-xs hidden-sm hidden-md" align="left">${book.author }</td>
						<td class="hidden-xs hidden-sm" align="left">${book.publish}</td>
						<td class="hidden-xs td-genre" align="left">${book.b_group }</td>
						<c:choose>
							<c:when test="${book.rentchk=='0'}">
								<td align="left"><mark>대출가능</mark></td>
								<td align="left"><button class="btn btn-default"
										type="button" id="borrowbook"
										onClick="location.href='/borrowbook?book_cd=${book.book_cd}'; borrow();">대출</button></td>
							</c:when>

							<c:when test="${book.rentchk=='1' and book.reservechk=='1'}">
								<td>예약중</td>
								<td></td>
							</c:when>
							<c:when test="${book.rentchk=='1' and book.reservechk=='0'}">
								<td><p style="color: blue;">대출중</p> 반납일 :${book.returndate}</td>
								<td><button class="btn btn-default" type="button"
										id="reservebook"
										onClick="location.href='/reservation?book_cd=${book.book_cd}'">예약</button></td>
							</c:when>
							<c:when test="${book.rentchk=='2' and book.reservechk=='1'}">
								<td>예약중</td>
								<td></td>
							</c:when>
							<c:when test="${book.rentchk=='2' and book.reservechk=='0'}">
								<td><p style="color: blue;">대출중</p> 반납일 :${book.returndate}</td>
								<td></td>
							</c:when>
							<c:when test="${book.rentchk=='4'}">
								<td>대출 정지</td>
								<td></td>
							</c:when>
							<c:when test="${book.rentchk=='5'}">
								<td>예약중</td>
								<td></td>
							</c:when>
							<c:otherwise>
								<td></td>
								<td></td>
							</c:otherwise>
						</c:choose>
					</tr>


				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
