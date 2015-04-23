
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navigation -->

<!--

//-->

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index">기술 자료실</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav " role="menu">
				<li id="nav-input"><input type="text" class="form-control"
					id="keyword" style="height: 40px;" placeholder="도서검색"></li>
				<li id="nav-input"><button class="btn btn-default"
						type="button" id="btn_search" style="height: 40px; align: center;">
						<span class="glyphicon glyphicon-search"></span>
					</button></li>
				<li><a href="board">게시판</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">내 정보
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#" id="borrowList">대여현항</a></li>
						<li><a href="#" id="request">구매요청목록</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal">사용자정보수정</a></li>
						<li class="divider"></li>

						<li><a href="#" id="logout" name="logout">로그 아웃 <span
								class="glyphicon glyphicon-chevron-right"></span>
						</a></li>
					</ul></li>


				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

				<li style="font-size: 10px"><a href="admin">관리자페이지</a></li>
			</ul>

		</div>

	</div>
	<!-- /.navbar-collapse -->



	<!-- /.container -->
</nav>


<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">암호 확인</h4>
			</div>
			<div class="modal-body">
				<form action="/modify" method="post" class="form-inline" role="form">
					<div class="form-group">
						<label class="sr-only" for="password">비밀번호</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="password">
					</div>
					<button type="submit" class="btn btn-default">확인</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->