<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h1 class="page-header">
	������ ������ <small>Admin</small>
</h1>
<!-- First Blog Post -->
<div class="row panel panel-default hidden-xs" style="width: 650px">
	<div class="panel-heading" role="group" aria-label="..."
		style="width: 100%;">
		<button type="button" class="btn btn-default" id="bookList">
			�������</button>
		<button type="button" class="btn btn-default" id="requestList">���ſ�û
		</button>
		<button type="button" class="btn btn-default" id="borrowListAll">�뿩��û</button>
		<button type="button" class="btn btn-default" id="rentListAll">�뿩��Ȳ</button>
		<button type="button" class="btn btn-default" id="reservationListAll">������Ȳ</button>
		<hr>
		<button type="button" class="btn btn-default" id="recordListAll">�뿩���</button>
		<button type="button" class="btn btn-default" id="noticeListByAdmin">��������</button>
		<button type="button" class="btn btn-default" id="memberList">����ڸ��</button>
		<button type="button" class="btn btn-default" id="boardList">�Խ���
			����</button>
	</div>
</div>
<div class="row panel panel-default visible-xs-block"
	style="width: 650px">
	<div class="panel-heading" role="group" aria-label="..."
		style="width: 100%;">
		<button type="button" class="btn btn-default" id="noticeListByAdmin"
			onclick="location.href='noticeListByAdmin'">��������</button>
		<button type="button" class="btn btn-default" id="memberList">����ڸ��</button>
		<button type="button" class="btn btn-default" id="boardList">�Խ���
			����</button>
		<hr>
		<button type="button" class="btn btn-default" id="bookList"
			onclick="location.href='bookList'">�������</button>
		<button type="button" class="btn btn-default" id="recordListAll"
			onclick="location.href='recordListAll'">�뿩���</button>
		<button type="button" class="btn btn-default" id="reservationListAll"
			onclick="location.href='reservationListAll'">������Ȳ</button>
		<hr>
		<button type="button" class="btn btn-default" id="rentListAll"
			onclick="location.href='rentListAll'">�뿩��Ȳ</button>
		<button type="button" class="btn btn-default" id="requestList"
			onclick="location.href='requestList'">���ſ�û</button>
		<button type="button" class="btn btn-default" id="borrowListAll"
			onclick="location.href='borrowListAll'">�뿩��û</button>
	</div>
</div>