<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh" class="no-js">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--<![endif]-->
<link rel="stylesheet" type="text/css"
	href="css/logincss/normalizelogin.css" />
<link rel="stylesheet" type="text/css" href="css/logincss/demologin.css" />
<link rel="stylesheet" type="text/css"
	href="css/logincss/componentlogin.css" />
<link rel="stylesheet" type="text/css"
	href="css/logincss/contentlogin.css" />
	
<script src="js/modernizr.custom.js"></script>
<script src="js/jquery.min.js"></script>



<style type="text/css">
.codrops-demos {
	position: absolute;
	z-index: 99;
}
</style>
</head>

<body>
	<div class="codrops-demos">

		<header class="codrops-header">
		<h1>社区医院挂号系统</h1>
		<p>为您提供本地的医院信息,帮您找对医生挂到号。</p>
		</header>
		<section>
		<p>
			点击下面的按钮进行用户的<strong>注册</strong>:
		</p>
		<div class="mockup-content">
			<div
				class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
				<button type="button">登录</button>
				<div class="morph-content">
					<div>
						<div class="content-style-form content-style-form-1">
							<span class="icon icon-close">Close the dialog</span>
							<h2>登录</h2>
							<form method="post" id="firstform" action="123">
								<p>
									<label>用户名</label><input name="userName" id="userName"
										type="text" />
								</p>
								<p>
									<label>密 码</label><input name="password" id="password"
										type="password" type="password" />
								</p>
								<p>
									<button onclick="subLoginInfo()">登录</button>
								</p>
							</form>
						</div>
						<script>
							function subLoginInfo() {
								var todo = function() {
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
													alert("用户名不存在");
												} else if (arg == 'errorpass') {
													alert("密码错误");
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
						</script>
					</div>
				</div>
			</div>
			<!-- morph-button -->
			
			<strong class="joiner">or</strong>
			<div
				class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
				<button type="button">注册</button>
				<div class="morph-content" style="height: 600px;">
					<div>
						<div class="content-style-form content-style-form-2">
							<span class="icon icon-close">Close the dialog</span>
							<h2>注册</h2>
							<form id="Registform" action="user/regist" method="post">
								<p>
									<label>用 户名</label><input type="text" id="username"
										name="guahaousername" />
								</p>
								<p>
									<label>密 码</label><input name="guahaopassword" type="password" />
								</p>
								<p>
									<label>手机号码</label><input type="text" name="phoneNumber" />
								</p>
								<p>
									<label>邮箱</label><input type="text" name="guahaoemail" />
								</p>
								<p>
									<button onclick="subRegistInfo()">注册</button>
								</p>
							</form>
						</div>
						<script>
							function subRegistInfo() {
								$("#Registform").submit();
							}
						</script>
					</div>
				</div>
			</div>
			<!-- morph-button -->
			<p>在线挂号，选择平安好医生，超多专业医生和职业医师提供放心问诊，免去排队的困扰。</p>
		</div>
		<!-- /form-mockup --> </section>
	</div>
	<!-- /container -->
	<script src="js/classie.js"></script>
	<script src="js/uiMorphingButton_fixed.js"></script>
	<script>
		(function() {
			var docElem = window.document.documentElement, didScroll, scrollPosition;

			// trick to prevent scrolling when opening/closing button
			function noScrollFn() {
				window.scrollTo(scrollPosition ? scrollPosition.x : 0,
						scrollPosition ? scrollPosition.y : 0);
			}

			function noScroll() {
				window.removeEventListener('scroll', scrollHandler);
				window.addEventListener('scroll', noScrollFn);
			}

			function scrollFn() {
				window.addEventListener('scroll', scrollHandler);
			}

			function canScroll() {
				window.removeEventListener('scroll', noScrollFn);
				scrollFn();
			}

			function scrollHandler() {
				if (!didScroll) {
					didScroll = true;
					setTimeout(function() {
						scrollPage();
					}, 60);
				}
			}
			;

			function scrollPage() {
				scrollPosition = {
					x : window.pageXOffset || docElem.scrollLeft,
					y : window.pageYOffset || docElem.scrollTop
				};
				didScroll = false;
			}
			;

			scrollFn();

			[].slice.call(document.querySelectorAll('.morph-button')).forEach(
					function(bttn) {
						new UIMorphingButton(bttn, {
							closeEl : '.icon-close',
							onBeforeOpen : function() {
								// don't allow to scroll
								noScroll();
							},
							onAfterOpen : function() {
								// can scroll again
								canScroll();
							},
							onBeforeClose : function() {
								// don't allow to scroll
								noScroll();
							},
							onAfterClose : function() {
								// can scroll again
								canScroll();
							}
						});
					});

			// for demo purposes only
			[].slice.call(document.querySelectorAll('form button')).forEach(
					function(bttn) {
						bttn.addEventListener('click', function(ev) {
							ev.preventDefault();
						});
					});
		})();
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var canvas = document.getElementById("c");
							var ctx = canvas.getContext("2d");
							var c = $("#c");
							var w, h;
							var pi = Math.PI;
							var all_attribute = {
								num : 100, // 个数
								start_probability : 0.1, // 如果数量小于num，有这些几率添加一个新的     		     
								radius_min : 1, // 初始半径最小值
								radius_max : 2, // 初始半径最大值
								radius_add_min : .3, // 半径增加最小值
								radius_add_max : .5, // 半径增加最大值
								opacity_min : 0.3, // 初始透明度最小值
								opacity_max : 0.5, // 初始透明度最大值
								opacity_prev_min : .003, // 透明度递减值最小值
								opacity_prev_max : .005, // 透明度递减值最大值
								light_min : 40, // 颜色亮度最小值
								light_max : 70, // 颜色亮度最大值
							};
							var style_color = find_random(0, 360);
							var all_element = [];
							window_resize();

							function start() {
								window.requestAnimationFrame(start);
								style_color += .1;
								ctx.fillStyle = 'hsl(' + style_color
										+ ',100%,97%)';
								ctx.fillRect(0, 0, w, h);
								if (all_element.length < all_attribute.num
										&& Math.random() < all_attribute.start_probability) {
									all_element.push(new ready_run);
								}
								all_element.map(function(line) {
									line.to_step();
								})
							}

							function ready_run() {
								this.to_reset();
							}
							ready_run.prototype = {
								to_reset : function() {
									var t = this;
									t.x = find_random(0, w);
									t.y = find_random(0, h);
									t.radius = find_random(
											all_attribute.radius_min,
											all_attribute.radius_max);
									t.radius_change = find_random(
											all_attribute.radius_add_min,
											all_attribute.radius_add_max);
									t.opacity = find_random(
											all_attribute.opacity_min,
											all_attribute.opacity_max);
									t.opacity_change = find_random(
											all_attribute.opacity_prev_min,
											all_attribute.opacity_prev_max);
									t.light = find_random(
											all_attribute.light_min,
											all_attribute.light_max);
									t.color = 'hsl(' + style_color + ',100%,'
											+ t.light + '%)';
								},
								to_step : function() {
									var t = this;
									t.opacity -= t.opacity_change;
									t.radius += t.radius_change;
									if (t.opacity <= 0) {
										t.to_reset();
										return false;
									}
									ctx.fillStyle = t.color;
									ctx.globalAlpha = t.opacity;
									ctx.beginPath();
									ctx
											.arc(t.x, t.y, t.radius, 0, 2 * pi,
													true);
									ctx.closePath();
									ctx.fill();
									ctx.globalAlpha = 1;
								}
							}

							function window_resize() {
								w = window.innerWidth;
								h = window.innerHeight;
								canvas.width = w;
								canvas.height = h;
							}
							$(window).resize(function() {
								window_resize();
							});

							function find_random(num_one, num_two) {
								return Math.random() * (num_two - num_one)
										+ num_one;
							}
							(function() {
								var lastTime = 0;
								var vendors = [ 'webkit', 'moz' ];
								for (var xx = 0; xx < vendors.length
										&& !window.requestAnimationFrame; ++xx) {
									window.requestAnimationFrame = window[vendors[xx]
											+ 'RequestAnimationFrame'];
									window.cancelAnimationFrame = window[vendors[xx]
											+ 'CancelAnimationFrame']
											|| window[vendors[xx]
													+ 'CancelRequestAnimationFrame'];
								}

								if (!window.requestAnimationFrame) {
									window.requestAnimationFrame = function(
											callback, element) {
										var currTime = new Date().getTime();
										var timeToCall = Math.max(0,
												16.7 - (currTime - lastTime));
										var id = window.setTimeout(function() {
											callback(currTime + timeToCall);
										}, timeToCall);
										lastTime = currTime + timeToCall;
										return id;
									};
								}
								if (!window.cancelAnimationFrame) {
									window.cancelAnimationFrame = function(id) {
										clearTimeout(id);
									};
								}
							}());
							start();
						});
	</script>
	<canvas id="c" width="300" height="150"> </canvas>

</body>

</html>