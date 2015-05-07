<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="page-header">
	관리자 페이지 <small>Admin</small>
</h1>
<!-- First Blog Post -->
<div align="left" style="padding-left: 30px; margin:20px">
	<div class="row panel panel-default hidden-xs" style="width: 80%;">
		<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
			>



			<button class="btn btn-default  noborder"
				onclick="location.href='reservationListAll'">예약현황</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='rentListAll'">대여현황</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='requestList'">구매요청</button>

			<button class="btn btn-default  noborder"
				onclick="location.href='borrowList'">대여요청</button>
			<hr>
			<button class="btn btn-default  noborder"
				onclick="location.href='recordListAll'">대여기록</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='noticeListByAdmin'">공지사항</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='bookList'">도서목록</button>
			<!-- 	<button class="btn btn-default  noborder" 
			onclick="location.href='memberList'">사원목록</button> -->
			<button class="btn btn-default  noborder"
				onclick="location.href='boardList'">게시판</button>
		</div>
	</div>
	<div class="row panel panel-default visible-xs-block "
		style="width: 80%;">
		<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
			>

			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='noticeListByAdmin'">공지사항</button>

			<!-- 	<button class="btn btn-default btn-sm noborder" 
			onclick="location.href='memberList'">사원목록</button> -->
			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='boardList'">게시판</button>

			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='bookList'">도서목록</button>
			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='recordListAll'">대여기록</button>


			<hr>
			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='reservationListAll'">예약현황</button>

			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='rentListAll'">대여현황</button>
			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='requestList'">구매요청</button>
			<button class="btn btn-default btn-sm noborder"
				onclick="location.href='borrowList'">대여요청</button>
		</div>
	</div>
</div>