<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="WEB-INF/common/css.jsp"%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="css/common.css" />
<title>社区医院远程挂号系统登录</title>
</head>
<script type="text/javascript">
 

	function hrefValue(){
		window.location.href="guahaoregist.jsp";
	}
	
	function loadimage(){
		document.getElementById("randImage").src = "<%=rootPath%>image.jsp?"+ Math.random();
	}
	
	function loginMethod() {
		 var todo = function(){
			return document.getElementById(arguments[0]);
		}; 
		var GuahaoUser = {};
		GuahaoUser.guahaousername = $("#userName").val();
		GuahaoUser.guahaopassword = $("#password").val();
		GuahaoUser.isManager = $("#isManager").val();
		$.ajax({
			type : "post",
			url : "login",
			data : GuahaoUser,
			dataType : "text",
			success : function(arg) {
				if (arg == 'nousernmae') { 	
					alert(arg)
				} else if (arg == 'errorpass') {
					alert(arg);
				} else if (arg == 'nopower') {
					window.location.href = "index_user.jsp";
				} else if (arg == 'managersuccess') {
					window.location.href = "main.jsp";
				} else if (arg == 'usersuccess') {
					window.location.href = "index_user.jsp";
				}
			}
		});
	}

	//挂号弹出框
	var w, h, className;

	function getSrceenWH() {
		w = $(window).width();
		h = $(window).height();
		$('#dialogBg').width(w).height(h);
	}

	window.onresize = function() {
		getSrceenWH();
	}
	$(window).resize();

	$(function() {
		getSrceenWH();

		$('.box a').click(
				function() {
					className = $(this).attr('class');
					$('#dialogBg').fadeIn(300);
					$('#dialog').removeAttr('class').addClass(
							'animated ' + className + '').fadeIn();
				});

		$('.claseDialogBtn').click(function() {
			$('#dialogBg').fadeOut(300, function() {
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});
	});
</script>
<body>
	<form id="form" method="post">
		<div class="Main">
			<ul>
				<li style="text-align: center;" class="top"><h1
						style="color: #666666;">管理员登录</h1></li>
				<li class="top2"></li>
				<li class="topA"></li>
				<li class="topB"><span> <img
						src="<%=rootPath%>images/login/logo.png"/>
				</span></li>
				<li class="topC"></li>
				<li class="topD">
					<ul class="login">
						<li><span class="left">用户名:</span> <span > <input
								type="text" name="userName" id="userName" />

						</span></li>
						<li><span class="left">密 码:</span> <span > <input
								type="password" name="password" id="password" />
						</span></li>
						<li><span class="left">验证码:</span> <span> <input
								type="text" value="${imageCode}" name="imageCode"
								id="imageCode" size="10" />
						</span> <span style=""> <img onclick="javascript:loadimage();"
								title="换一张试试" name="randImage" id="randImage" src="image.jsp"
								width="60" height="20" border="1" align="absmiddle">
						</span></li>
						<li><span style="margin-left: 25px"><font color="red"
								size=4>${error }</font></span></li>
					</ul>
				</li>
				<li class="topE"></li>
				<li class="middle_A"></li>
				<li class="middle_B"></li>
				<li class="middle_C"><span style="margin: 15px"><input
						type="button" class="bounceIn" onclick="loginMethod()" value="登录" /></span>
					<span style="margin: 10px"><input type="button" value="重置"
						onclick="resetValue()" /></span> <span style="margin: 10px"><input
						type="button" onclick="hrefValue()" value="立即注册"
						href="guahaoregist.jsp" /></span><br> <span> <input
						type="checkbox" style="margin-left: 15px;" id="isManager"
						name="isManager" size="10" />
				</span><span>是否是管理员</span>
				<li class="middle_D"></li>
				<li class="bottom_A"></li>
				<li class="bottom_B">www.java1234.com</li>
			</ul>
		</div>
	</form>
		<div class="hide_box" id="testBox"> 
	<h4><a href="javascript:void(0)" title="警告">&times;</a>警告</h4>
	<p></p> 
</div> 
</body>
</html>