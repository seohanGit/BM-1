<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="page-header">
	관리자 페이지 <small>Admin</small>
</h1>
<!-- First Blog Post -->
<div class="row panel panel-default hidden-xs" style="width: 650px">
	<div class="panel-heading" role="group" aria-label="..."
		style="width: 100%;">
		<button type="button" class="btn btn-default" id="bookList">
			도서목록</button>
		<button type="button" class="btn btn-default" id="requestList">구매요청
		</button>
		<button type="button" class="btn btn-default" id="borrowListAll">대여요청</button>
		<button type="button" class="btn btn-default" id="rentListAll">대여현황</button>
		<button type="button" class="btn btn-default" id="reservationListAll">예약현황</button>
		<hr>
		<button type="button" class="btn btn-default" id="recordListAll">대여기록</button>
		<button type="button" class="btn btn-default" id="noticeListByAdmin">공지사항</button>
		<button type="button" class="btn btn-default" id="memberList">사용자목록</button>
		<button type="button" class="btn btn-default" id="boardList">게시판
			관리</button>
	</div>
</div>
<div class="row panel panel-default visible-xs-block"
	style="width: 650px">
	<div class="panel-heading" role="group" aria-label="..."
		style="width: 100%;">
		<button type="button" class="btn btn-default" id="noticeListByAdmin"
			onclick="location.href='noticeListByAdmin'">공지사항</button>
		<button type="button" class="btn btn-default" id="memberList">사용자목록</button>
		<button type="button" class="btn btn-default" id="boardList">게시판
			관리</button>
		<hr>
		<button type="button" class="btn btn-default" id="bookList"
			onclick="location.href='bookList'">도서목록</button>
		<button type="button" class="btn btn-default" id="recordListAll"
			onclick="location.href='recordListAll'">대여기록</button>
		<button type="button" class="btn btn-default" id="reservationListAll"
			onclick="location.href='reservationListAll'">예약현황</button>
		<hr>
		<button type="button" class="btn btn-default" id="rentListAll"
			onclick="location.href='rentListAll'">대여현황</button>
		<button type="button" class="btn btn-default" id="requestList"
			onclick="location.href='requestList'">구매요청</button>
		<button type="button" class="btn btn-default" id="borrowListAll"
			onclick="location.href='borrowListAll'">대여요청</button>
	</div>
</div>