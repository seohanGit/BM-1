<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="page-header">
	������ ������ <small>Admin</small>
</h1>
<!-- First Blog Post -->
<div class="row panel panel-default hidden-xs">
	<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
		style="width: 95%;">

		<button class="btn btn-default  noborder" id="recordListAll"
			onclick="location.href='recordListAll'">�뿩���</button>

		<button class="btn btn-default  noborder" id="reservationListAll"
			onclick="location.href='reservationListAll'">������Ȳ</button>
		<button class="btn btn-default  noborder" id="rentListAll"
			onclick="location.href='rentListAll'">�뿩��Ȳ</button>
		<button class="btn btn-default  noborder" id="requestList"
			onclick="location.href='requestList'">���ſ�û</button>

		<button class="btn btn-default  noborder" id="borrowListAll"
			onclick="location.href='borrowList'">�뿩��û</button>
		<hr>

		<button class="btn btn-default  noborder" id="noticeListByAdmin"
			onclick="location.href='noticeListByAdmin'">��������</button>
		<button class="btn btn-default  noborder" id="bookList"
			onclick="location.href='bookList'">�������</button>
		<button class="btn btn-default  noborder" id="memberList"
			onclick="location.href='memberList'">������</button>
		<button class="btn btn-default  noborder" id="boardList"
			onclick="location.href='boardList'">�Խ��� ����</button>
	</div>
</div>
<div class="row panel panel-default visible-xs-block"
	style="width: 360px">
	<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
		style="width: 95%;">

		<button class="btn btn-default btn-sm noborder" id="noticeListByAdmin"
			onclick="location.href='noticeListByAdmin'">��������</button>

		<button class="btn btn-default btn-sm noborder" id="memberList"
			onclick="location.href='memberList'">������</button>
		<button class="btn btn-default btn-sm noborder" id="boardList"
			onclick="location.href='boardList'">�Խ��� ����</button>

		<button class="btn btn-default btn-sm noborder" id="bookList"
			onclick="location.href='bookList'">�������</button>
		<button class="btn btn-default btn-sm noborder" id="recordListAll"
			onclick="location.href='recordListAll'">�뿩���</button>

		<button class="btn btn-default btn-sm noborder"
			id="reservationListAll" onclick="location.href='reservationListAll'">������Ȳ</button>
		<hr>

		<button class="btn btn-default btn-sm noborder" id="rentListAll"
			onclick="location.href='rentListAll'">�뿩��Ȳ</button>
		<button class="btn btn-default btn-sm noborder" id="requestList"
			onclick="location.href='requestList'">���ſ�û</button>
		<button class="btn btn-default btn-sm noborder" id="borrowListAll"
			onclick="location.href='borrowList'">�뿩��û</button>
	</div>
</div>