
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("ctx", request.getContextPath());
	request.setAttribute("nowTimeNow", new Date().getTime());
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="keywords" content="互联速递，同城速递，专人直送，同城急件，代买，代送，代购，同城加急，同城快递，限时送达，最快的快递">
		<meta name="description" content="互联速递是国内最快的同城速递和跨城速递服务公司，专人直送，60分钟送达全城！24小时在线为用户提供同城或者跨城急件,蛋糕,鲜花,生鲜,水果等限时递送服务。">
		<link rel="stylesheet" type="text/css" href="css/reset.css?v=${nowTimeNow}" />
		<link rel="stylesheet" type="text/css" href="css/basic.css?v=${nowTimeNow}"/>
		<!-- <link rel="stylesheet" type="text/css" href="css/index.css?v=${nowTimeNow}" /> -->
		<!--动画文件-->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css" />
		<!--高德地图-->
		<link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css" />
		
		<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
		<title>互联速递</title>
		<style>
			.reg{
				padding: 50px;
				margin: 0 auto;
				width: 400px;
				height: 500px;
			}
			.reg p{
				margin: 20px 0;
				width: 400px;
				display: flex;
				align-items: center;
			}
			.reg p label{
				display: block;
				width: 100px;
			}
			.reg p input[type="text"]{
				width: 200px;
				height: 30px;
			}
			.reg p input[type="submit"]{
				width: 100px;
				height: 30px;
				background: #44c2f1;
				color: #fff;
				border: 0;
			}
		</style>
	</head>

	<body>
		<!--header-->
		<div class="detail-header">
			<div class="header-link"></div>
			<!-- <div id="success"></div> -->
			<div class="nav">
				<div class="logo">
					<img src="img/logo.png" />
					<div class="website">
						HULIANSUDI.COM
					</div>
				</div>
				<div class="list">
					<ul class="list-ul">
						<li class="nav-active">
							<a  href="index.jsp">首页</a>
						</li>
						<li class="sudi-nav">
							<a href="intracity.jsp">速递</a>
							<div class="sudi-list">
								<a href="intracity.jsp">同城速递</a>
								<a href="crosscity.jsp">跨城速递</a>
								<a href="reg.jsp">我的速递</a>
								<a href="price.jsp">速递价格</a>
							</div>

						</li>
						<!-- <li>
							<a href="Jion.jsp">招商加盟</a>
						</li> -->
						<li>
							<a href="Driverdownload.jsp">司机注册</a>
						</li>
						<li>
							<a href="Userdownload.jsp">APP下载</a>
						</li>
						<li>
							<a href="Openplatform.jsp">行业资讯</a>
						</li>

					</ul>
				</div>
				<div class="address">
					<ul>
						<li class="city">
							<a href="###" id="select-city">
								<!-- <p id="city-address">选择城市</p> <span><img src="img/city-down.png"/></span> -->
								</a>
						</li>
						<li class="login">
							<a href="###" id="loginuser">登录</a>
						</li>
						<li>
								<a href="reg.jsp" >注册</a>
						</li>
					</ul>

				</div>

				
			</div>

		</div>
		<div class="detail-content" style="padding-top: 50px;width: 1400px;margin: 0 auto; text-align: center;zoom:1.4!important">
		<p style="font-size: 20px">互联速递会员注册</p>
		<div class="reg">
			<p><label for="">用户名</label><input type="text"></p>
			<p><label for="">姓名</label><input type="text"></p>
			<p><label for="">身份证号</label><input type="text"></p>
			<p><label for="">密码</label><input type="text"></p>
			<p><label for="">确认密码</label><input type="text"></p>
			<p><label for=""></label><input type="checkbox"> 我已阅读并同意 <a href="index.jsp">会员注册协议</a>和 <a href="index.jsp">隐私保护政策</a>。</p>

			<p><label for=""></label><span style="color: red;"> 会员资费按月计费，12元/月。</span></p>
			<p><label for=""></label><img onclick="javascript:alert('互联速递注册功能正在开发中-ing')" src="img/yh.jpg" alt=""></p>
			<p><label for=""></label><input onclick="javascript:alert('互联速递注册功能正在开发中-ing')" type="submit" value="注册"></p>
		</div>
		
		
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="login.jsp"></jsp:include>
		<jsp:include page="city.jsp"></jsp:include>
		
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<!--动态效果js-->
		<script src="layer/layer.js"></script>
		<!--城市选择-->
		<script src="js/hlsd-city-address.js?v=${nowTimeNow}"></script>
		<!-- 登录 -->
		<script src="js/time-code.js?v=${nowTimeNow}"></script>
		<!--主页js-->
		<script src="js/index.js?v=${nowTimeNow}"></script>
		<!--同比缩放-->
		<script src="js/zoom-body.js?v=${nowTimeNow}"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
			 onload() 
			})
			//获取验证码
		
		</script>
		
	</body>

</html>
