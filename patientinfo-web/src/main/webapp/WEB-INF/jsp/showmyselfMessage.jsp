<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="../js/jquery.min.js"></script>


<link href="../css/demotest.css" rel="stylesheet" media="all">

</head>

<body>

	<ul id="nav">

		<li class="current"><a href="#intro">我的账户</a></li>

		<li><a href="#usage">我的订单</a></li>

		<li><a href="#options">账户设置</a></li>

		<li><a href="#examples">消息中心</a></li>

	</ul>

	<div id="container">

		<div class="section" id="intro">
			<div>
				<h1>用户信息</h1>
				<p style="float: left;">
					当前登陆的用户姓名是：<span>${userinfo.guahaousername}</span>
				</p>
			</div>
			<br>
			<hr>
			<h1>个人中心</h1>
			<p style="float: left;">
				您当前的余额是：<span style="color: coral">￥</span>
			</p>
			<div style="margin-left: 200px;">
				<button class="btn btn-default" type="button">充值</button>
				<button class="btn btn-default" type="button">提现</button>
			</div>
		</div>

		<div class="section" id="usage">

			<h2>挂号信息</h2>
			<table class="table table-striped">
				<thead>
					<th>挂号编号</th>
					<th>挂号医生名称</th>
					<th>挂号科室</th>
					<th>挂号医院</th>
					<th>挂号时间</th>
					<th>挂号金额</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${messasgeinfo}" var="list">
						<tr>
							<td>${list.guahao_id}</td>
							<td>${list.doctorName}</td>
							<td>${list.officeName}</td>
							<td>${list.doctorhospital}</td>
							<td>${list.quren_guahaotime}</td>
							<td>${list.guahaomoney}</td>
							<td><a href="">修改</a> <a s
								onclick="deleteinfo(${list.guahao_id}, this)">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
			function deleteinfo(arg, this_){
				$.ajax({
					type : "get",
					url : "/patientinfo-web/show/deletemyselfMessage",
					data: "id="+arg,
					dataType:"text",
					async : true,
					  success: function(msg){
						  if (msg)
						  $(this_).parent().parent().fadeOut("slow");
					}

				});
			}
			</script>
		</div>

		<div class="section" id="options">
			<div class="loseget-content">
				<h4>填写详细信息</h4>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#loseget-lose" data-toggle="tab">个人信息</a>
					</li>
					<li><a href="#loseget-get" data-toggle="tab">修改个人信息</a></li>
					<li><a href="#loseget-pass" data-toggle="tab">修改密码</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="loseget-lose">

						<div class="input-group">
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">用户名</span> <input
									type="text" class="form-control"
									placeholder="${userinfo.guahaousername}" disabled="disabled"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">手机号</span> <input
									type="text" class="form-control"
									placeholder="${userinfo.phoneNumber}" disabled="disabled"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">邮&nbsp;&nbsp;&nbsp;箱</span>
								<input type="text" class="form-control"
									placeholder="${userinfo.guahaoemail}" disabled="disabled"
									aria-describedby="sizing-addon2">
							</div>

						</div>
					</div>

					<!--第二个切换页面-->
					<div class="tab-pane fade" id="loseget-get">
						<form action="#" method="post">
							<div class="input-group" style="display: none;">
								<span class="input-group-addon" id="sizing-addon2">id</span> <input
									type="text" class="form-control" placeholder="Username"
									value="${userinfo.user_id}" aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="guahaousername">用户名</span> <input
									type="text" class="form-control"
									placeholder="${userinfo.guahaousername}" name="guahaousername"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="idCard">证件号</span> <input
									type="text" class="form-control"
									placeholder="${userinfo.idCard}" name="idCard"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="guahaoemail">邮&nbsp;&nbsp;&nbsp;箱</span>
								<input type="text" class="form-control"
									placeholder="${userinfo.guahaoemail}" name="guahaoemail"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="phoneNumber">手机号</span> <input
									type="text" class="form-control"
									placeholder="${userinfo.phoneNumber}" name="phoneNumber"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div style="text-align: center;">

								<button type="button" onclick="updateUser()"
									class="btn btn-default">确认修改</button>

							</div>
						</form>
						<script type="text/javascript">
						function updateUser(){
							var GuahaoUser = {};
							GuahaoUser.user_id =${userinfo.user_id};
							GuahaoUser.guahaousername =$(" input[ name='guahaousername' ]").val();
							GuahaoUser.idCard =$(" input[ name='idCard' ]").val();
							GuahaoUser.guahaoemail =$(" input[ name='guahaoemail' ]").val();
							GuahaoUser.phoneNumber =$(" input[ name='phoneNumber' ]").val();
							$.ajax({
								type : "post",
								url : "/patientinfo-web/show/updatemyselfMessage",
								data: GuahaoUser,
								dataType:"text",
								async : true,
								  success: function(msg){
									  if(msg)
										  $("#132").trigger("click")
										  setTimeout(function () {
											  	 window.location.reload();
											  }, 3000); //延迟3秒
										 
								}

							});
						}
						</script>
					</div>

					<!--第三个切换页面-->
					<div class="tab-pane fade" id="loseget-pass">
						<form id="changePassForm" action="#" method="post">
							<div class="input-group" style="display: none;">
								<span class="input-group-addon" id="sizing-addon2">id</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon">初始密码</span> <input
									type="password" class="form-control" name="old_pass"
									placeholder="请输入初始密码">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon">新的密码</span> <input
									type="password" name="new_pass" class="form-control"
									placeholder="请输入新的密码">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon">确认密码</span> <input
									type="password" name="confirm_pass" class="form-control"
									placeholder="再次输入新的密码">
							</div>
							<br />
							<div style="text-align: center;">

								<button type="button" onclick="changePass(${userinfo.user_id})"
									class="btn btn-default">确认修改</button>

							</div>
						</form>
						<script type="text/javascript">
						function changePass(id){
							var flag = true;
							$("#changePassForm input[class='form-control']").each(function(i){
								if(!$(this).val()){
									flag = false;
									$(this).parent("div").addClass("has-error");
								} else {
									flag = true;
									$(this).parent("div").removeClass("has-error");
								}
							});
							if(flag) {
								var new_pass=$("#changePassForm input[name='new_pass']").val();
								var confirm_pass=$("#changePassForm input[name='confirm_pass']").val();
								console.log(new_pass);
								console.log(confirm_pass);
								if(new_pass != confirm_pass){
									flag = false;
									$("#changePassForm input[name='confirm_pass']").parent("div").addClass("has-error");
								}else{
									flag = true;
									$("#changePassForm input[name='confirm_pass']").parent("div").removeClass("has-error");
								}
							}
							
							if (flag) {
								$.ajax({
									type : "post",
									url : "/patientinfo-web/show/cheganemyselfpass",
									data: $("#changePassForm").serialize(),
									dataType:"text",
									async : true,
									  success: function(msg){
										  if (msg)
											  console.log(msg);
										  if(msg=="timeout"){
											  $("#pass_message").text("超时请重新登录3秒后跳转到登录");
											  $("#changepassxinxi").trigger("click");
											  setTimeout(function () {
												  	 window.location.href="http://localhost:8080/patientinfo-web/indexlogin.jsp";
												  }, 3000); //延迟3秒											  
										  }else if(msg=="changepasssuccess"){
											  $("#pass_message").text("修改成功请重新登录3秒后跳转到登录");  
											  $("#changepassxinxi").trigger("click");
											  setTimeout(function () {
												  	 window.location.href="http://localhost:8080/patientinfo-web/indexlogin.jsp";
												  }, 3000); //延迟3秒	
										  }else if(msg=="oldpasserror"){
											  $("#pass_message").text("原始密码错误");  
											  $("#changepassxinxi").trigger("click");
										  }
									}

								});
							}
						}
						</script>
					</div>

				</div>
			</div>

		</div>

		<div class="section" id="examples">

			<h2>消息中心</h2>
			<table class="table table-striped">
				<thead>
					<th>意见编号</th>
					<th>意见人名称</th>
					<th>医生的名称</th>
					<th>医院</th>
					<th>具体内容</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${idearsinfo}" var="list">
						<tr>
							<td>${list.message_id}</td>
							<td>${list.guahaousername}</td>
							<td>${list.doctorName}</td>
							<td>${list.doctorhospital}</td>
							<td>${list.user_messageDesc}</td>
							<td><a onclick="findmessageByid(${list.message_id}, this)">查看详情</a>
								<a onclick="deletemessageinfo(${list.message_id}, this)">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
