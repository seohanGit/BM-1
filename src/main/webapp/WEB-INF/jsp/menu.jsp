<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h2 class="page-header">
	������ ������ <small>Admin</small>
</h2>
<!-- First Blog Post -->
<div align="left">
	<div class="row panel panel-default hidden-xs"
		style="width: 440px; margin-left: 10px;">
		<div class="nav nav-tabs nav-justified" role="group" aria-label="...">



			<button class="btn btn-default  noborder"
				onclick="location.href='reservationListAll'">������Ȳ</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='rentListAll'">�뿩��Ȳ</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='requestList'">���ſ�û</button>

			<button class="btn btn-default  noborder"
				onclick="location.href='borrowList'">�뿩��û</button>
			<hr>
			<button class="btn btn-default  noborder"
				onclick="location.href='recordListAll'">�뿩���</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='noticeListByAdmin'">��������</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='searchBook'">�������</button>
			<!-- 	<button class="btn btn-default  noborder" 
			onclick="location.href='memberList'">������</button> -->
			<button class="btn btn-default  noborder"
				onclick="location.href='boardList'">�Խ���</button>
		</div>
	</div>
	<div class="col-xs-10 row panel panel-default visible-xs-block "
		style="width: 300px; margin: 10px">
		<div class="nav nav-tabs nav-justified " role="group" aria-label="...">
			<div class="btn-group btn-group-xs">
				<button class="btn btn-default noborder"
					onclick="location.href='noticeListByAdmin'">��������</button>

				<!-- 	<button class="btn btn-default btn-sm noborder" 
			onclick="location.href='memberList'">������</button> -->
				<button class="btn btn-default  noborder"
					onclick="location.href='boardList'">�Խ���</button>

				<button class="btn btn-default noborder"
					onclick="location.href='searchBook'">�������</button>
				<button class="btn btn-default noborder"
					onclick="location.href='recordListAll'">�뿩���</button>
			</div>
			<div class="btn-group btn-group-xs">
				<hr>
				<button class="btn btn-default  noborder"
					onclick="location.href='reservationListAll'">������Ȳ</button>

				<button class="btn btn-default  noborder"
					onclick="location.href='rentListAll'">�뿩��Ȳ</button>
				<button class="btn btn-default noborder"
					onclick="location.href='requestList'">���ſ�û</button>
				<button class="btn btn-default  noborder"
					onclick="location.href='borrowList'">�뿩��û</button>
			</div>
		</div>
	</div>
</div>