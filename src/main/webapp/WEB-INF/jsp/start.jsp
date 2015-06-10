<%@ page language="java" session="false" isErrorPage="false"
	pageEncoding="euc-kr"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>기술자료실</title>

<script type="text/javascript">
	function winClose() {
		self.close();
		window.close();
	}
	function openPopup(url, name, width, height) {
		window
				.open(
						url,
						name,
						"'width="
								+ width
								+ ",height="
								+ height
								+ ", directories=0,titlebar=0,toolbar=0,status=no,scrollbars=yes,toolbar=no,menubar=no,location=no'");
	}
</script>
</head>

<body
	onload="javascript:openPopup('index', 'login', 1600, 1000); window.close(); ">

	<p>페이지가 안 보일 때에는 팝업 차단을 해제해 주시기 바랍니다.</p>

</body>
</html>