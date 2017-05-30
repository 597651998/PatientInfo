<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery用户注册表单验证代码</title>
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js"></script>
<script language='javascript' src="js/jq22.js"></script>
<script>
function submitguahao(){
	$("form").submit();
}
</script>
</head>
<body>
	<div class='body_main'>
		<!-- start main content -->
		<div class='index_box' style='margin-top: 20px;'>
			<div
				style="position: fixed; color: red; margin: 70px 0 0 450px; font-size: 16px; Z-index: 100; display: block;"
				id="hint"></div>
			<div class='box_title'>
				<div class='text_content'>
					<h1>挂号系统用户注册</h1>
				</div>
			</div>
			<div class='box_main'>
				<div id="register" class="register">
					<form id="form" action="user/regist" method="post"
						onSubmit="return check();">
						<div id="form_submit" class="form_submit">
							<div class="fieldset">
								<div class="field-group">
									<label class="required title">用户名</label> <span
										class="control-group" id="username_input">
										<div class="input_add_long_background">
											<input class="register_input" type="text" id="username"
												name="guahaousername" maxLength="11" value=""
												onblur="__changeGuahaoUserName('username');">
										</div>
									</span> <label class="tips">登录时使用<span style="color: red;">成功后自动跳转到登录界面!</span></label>
								</div>
								<div class="field-group">
									<label class="required title">手机号码</label> <span
										class="control-group" id="mobile_input">
										<div class="input_add_long_background">
											<input class="register_input" type="text" id="mobile"
												name="phoneNumber" maxLength="11" value=""
												onblur="__changeUserName('mobile');">
										</div>
									</span> <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
								</div>
								<div class="field-group">
									<label class="required title">邮箱</label> <span
										class="control-group" id="email_input">
										<div class="input_add_long_background">
											<input class="register_input" type="text" id="email"
												name="guahaoemail" maxLength="50" value=""
												onblur="__changeUserName('email');">
										</div>
									</span> <label class="tips">请输入您常用的邮箱</label>
								</div>
								<div class="field-group">
									<label class="required title">登录账号</label> <span
										class="control-group" style="line-height: 28px;"> <input
										id="way_mobile" type="radio" value="mobile"
										name="usernameByphone" checked
										onclick="__changeUserName('mobile');"> 手机号码 <input
											id="way_email" type="radio" value="email" name="phoneNumber"
											onclick="__changeUserName('email');"> 邮箱 </span> <label
										class="tips" style="margin-bottom: 5px;" id="tooltext1">请选择以哪个作为您的登录账号</label>
								</div>
								<div class="field-group">
									<label class="required title">设置密码</label> <span
										class="control-group" id="password1_input">
										<div class="input_add_long_background">
											<input class="register_input" type="password" id="password1"
												name="guahaopassword" maxLength="20" value=""
												onblur="checkPwd1(this.value);" />
										</div>
									</span> <label class="tips">请使用6~20个英文字母（区分大小写）、符号或数字</label>
								</div>
							</div>
						</div>
						<div id="div_submit" class="div_submit">
							<div class='div_submit_button'>
								<input id="submitS" onclick="submitguahao()" type="button"value="注册"
									class='button_button disabled'>
							</div>
						</div>
					</form>
				</div>
				<script type="text/javascript">
					
				</script>
			</div>
			<div class='box_bottom'></div>
		</div>
	</div>
	<button onclick=""></button>
</body>
</html>
