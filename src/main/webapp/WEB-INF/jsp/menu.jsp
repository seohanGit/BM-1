<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="page-header">
	관리자 페이지 <small>Admin</small>
</h1>
<!-- First Blog Post -->
<div class="row panel panel-default hidden-xs">
	<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
		style="width: 95%;">

		<button class="btn btn-default  noborder" id="recordListAll"
			onclick="location.href='recordListAll'">대여기록</button>

		<button class="btn btn-default  noborder" id="reservationListAll"
			onclick="location.href='reservationListAll'">예약현황</button>
		<button class="btn btn-default  noborder" id="rentListAll"
			onclick="location.href='rentListAll'">대여현황</button>
		<button class="btn btn-default  noborder" id="requestList"
			onclick="location.href='requestList'">구매요청</button>

		<button class="btn btn-default  noborder" id="borrowListAll"
			onclick="location.href='borrowList'">대여요청</button>
		<hr>

		<button class="btn btn-default  noborder" id="noticeListByAdmin"
			onclick="location.href='noticeListByAdmin'">공지사항</button>
		<button class="btn btn-default  noborder" id="bookList"
			onclick="location.href='bookList'">도서목록</button>
		<button class="btn btn-default  noborder" id="memberList"
			onclick="location.href='memberList'">사원목록</button>
		<button class="btn btn-default  noborder" id="boardList"
			onclick="location.href='boardList'">게시판 관리</button>
	</div>
</div>
<div class="row panel panel-default visible-xs-block"
	style="width: 360px">
	<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
		style="width: 95%;">

		<button class="btn btn-default btn-sm noborder" id="noticeListByAdmin"
			onclick="location.href='noticeListByAdmin'">공지사항</button>

		<button class="btn btn-default btn-sm noborder" id="memberList"
			onclick="location.href='memberList'">사원목록</button>
		<button class="btn btn-default btn-sm noborder" id="boardList"
			onclick="location.href='boardList'">게시판 관리</button>

		<button class="btn btn-default btn-sm noborder" id="bookList"
			onclick="location.href='bookList'">도서목록</button>
		<button class="btn btn-default btn-sm noborder" id="recordListAll"
			onclick="location.href='recordListAll'">대여기록</button>

		<button class="btn btn-default btn-sm noborder"
			id="reservationListAll" onclick="location.href='reservationListAll'">예약현황</button>
		<hr>

		<button class="btn btn-default btn-sm noborder" id="rentListAll"
			onclick="location.href='rentListAll'">대여현황</button>
		<button class="btn btn-default btn-sm noborder" id="requestList"
			onclick="location.href='requestList'">구매요청</button>
		<button class="btn btn-default btn-sm noborder" id="borrowListAll"
			onclick="location.href='borrowList'">대여요청</button>
	</div>
</div>