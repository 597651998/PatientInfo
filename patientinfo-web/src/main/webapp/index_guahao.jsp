<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="css/searchMeme.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/unslider.min.js" type="text/javascript"></script>
<script src="js/jquery.searchMeme.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/xq_navbar.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/xq.css" />
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.js"
	type="text/javascript"></script>
<script src="js/xq_navbar.js" type="text/javascript"></script>
<script type="text/javascript">
	$('#search-orange').click(function() {

	})
	$(document).ready(
			function() {

				var searchOrange = $('#search-orange').searchMeme(
						{
							onSearch : function(searchText) {

								setTimeout(function() {

									searchOrange.searchMeme({
										searchComplete : true
									});

									$('#search-results').html(
											"You searched for "
													+ searchOrange.val() + "");

									$('.panel').animate({
										'height' : 200
									}, 500);

								}, 3000);

							}

							,
							buttonPlacement : 'left',
							button : 'orange'

						});

				var searchGreen = $('#search-green').searchMeme(
						{
							onSearch : function(searchText) {

								setTimeout(function() {

									searchGreen.searchMeme({
										searchComplete : true
									});

									$('#search-results').html(
											"You searched for "
													+ searchGreen.val() + "");

									$('.panel').addClass('go-green').animate({
										'height' : 200
									}, 500);

								}, 3000);

							}

							,
							buttonPlacement : 'right',
							button : 'green'

						});

				var searchRed = $('#search-red').searchMeme(
						{
							onSearch : function(searchText) {

								setTimeout(function() {

									searchRed.searchMeme({
										searchComplete : true
									});

									$('#search-results').html(
											"You searched for "
													+ searchRed.val() + "");

									$('.panel').animate({
										'height' : 200
									}, 500, function() {

										alert('This is demo 3');

									});

								}, 3000);

							}

							,
							buttonPlacement : 'left',
							button : 'red'

						});

				$('.wrapper-green,.wrapper-red').css('display', 'none');

				$('a').click(
						function() {

							$('.panel').removeClass('go-green');

							$('.wrapper-orange,.wrapper-green,.wrapper-red')
									.css('display', 'none');

							if ($(this).attr('class') == 'search-orange')

								$('.wrapper-orange').css('display', '');

							else if ($(this).attr('class') == 'search-green')

								$('.wrapper-green').css('display', '');

							else if ($(this).attr('class') == 'search-red')

								$('.wrapper-red').css('display', '');

							$('.panel').html('Search results here...').animate(
									{
										'height' : 100
									}, 500);

							return false;

						});

			});

	//搜索框特效
	$(function() {
		$("#bar1").xq_navbar({
			"type" : "underline",
			"liwidth" : "auto",
			"bgcolor" : "#000",
			"hcolor" : "#F0FAFF"
		});
		$("#bar2").xq_navbar({
			"type" : "beat",
			"liwidth" : "avg",
			"bgcolor" : "#000",
			"hcolor" : "#F0FAFF"
		});
		$("#bar3").xq_navbar({
			"type" : "line",
			"liwidth" : "avg",
			"bgcolor" : "#000"
		});
		$("#bar4").xq_navbar({
			"type" : "overline",
			"liwidth" : "120",
			"bgcolor" : "#000"
		});
		$("#bar5").xq_navbar(
				{
					"type" : "block",
					"liwidth" : "avg",
					"bgcolor" : "#000",
					"hcolor" : [ "blue", "rgb(10,100,100)", "red", "blue",
							"green", "rgba(23,234,22,1)", "rgb(230,230,230)" ]
				});
	});
	/*轮播图*/

	$(document).ready(function(e) {
		var unslider04 = $('#b04').unslider({
			dots : true
		}), data04 = unslider04.data('unslider');
		$('.unslider-arrow04').click(function() {
			var fn = this.className.split(' ')[1];
			data04[fn]();
		});
	}

	);
</script>
<style type="text/css">
.demobar {
	height: 90px;
	line-height: 90px;
}

.demobar .fleft {
	float: left;
	margin-left: 10px;
}

.demobar .fright {
	float: right;
	margin-top: 14px;
	margin-right: 10px;
}

#demo-side-bar {
	position: absolute;
	top: 90px;
	display: none;
}

ul, ol {
	padding: 0;
}

.banner {
	position: relative;
	overflow: auto;
	text-align: center;
}

