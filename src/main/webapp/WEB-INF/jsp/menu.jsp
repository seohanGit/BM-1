<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h2 class="page-header">
	관리자 페이지 <small>Admin</small>
</h2>
<!-- First Blog Post -->
<div align="left" style="width: 98%">
	<div class="row panel panel-default hidden-xs"
		style="margin-left: 5px;">
		<div class="nav nav-tabs nav-justified" role="group" aria-label="...">



			<!-- 			<button class="btn btn-default  noborder" -->
			<!-- 				onclick="location.href='reserveList'">예약현황</button> -->
			<button class="btn btn-default  noborder"
				onclick="location.href='requestList'">구매요청</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='borrowReqListAdmin'">대출요청</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='recordList'">대출기록</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='noticeListByAdmin'">공지사항</button>

			<button class="btn btn-default  noborder"
				onclick="location.href='searchBookAdmin?listType=&keyword='">도서목록</button>
			<!-- 	<button class="btn btn-default  noborder" 
			onclick="location.href='memberList'">사원목록</button> -->
			<button class="btn btn-default  noborder"
				onclick="location.href='boardList'">게시판</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='statistic'">통계자료</button>
		</div>
	</div>
	<div class="col-xs-10 row panel panel-default visible-xs-block "
		style="width: 300px; margin: 10px">
		<div class="nav nav-tabs nav-justified " role="group" aria-label="...">
			<div class="btn-group btn-group-xs">
				<button class="btn btn-default noborder"
					onclick="location.href='noticeListByAdmin'">공지사항</button>

				<!-- 	<button class="btn btn-default btn-sm noborder" 
			onclick="location.href='memberList'">사원목록</button> -->
				<button class="btn btn-default  noborder"
					onclick="location.href='boardList'">게시판</button>

				<button class="btn btn-default noborder"
					onclick="location.href='searchBook?listType=&keyword='">도서목록</button>

				<button class="btn btn-default  noborder"
					onclick="location.href='statistic'">통계자료</button>
			</div>
			<div class="btn-group btn-group-xs">
				<hr>
				<!-- 				<button class="btn btn-default  noborder" -->
				<!-- 					onclick="location.href='reservationListAll'">예약현황</button> -->

				<button class="btn btn-default noborder"
					onclick="location.href='request'">구매요청</button>
				<button class="btn btn-default  noborder"
					onclick="location.href='borrowReqList'">대출요청</button>
				<button class="btn btn-default  noborder"
					onclick="location.href='delayList'">도서연체</button>
				<button class="btn btn-default noborder"
					onclick="location.href='recordList'">대출기록</button>
			</div>
		</div>
	</div>
</div>