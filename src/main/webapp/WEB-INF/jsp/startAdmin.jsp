<%@ page language="java" session="false" isErrorPage="false"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>No-one should see this!</title>

<script type="text/javascript" language="Javascript1.5">
	function winClose() {
		self.close();
		window.close();
	}
	function doOnload(url, name, width, height) {
		window.open(url, name, "width=" + width + ",height=" + height
				+ ",status=no,toolbar=no,menubar=no,location=no");
	}
</script>
</head>

<body onload="doOnload('admin', 'admin', 1350, 920); window.close();">

	<p>Window is closing...</p>

</body>
</html>