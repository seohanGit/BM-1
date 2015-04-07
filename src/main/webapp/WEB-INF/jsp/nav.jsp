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
			<a class="navbar-brand" href="index">민상훈 책방</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav " role="menu">
				<div class="btn-group" style="height: 50PX">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false" style="height: 50PX">
						내 정보<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a id="borrow_list" href="">대여현항</a></li>
						<li class="divider"></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal">사용자정보수정</a></li>

					</ul>
				</div>
				<li><a href="board">게시판</a></li>
				<li><a href="admin">관리자페이지</a></li>
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