<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h2 class="page-header">
	������ ������ <small>Admin</small>
</h2>
<!-- First Blog Post -->
<div align="left" style="width: 98%">
	<div class="row panel panel-default hidden-xs"
		style="margin-left: 5px;">
		<div class="nav nav-tabs nav-justified" role="group" aria-label="...">



			<!-- 			<button class="btn btn-default  noborder" -->
			<!-- 				onclick="location.href='reserveList'">������Ȳ</button> -->
			<button class="btn btn-default  noborder"
				onclick="location.href='requestList'">���ſ�û</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='borrowReqListAdmin'">�����û</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='recordList'">������</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='noticeListByAdmin'">��������</button>

			<button class="btn btn-default  noborder"
				onclick="location.href='searchBookAdmin?listType=&keyword='">�������</button>
			<!-- 	<button class="btn btn-default  noborder" 
			onclick="location.href='memberList'">������</button> -->
			<button class="btn btn-default  noborder"
				onclick="location.href='boardList'">�Խ���</button>
			<button class="btn btn-default  noborder"
				onclick="location.href='statistic'">����ڷ�</button>
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
					onclick="location.href='searchBook?listType=&keyword='">�������</button>

				<button class="btn btn-default  noborder"
					onclick="location.href='statistic'">����ڷ�</button>
			</div>
			<div class="btn-group btn-group-xs">
				<hr>
				<!-- 				<button class="btn btn-default  noborder" -->
				<!-- 					onclick="location.href='reservationListAll'">������Ȳ</button> -->

				<button class="btn btn-default noborder"
					onclick="location.href='request'">���ſ�û</button>
				<button class="btn btn-default  noborder"
					onclick="location.href='borrowReqList'">�����û</button>
				<button class="btn btn-default  noborder"
					onclick="location.href='delayList'">������ü</button>
				<button class="btn btn-default noborder"
					onclick="location.href='recordList'">������</button>
			</div>
		</div>
	</div>
</div>