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
								+ ", directories=0,titlebar=0,toolbar=0,status=no,toolbar=no,menubar=no,location=no'");
	}
</script>
</head>

<body
	onload="javascript:openPopup('index', 'login', 1600, 1000); window.close(); ">

	<p>Window is closing...</p>

</body>
</html>