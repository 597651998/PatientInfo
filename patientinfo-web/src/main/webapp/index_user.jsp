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
<link rel="stylesheet" href="css/xq.css" />
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

<body>
	<div>
		<img style="margin-left: 150px;" src="images/7.png" />
		<div style="margin-left: 865px;">
			<input type="text" id="search-orange" />
		</div>
	</div>

	<div class="xq_bag" id="bar2">

		<ul class="xq_navbar">
			<li class="xq_navli"><a href="#">首页</a></li>
			<li class="xq_navli"><a href="#">新闻中心</a></li>
			<li class="xq_navli"><a href="show/myselfMessage">个人中心</a></li>
			<li class="xq_navli"><a href="index_guahao.jsp">预约挂号</a></li>
			<script>
				$(".xq_navli a").on('click',function (){
					var url = $(this).attr("href")
					window.location.href = url;
				})
			</script>
			<li class="xq_navli"><a href="#">在线留言</a></li>
			<li class="xq_navli"><a href="#">系统简介</a></li>
		</ul>

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
	<div
		style="width: 79%; height: 800px; margin-left: 10.5%; margin-top: -7px;">
		<div class="title_xinwen1" style="height: 300px;">
			<div
				style="height: 40px; background: #DAEAF5; height: 45px; width: 49%; float: right;">
				<span class="title_xinwen">新闻动态</span>
				<div class="title_xinwen2">
					<ul>
						<li class="li_1"><a href="#">新闻动态更多+关于微信预约挂号短信停发的通知 </a><span
							style="float: right;">2017-05-12</span></li>
						<li class="li_1"><a href="#">郑州市12320卫生热线公益性岗位招... </a><span
							style="float: right;">2017-05-12</span></li>
						<li class="li_1"><a href="#">5月专家在线排班名单 </a><span
							style="float: right;">2017-05-13</span></li>
						<li class="li_1"><a href="#">中医院门诊变更通知 </a><span
							style="float: right;">2017-05-13</span></li>
						<li class="li_1"><a href="#">上海银行系统升级暂停预约挂号业务通知</a><span
							style="float: right;">2017-05-12</span></li>
						<li class="li_1"><a href="#">黑名单规则</a><span
							style="float: right;">2017-05-11</span></li>
					</ul>
				</div>
			</div>

			<div class=""
				style="height: 40px; background: #DAEAF5; width: 49%; height: 45px; float: left;">
				<span class="title_xinwen">公告</span>
				<div class="title_xinwen2">

					<span id="title_xinwen3"> 12320预约挂号时间：电话每天7:30-17:00；<br>网站、微信全天开放（第7天的专家号下午1点开始预约）（所有途径共享号源）
						退号截止时间：就诊前1天（退号号源释放在第2天下午1点） 心理咨询时间：周一至周五
						8:00-17:00（11:30-13:30为休息时间） 专家在线咨询：每周二、周五
						9:00-17:00（11:30-13:30为休息时间）
					</span>
				</div>
			</div>
			<img style="margin-top: 260px;" src="images/06.png" alt=""
				width="1200" height="120">
		</div>
		<div class="title_xinwen1" style="height: 300px; margin-top: 120PX;">
			<div
				style="height: 40px; background: #DAEAF5; height: 45px; width: 49%; float: right;">
				<span class="title_xinwen">疾病防治</span>
				<div class="title_xinwen2">
					<ul>
						<li class="li_1"><a href="#">晨起吃姜有效防治手脚冰凉 </a></li>
						<li class="li_1"><a href="#">冬季滋补养生避开5大误区 </a></li>
						<li class="li_1"><a href="#">几天洗一次头最健康</a></li>
						<li class="li_1"><a href="#">12月养生可多吃羊肉菠菜 </a></li>
						<li class="li_1"><a href="#">4种反季节水果冬季不宜吃</a></li>
						<li class="li_1"><a href="#">专家解读食品添加剂“亚硝酸盐”</a></li>
					</ul>
				</div>
			</div>

			<div class=""
				style="height: 40px; background: #DAEAF5; width: 49%; height: 45px; float: left;">
				<span class="title_xinwen">预防接种</span>
				<div class="title_xinwen2">

					<ul>
						<li class="li_1"><a href="#">郑州市狂犬病暴露预防处置门诊一览表 </a></li>
						<li class="li_1"><a href="#">郑州各市、区儿童免疫接种门诊一览表(20...</a></li>
						<li class="li_1"><a href="#">儿童预防接种 </a></li>
						<li class="li_1"><a href="#">乙肝 </a></li>
						<li class="li_1"><a href="#">狂犬病 </a></li>
						<li class="li_1"><a href="#">卡介苗 </a></li>
					</ul>
				</div>
			</div>
			<form action="" method="post" id="editForm"></form>
		</div>
		<hr
			style="margin-top: -5px; border: 5px solid #0e3872; margin-top: 10px;" />
		<div style="text-align: center;">
			<span>Copyright © 2012-2017 郑州市卫生和计划生育委员会 郑州市卫生计生统计信息中心
				郑州市xxxxxxxx卫生热线 <br />
			</span><span> 地址：xxxxxxxx 邮编：xxxxxxxx <br />
			<span /><span> 技术支持：xxxxxxxx有限公司<br /></span><span>
					链接网址：www.xxxxxxxx.com</span>
		</div>
	</div>
	</div>

</body>

</html>