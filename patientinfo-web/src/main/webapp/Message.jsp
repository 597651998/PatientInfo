<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Trendy Contact Form a Responsive Widget Template ::
	w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Trendy Contact Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Custom Theme files -->
<link href="css/stylemessage.css" rel="stylesheet" type="text/css"
	media="all" />
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="js/bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript"></script>
<!-- //Custom Theme files -->
<!-- web font -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!--web font-->
<!-- //web font -->
</head>
<body>
	<!-- main -->
	<div class="main-agileits">
		<h1 style="color: white;">意见与医生反馈</h1>
		<div class="contact-agileinfo">
			<div class="contact-w3ls-top">
				<h2>提出建议</h2>
				<h5>您宝贵的建议能使我们的服务更加到位!</h5>
			</div>
			<div class="contact-w3ls-bottom">
				<form action="/patientinfo-web/saveMessage" id="messageform" method="post">
					<input class="agile-ltext" type="text" name="guahaousername"
						placeholder="请输入您的姓名" required=""> <input
						class="agile-ltext" type="text" name="doctorName"
						placeholder="请输入医生的姓名" required=""> <input
						class="agile-ltext" type="text" name="doctorhospital"
						placeholder="请输入医院名称" required="">
					<div class="agileits-w3text">
						<textarea class="agile-ltext" name="user_messageDesc"
							placeholder="请输入您宝贵的意见" required=""></textarea>
					</div>
					<input type="button" onclick="saveMessage()" value="提交意见">
				</form>
				<script type="text/javascript">
					function saveMessage() {
					var dat = $("#messageform").serialize();
						$.ajax({ 
							url: "/patientinfo-web/saveMessage", 
							data: dat, 
							success: function(){
						    $(this).addClass("done");
							$("#message_btn").trigger("click")
							setTimeout('A()', 3000); //延迟3秒
						    
						}});
					
					}
					function A(){
						location.href="index_user.jsp";
						}
				</script>
			</div>
		</div>
		<!-- Small modal -->
		<button type="button" class="btn btn-primary" style="display:none;" data-toggle="modal"
			data-target=".bs-example-modal-sm" id="message_btn">Small modal</button>

		<div class="modal fade bs-example-modal-sm" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">意见提交成功，返回首页</div>
			</div>
		</div>
	</div>
	<!-- //main -->
	<!-- copyright -->
	<div class="w3copyright-agile">
		<p>
			© 2017 社区挂号系统 意见 | 反馈 <a href="http://w3layouts.com/" target="_blank">加入我们</a>
		</p>
	</div>
	<!-- //copyright -->
</body>
</html>