.banner li {
	list-style: none;
}

.banner ul li {
	float: left;
}

#b04 {
	margin-top: -100px;
	margin-left: 10.5%;
	width: 640px;
}

#b04 .dots {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 20px;
}

#b04 .dots li {
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: 0 4px;
	text-indent: -999em;
	border: 2px solid #fff;
	border-radius: 6px;
	cursor: pointer;
	opacity: .4;
	-webkit-transition: background .5s, opacity .5s;
	-moz-transition: background .5s, opacity .5s;
	transition: background .5s, opacity .5s;
}

#b04 .dots li.active {
	background: #fff;
	opacity: 1;
}

#b04 .arrow {
	position: absolute;
	top: 200px;
}

#b04 #al {
	left: 15px;
}

#b04 #ar {
	right: 15px;
}
</style>

</head>

<body id="background-guahao">
	<div>
		<img style="margin-left: 150px;" src="images/7.png" />
		<div style="margin-left: 865px;">
			<input type="text" id="search-orange" />
		</div>
	</div>

	<div class="xq_bag" id="bar2">

		<ul class="xq_navbar">
			<li class="xq_navli"><a href="http://localhost:8080/patientinfo-web/index_user.jsp">首页</a></li>
			<li class="xq_navli"><a href="#">新闻中心</a></li>
			<li class="xq_navli"><a href="show/myselfMessage">个人中心</a></li>
			<li class="xq_navli"><a href="index_guahao.jsp">预约挂号</a></li>
		<li class="xq_navli"><a href="http://localhost:8080/patientinfo-web/Message.jsp">意见反馈</a></li>
			<li class="xq_navli"><a href="#">系统简介</a></li>
		</ul>
		<script>
			$(".xq_navli a").on('click', function() {
				var url = $(this).attr("href")
				window.location.href = url;
			})
		</script>
	</div>
	<div class="banner" id="b04">
		<ul>
			<li><img src="images/01.jpg" alt="" width="1200" height="480"></li>
			<li><img src="images/02.jpg" alt="" width="1200" height="480"></li>
			<li><img src="images/03.jpg" alt="" width="1200" height="480"></li>
			<li><img src="images/04.jpg" alt="" width="1200" height="480"></li>
			<li><img src="images/05.jpg" alt="" width="1200" height="480"></li>
		</ul>
	</div>
	<div style="width: 79%; height: 1000px; margin-left: 10.5%;">
		<div class="title_xinwen1" style="height: 300px;">
			<form action="user/index_guahao" method="post">
				<span style="font-size: 15px;">填写相关资料</span>
				<div class="form-group" style="margin-left: 40%;">
					<label for="exampleInputName2">用户姓名</label> <input type="text"
						class="form-control" style="width: 250px;" id="exampleInputName2"
						name="guahaousername" placeholder="请输入用户姓名">
				</div>
				<div class="form-group" style="margin-left: 40%;">
					<label for="exampleInputName2">身份证号</label> <input type="text"
						class="form-control" style="width: 250px;" id="exampleInputName2"
						name="idCard" placeholder="请输入身份证号">
				</div>
				<div class="form-group" style="margin-left: 40%;">
					<label for="exampleInputName2">手机号码</label> <input type="text"
						class="form-control" style="width: 250px;" id="exampleInputName2"
						name="phoneNumber" placeholder="请输入手机号码">
				</div>

				<div style="margin-left: 40%;" class="checkbox">
					<label> <input type="checkbox" name="isReally"><span
						style="">我已阅读并接受《郑州市预约挂号服务平台服务协议》 点击查看</span>
					</label>
				</div>
				<button type="submit" style="margin-left: 40%;"
					class="btn btn-default">下一步</button>
			</form>
		</div>
		<!------------------------------------------------------------------------->
		<hr
			style="margin-top: -5px; border: 5px solid #0e3872; margin-top: 10px;" />
		<div style="text-align: center;">
			<span>Copyright © 2012-2017 郑州市卫生和计划生育委员会 郑州市卫生计生统计信息中心
				郑州市xxxxxxxx卫生热线 <br />
			</span><span> 地址：xxxxxxxx 邮编：xxxxxxxx <br /> <span /><span>
					技术支持：xxxxxxxx有限公司<br />
			</span><span> 链接网址：www.xxxxxxxx.com</span>
		</div>
	</div>
	</div>

</body>
</html>