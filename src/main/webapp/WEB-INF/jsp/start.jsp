<%@ page language="java" session="false" isErrorPage="false"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>No-one should see this!</title>

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