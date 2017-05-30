<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.shCircleLoader.js" type="text/javascript"></script>
<title>注册成功</title>
<style type="text/css">
body {
	text-align: center;
}

h2 {
	margin: 5px;
	padding: 0
}

div[id] {
	width: 100px;
	height: 100px;
	margin: 10px auto;
}

span {
	font-family: monospace;
	font-size: 14px
}

pre {
	text-align: left;
	margin: 0 auto;
	border: 1px solid #888;
	padding: 3px;
	width: 400px;
	background: #eee
}

.myns>div {
	box-shadow: 0 0 6px black, inset 0 0 6px black;
}
</style>
</head>
<body>
	<div style="margin-top: 20%">
		<span>注册成功3秒后跳转到登录界面</span>
		<div id="shclNs"></div>
	</div>
</body>
<script language="JavaScript" src="" id="my"></script>
<script type="text/javascript">
	function A() {
		window.location.href = "http://localhost:8080/patientinfo-web/indexlogin.jsp";
	}
	$(function() {
		setTimeout('A()', 3000); //延迟3秒
	})
	$('#shclNs').shCircleLoader({
		namespace : "myns",
		color : "transparent",
		dotsRadius : 15
	});
</script>
</html>