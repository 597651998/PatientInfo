<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>jQuery One Page Nav</title>

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

			<h1>个人中心</h1>
			<ul>

			</ul>
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
					<th>挂号医生名称</th>
					<th>挂号科室</th>
					<th>挂号医院</th>
					<th>挂号时间</th>
					<th>挂号金额</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
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
									type="text" class="form-control" placeholder="Username"
									disabled="disabled" aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">证件号</span> <input
									type="text" class="form-control" placeholder="Username"
									disabled="disabled" aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">性&nbsp;&nbsp;&nbsp;别</span>
								<input type="text" class="form-control" placeholder="Username"
									disabled="disabled" aria-describedby="sizing-addon2">
							</div>

						</div>
					</div>

					<!--第二个切换页面-->
					<div class="tab-pane fade" id="loseget-get">
						<form action="#" method="post">
							<div class="input-group" style="display: none;">
								<span class="input-group-addon" id="sizing-addon2">用户名</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">用户名</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">证件号</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">性&nbsp;&nbsp;&nbsp;别</span>
								<input type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">邮&nbsp;&nbsp;&nbsp;箱</span>
								<input type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">手机号</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div style="text-align: center;">

								<button type="submit" class="btn btn-default">确认修改</button>

							</div>
						</form>
					</div>

					<!--第三个切换页面-->
					<div class="tab-pane fade" id="loseget-pass">
						<form action="#" method="post">
							<div class="input-group" style="display: none;">
								<span class="input-group-addon" id="sizing-addon2">id</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">初始密码</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">新的密码</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon2">确认密码</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="sizing-addon2">
							</div>
							<br />
							<div style="text-align: center;">

								<button type="submit" class="btn btn-default">确认修改</button>

							</div>
						</form>
					</div>

				</div>
			</div>

		</div>

		<div class="section" id="examples">

			<h2>Examples</h2>

			<ul>

				<li><a href="filter.html">Filter out links</a></li>

				<li><a href="hash.html">Change hash</a></li>

				<li><a href="top.html">Horizontal Nav</a></li>

			</ul>

		</div>

	</div>

	<!--[if lte IE 8]><script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script><![endif]-->

	<script src="../js/jquery.min.js"></script>
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

</body>

</html>