function deletemessageinfo(arg, this_){
	$.ajax({
		type : "get",
		url : "/patientinfo-web/show/deletemyselfideaMessage",
		data: "id="+arg,
		dataType:"text",
		async : true,
		  success: function(msg){
			  if (msg)
			  $(this_).parent().parent().fadeOut("slow");
		}

	});
}

function findmessageByid(arg, this_){
	$.ajax({
		type : "get",
		url : "/patientinfo-web/show/findmessageByid",
		data: "id="+arg,
		dataType:"json",
		async : true,
		  success: function(msg){
			  if (msg)
			 console.log(msg);
			  $("#showusername").val(msg.guahaousername);
			  $("#showdoctorname").val(msg.doctorName);
			  $("#showdoctorhospital").val(msg.doctorhospital);
			  $("#showdesc").val(msg.user_messageDesc);
			  $("#xiangxi").trigger("click")
			  
		}

	});
}
</script>
		</div>

	</div>

	<!--[if lte IE 8]><script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script><![endif]-->

	<!--[if gt IE 8]><!-->
	<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<!--<![endif]-->
	<link href="../js/bootstrap-3.3.7-dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script src="../js/jquery.nav.js"></script>

	<script>
		$(document).ready(function() {

			$('#nav').onePageNav();

		});

		$('#myTabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
	<button type="button" class="btn btn-primary" style="display: none;"
		id="132" data-toggle="modal" data-target=".bs-example-modal-sm">Small
		modal</button>

	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content" style="text-align: center;">
				<h4 style="margin-top: 10%;" class="modal-title">提示</h4>
				<hr />
				<span style="font-size: 15px;"> 用户修改成功...</span>

			</div>
		</div>
	</div>



	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		style="display: none;" id="xiangxi" data-toggle="modal"
		data-target="#myModal">Launch demo modal</button>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">详细信息</h4>
				</div>
				<div class="modal-body" style="height: 300px;">
					<br>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">意见人名称</span> <input
							id="showusername" type="text" class="form-control"
							placeholder="Username" disabled="disabled"
							aria-describedby="basic-addon1">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">医生的名称</span> <input
							id="showdoctorname" type="text" class="form-control"
							placeholder="Username" disabled="disabled"
							aria-describedby="basic-addon1">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</span>
						<input id="showdoctorhospital" type="text" class="form-control"
							placeholder="Username" disabled="disabled"
							aria-describedby="basic-addon1">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">具体的意见</span>

						<textarea id="showdesc" disabled="disabled" class="form-control"
							rows="3"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 修改密码弹出 -->
	<!-- Modal -->
	<button type="button" class="btn btn-primary btn-lg"
		id="changepassxinxi" style="display: none;" data-toggle="modal"
		data-target="#myModalchangepass">Launch demo modal</button>
	<div class="modal fade" id="myModalchangepass" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body" style="height: 150px;">
					<h2 id="pass_message">1321646</h2>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
</body>

</html>