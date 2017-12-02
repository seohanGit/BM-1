
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="dataTable_wrapper ">
	<form action="stopBorrowList" method="post">
		<div class="dataTable_wrapper">
			<div class="left"
				style="vertical-align: baseline; margin-right: 20px"></div>
			<table class="table table-striped table-bordered " id="dataTable">
				<thead>
					<tr>
						<th class="genre">도서코드</th>
						<th>도서명</th>
						<th class="hidden-xs genre">저자</th>
						<th class="hidden-sm hidden-xs hidden-md genre">분류</th>
						<th style="width: 40px">추천</th>
						<th style="width: 90px">대출상태</th>
						<th style="width: 230px">비고</th>
					</tr>
				</thead>
				<tbody id="tablebody">
					<c:forEach items="${bookList}" var="book" varStatus="loop">
						<tr>
							<td class="book_cd"><input type="checkbox" name="book_cd"
								value="${book.book_cd}">${book.book_cd}</td>
							<td class="title" align="left"><a href="#"
								onclick="window.open('/bookInfo?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes, width=750, height=600');">
									${book.title }</a></td>
							<td class="hidden-xs "  >${book.author}</td>
							<td class="hidden-sm hidden-xs hidden-md b_group"
								id="${book.b_group }"  >${book.b_group}</td>

							<td class="rcmdChk" align="center" ><c:choose>
									<c:when test="${book.rcmdChk=='1' }">

										<input name="rcmdChk" value="1" type="checkbox"
											checked="checked">
										<%-- 											onclick="location.href='/setRecommend?book_cd=${book.book_cd}&rcmdChk=0';"> --%>
									</c:when>
									<c:otherwise>
										<input name="rcmdChk" value="0" type="checkbox">
										<%-- 											onclick="location.href='/setRecommend?book_cd=${book.book_cd}&rcmdChk=1';">											 --%>

									</c:otherwise>
								</c:choose></td>
							<c:choose>
								<c:when test="${book.rentchk=='0'}">
									<td align="center">대출가능</td>
									<td>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
										<button class="btn btn-default btn-sm" type="button"
											id="reservebook"
											onClick="location.href='/stopBorrow?book_cd=${book.book_cd}'">대출정지</button>
										<button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850px, height=750px');">도서수정</button>

									</td>
								</c:when>
								<c:when test="${book.rentchk=='1'}">
									<td><mark>대출요청중</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.rentchk=='2'}">
									<td>대출중</td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
									</td>
								</c:when>
								<c:when test="${book.rentchk=='4'}">
									<td><mark>대출정지</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onClick="location.href='/recoverBook?book_cd=${book.book_cd}'">대출재개</button></td>
								</c:when>
								<c:when test="${book.rentchk=='5'}">
									<td><mark>예약중</mark></td>
									<td><button class="btn btn-default btn-sm" type="button"
											id="modifybook"
											onclick="window.open('/modifyBookForm?book_cd=${book.book_cd}','new','resizeble=yes scrollbars=yes,  width=850, height=750');">도서수정</button>
										<button class="btn btn-default btn-sm" type="button"
											id="deletebook"
											onClick="location.href='/deletebook?book_cd=${book.book_cd}'; del();">도서삭제</button>
									</td>
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

	</form>
</div>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/metisMenu.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/bootstrap-select.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/jquery.dataTables.columnFilter.js"></script>
