<%@page language="java" pageEncoding="UTF-8"%>
<%
	String rootPath_css = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ request.getContextPath() + "/";
	String version_css = "20160606";
%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
		<meta name="renderer" content="webkit">
		<meta name="description" content="卫生监管系统">
		<meta name="keywords" content="卫生监管系统">
		<meta name="author" content="tsolong">
		
	<%-- 
			<script src="<%=rootPath_css%>assets/js/plugins/html5shiv.js?v=<%=version_css%>"></script>
			<script src="<%=rootPath_css%>assets/js/plugins/respond.min.js?v=<%=version_css%>"></script> --%>
	
		
		<link rel="stylesheet" href="<%=rootPath_css%>style/alogin.css?v=<%=version_css%>">
	
		<%-- <link rel="stylesheet" href="<%=rootPath_css%>assets/css/plugins/messenger.css?v=<%=version_css%>">
		<link rel="stylesheet" href="<%=rootPath_css%>assets/css/plugins/messenger-theme-flat.css?v=<%=version_css%>">
		<link rel="stylesheet" href="<%=rootPath_css%>assets/css/plugins/jquery.datetimepicker.css?v=<%=version_css%>">
		<link rel="stylesheet" href="<%=rootPath_css%>assets/css/common/common.css?v=<%=version_css%>">
		<link rel="stylesheet" href="<%=rootPath_css%>assets/css/modules/page.css?v=<%=version_css%>"> --%>