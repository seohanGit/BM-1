<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="page-header">
	������ ������ <small>Admin</small>
</h1>
<!-- First Blog Post -->
<div class="row panel panel-default hidden-xs">
	<ul class="nav nav-tabs nav-justified " role="group" aria-label="..."
		style="width: 95%;">
		<li id="bookList">�������</li>
		<li id="requestList">���ſ�û</li>
		<li id="borrowList2">�뿩��û</li>
		<li id="rentListAll">�뿩��Ȳ</li>
		<li id="reservationListAll">������Ȳ</li>
		<hr>
		<li id="recordListAll">�뿩���</li>
		<li id="noticeListByAdmin">��������</li>
		<li id="memberList">����ڸ��</li>
		<li id="boardList">�Խ��� ����</li>
	</ul>
</div>
<div class="row panel panel-default visible-xs-block"
	style="width: 360px">
	<div class="nav nav-tabs nav-justified" role="group" aria-label="..."
		style="width: 95%;">
		<button class="btn btn-default btn-sm" id="noticeListByAdmin" onclick="location.href='noticeListByAdmin'">��������</button>

		<button class="btn btn-default btn-sm" id="memberList" onclick="location.href='memberList'">������</button>
		<button class="btn btn-default btn-sm" id="boardList" onclick="location.href='boardList'">�Խ��� ����</button>
		<hr>

		<button class="btn btn-default btn-sm" id="bookList" onclick="location.href='bookList'">�������</button>
		<button class="btn btn-default btn-sm" id="recordListAll" onclick="location.href='recordListAll'">�뿩���</button>

		<button class="btn btn-default btn-sm" id="reservationListAll"
			onclick="location.href='reservationListAll'">������Ȳ</button>
		<hr>

		<button class="btn btn-default btn-sm" id="rentListAll" onclick="location.href='rentListAll'">�뿩��Ȳ</button >
		<button class="btn btn-default btn-sm" id="requestList" onclick="location.href='requestList'">���ſ�û</button>
		<button class="btn btn-default btn-sm" id="borrowListAll" onclick="location.href='borrowList'">�뿩��û</button>
	</div>
</div>