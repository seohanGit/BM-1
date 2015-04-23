<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<!-- Blog Entries Column -->
		<div class="col-md-8">
			<h2>도서검색 목록</h2>
			<hr>
			<table class="table table-striped  table-bordered ">
				<thead>
					<tr>
						<td id="tb-img">표지</td>
						<td id="tb-author">도서명</td>
						<td id="tb-author">저자</td>


						<td>대여상태</td>
						<td width="230px">
						</td>
					</tr>
				</thead>
				<%-- 
						
 --%>
				<c:forEach items="${bookList}" var="book" varStatus="loop">
					<tbody>


						<tr>
							<td rowspan="2" style="width: 40px" align="left"><img
								style="width: 40px" src="${book.imageurl}"></td>
						</tr>
						<tr>

							<td align="left">${book.bookname }</td>
							<td align="left">${book.writer }</td>

							<c:choose>
								<c:when test="${book.borrowcheck=='0'}">
									<td align="left">대출가능</td>
									<td>
										<button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/stopBorrow?bookCode=${book.bookCode}'">대출정지</button>
										<button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.borrowcheck=='1'}">
									<td><mark>대여요청중</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.borrowcheck=='2'}">
									<td>대출중</td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.borrowcheck=='4'}">
									<td><mark>대출정지</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/recoverBook?bookCode=${book.bookCode}'">대출재개</button></td>
								</c:when>
								<c:when test="${book.borrowcheck=='5'}">
									<td><mark>예약중</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/modifyBookForm?bookCode=${book.bookCode}'">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?bookCode=${book.bookCode}'; del();">도서삭제</button>
									</td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
					</tbody>
				</c:forEach>
			</table>

		</div>
	</div>
</div>
<script src="/resources/js/common.js"></script>

