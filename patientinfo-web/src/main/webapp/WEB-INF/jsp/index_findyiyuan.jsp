<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="../css/searchMeme.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.min.js" type="text/javascript"></script>
<script src="../js/unslider.min.js" type="text/javascript"></script>
<script src="../js/jquery.searchMeme.js" type="text/javascript"></script>
<link rel="stylesheet" href="../css/xq_navbar.css" />
<link rel="stylesheet" href="../css/xq.css" />
<link rel="stylesheet" href="../css/easyui.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../css/jquery.datetimepicker.css" />
<script src="../js/xq_navbar.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../css/zeroModal.css" />
<script src="../js/zeroModal.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
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
					$('#dialog').removeAttr('class').addClass('animated ' + className + '').fadeIn();
				});

		$('.claseDialogBtn').click(function() {
			$('#dialogBg').fadeOut(300, function() {
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});
	});
	//查询对应医院医生
	function searchGh() {
		var hospitalName = $('#hospitalName').combobox('getValue');
		$("#dg").datagrid({
							queryParams : {
								'hospitalName' : hospitalName
								},
							url : "http://localhost:8080/patientinfo-web/user/index_findByhospital",
							method : "POST"
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

	//二层弹出
	function _button() {
		zeroModal.show({
					title : '提示',
					content : '预约成功，点击确定后跳转到首页',
					ok : true,
					okFn : function(opt) {
						//点击ok后的事件
						window.location.href = "http://localhost:8080/patientinfo-web/index_user.jsp";
						return false;
					}
				});
	}

	$(function() {

		getSrceenWH();

		$('.box a').click(
				function() {
					var selectedRows = $("#dg").datagrid('getSelections');
					var row = selectedRows[0];
					className = $(this).attr('class');
					var user_id = ${User.user_id};
					$('#dialogBg').fadeIn(300);
					$("#doctorName").val(row.doctorName);
					$("#officeName").val(row.officeName);
					$("#timeDesc").val(row.timeDesc);
					$("#user_id").val(user_id);
					$("#doctor_id").val(row.doctor_id);

					$("#quren_guahaotime").val(
							$("#guahaotime").datebox('getValue'));
					$("#guahaomoney").val(row.guahaomoney);

					$('#dialog').removeAttr('class').addClass(
							'animated ' + className + '').fadeIn();
				});

		$('.claseDialogBtn').click(function() {
			$('#dialogBg').fadeOut(300, function() {
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});

		//请求到后台进行数据处理
		$("#guahao_submit")
				.on(
						'click',
						function() {
							var infoUserCommond = {};
							var doctor_id = $("#doctor_id").val();
							var user_id = $("#user_id").val();
							var quren_guahaotime = $("#quren_guahaotime").val();
							infoUserCommond.doctor_id = doctor_id;
							infoUserCommond.user_id = user_id;
							infoUserCommond.quren_guahaotime = quren_guahaotime;
							$.ajax({
										url : 'http://localhost:8080/patientinfo-web/user/index_guahaosaveinfo',
										type : 'post',
										data : infoUserCommond,
										success : function() {
											_button();
											setTimeout("fun()", 5000);
										},
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

<body id="background-guahao">
	<div>
		<img style="margin-left: 150px;" src="../images/7.png" />
		<div style="margin-left: 865px;">
			<input type="text" id="search-orange" />
		</div>
	</div>

	<div class="xq_bag" id="bar2">

		<ul class="xq_navbar">
			<li class="xq_navli"><a
				href="http://localhost:8080/patientinfo-web/index_user.jsp">首页</a></li>
			<li class="xq_navli"><a href="#">新闻中心</a></li>
			<li class="xq_navli"><a
				href="http://localhost:8080/patientinfo-web/show/myselfMessage">个人中心</a></li>
			<li class="xq_navli"><a href="index_guahao.jsp">预约挂号</a></li>

			<li class="xq_navli"><a
				href="http://localhost:8080/patientinfo-web/Message.jsp">意见反馈</a></li>
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
			<li><img src="../images/01.jpg" alt="" width="1200" height="480"></li>
			<li><img src="../images/02.jpg" alt="" width="1200" height="480"></li>
			<li><img src="../images/03.jpg" alt="" width="1200" height="480"></li>
			<li><img src="../images/04.jpg" alt="" width="1200" height="480"></li>
			<li><img src="../images/05.jpg" alt="" width="1200" height="480"></li>
		</ul>
	</div>
	<div style="width: 79%; height: 1000px; margin-left: 10.5%;">
		<div class="title_xinwen1"">
			<div class="dropdown" style="height: 100%">
				<table id="dg" class="easyui-datagrid" fitColumns="true"
					pagination="true" rownumbers="true" url="" fit="true" toolbar="#tb">
					<thead>
						<tr>
							<th field="cb" id="guahaoCheckbox" checkbox="true"></th>
							<th field="doctorName" width="100" align="center">专家姓名</th>
							<th field="officeName" width="100" align="center">科室姓名</th>
							<th field="guahaomoney" width="100" align="center">费用￥</th>
							<th field="timeDesc" width="250" align="center">时间</th>
						</tr>
					</thead>
				</table>
				<div id="dialogBg"></div>
				<div id="dialog" class="animated">
					<div id="tb">
						<div class="box">
							&nbsp;选择医院：&nbsp; <input class="easyui-combobox"
								id="hospitalName" name="s_userId" size="10"
								data-options="panelHeight:'auto',editable:false,valueField:'hospitalName',textField:'hospitalName',url:'http://localhost:8080/patientinfo-web/user/index_findAllhospital'" />
							<button onclick="searchGh()" class="easyui-linkbutton"
								iconCls="icon-search">搜索</button>
							&nbsp;&nbsp;&nbsp;<span>用户：${User.guahaousername}</span>
							&nbsp;&nbsp;&nbsp;<span>选择预约时间</span><input type="text"
								class="easyui-datebox" name="guahaotime" id="guahaotime"
								editable="false" size="10" /> &nbsp;&nbsp;&nbsp; <a
								href="javascript:;" class="bounceIn">确认医生</a>
						</div>
					</div>

					<img class="dialogIco" width="50" height="50"
						src="../images/ico.png" alt="" />
					<div class="dialogTop">
						<a href="javascript:;" class="claseDialogBtn">关闭</a>
					</div>
					<form action="" method="post" id="editForm">
						<ul class="editInfos">
							<li>确认信息无误请点击下方按钮提交</li>
							<li><label><font color="#ff0000">* </font>专家姓名<input
									type="text" id="doctorName" name="" required value=""
									class="ipt" disabled="true " /> <input type="text"
									id="user_id" name="user_id" required style="display: none"
									value="" class="ipt" disabled="true " /><input type="text"
									id="doctor_id" name="doctor_id" required style="display: none"
									value="" class="ipt" disabled="true " /> </label></li>
							<li><label><font color="#ff0000">* </font>所在科室<input
									type="text" id="officeName" name="" required value=""
									class="ipt" disabled="true " /></label></li>
							<li><label><font color="#ff0000">* </font>空闲时间<input
									type="text" id="timeDesc" name="" required value="" class="ipt"
									disabled="true " /></label></li>
							<li><label><font color="#ff0000">* </font>预约时间 <input
									type="text" class="ipt" name="quren_guahaotime"
									id="quren_guahaotime" class="ipt" editable="false"
									disabled="true " /></label></li>
							<li><label><font color="#ff0000">* </font>预约费用 <input
									type="text" class="ipt" style="color: red;" name="guahaomoney"
									id="guahaomoney" class="ipt" editable="false" disabled="true " /></label></li>
							<li><input type="button" id="guahao_submit" value="确认医生"
								class="submitBtn" /></li>
							<li></li>

						</ul>
					</form>
				</div>

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