<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("ctx", request.getContextPath());
	request.setAttribute("nowTimeNow", new Date().getTime());
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="keywords" content="互联速递，同城速递，专人直送，同城急件，代买，代送，代购，同城加急，同城快递，限时送达，最快的快递">
		<meta name="description" content="互联速递是国内最快的同城速递和跨城速递服务公司，专人直送，60分钟送达全城！24小时在线为用户提供同城或者跨城急件,蛋糕,鲜花,生鲜,水果等限时递送服务。">
		<link rel="stylesheet" type="text/css" href="css/reset.css" />
		<link rel="stylesheet" type="text/css" href="css/basic.css" />
		<link rel="stylesheet" type="text/css" href="css/Driverdownload.css?v1.0" />
	
		<title>司机注册</title>
	</head>

	<body>
		<!--hlsd-header-->
		<div class="d-header">
			<div class="header-link">

			</div>
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
							<a href="index.jsp">首页</a>
						</li>
						<li class="sudi-nav">
							<a href="intracity.jsp">速递</a>
							<div class="sudi-list">
								<a href="intracity.jsp">同城速递</a>
								<a href="crosscity.jsp">跨城速递</a>
								<a href="myorder.jsp">我的速递</a>
								<a href="price.jsp">速递价格</a>
							</div>
						</li>
						<li>
							<a href="Jion.jsp">招商加盟</a>
						</li>
						<li>
							<a class="hlsd-color"  href="Driverdownload.jsp">司机注册</a>
						</li>
						<li>
							<a href="Userdownload.jsp">APP下载</a>
						</li>
						<li>
							<a href="Openplatform.jsp">开放平台</a>
						</li>

					</ul>
				</div>
				<div class="address">
					<ul>
						<li class="city">
							<a href="###" id="select-city">
								<p id="city-address">选择城市</p> <span><img src="img/city-down.png"/></span></a>
						</li>
						<li class="login">
							<a href="###" id="loginuser">登录</a>
						</li>
					</ul>

				</div>
			</div>
			<div class="header-text">
				<div class="header-text-box">
					<p>互联速递 </p>
					<em>全民速递信息服务平台</em>
				</div>
				<div class="qrcode">
					<img src="img/driverdownload/SIJIERWEIMA.png"/>
					<p>扫码下载司机端</p>
				</div>
			</div>
			
			
		</div>
		<!--driverdownload-->
		<div class="driver-download">
			<div class="steps-1">
				<div class="steps-1-box">
				<div class="steps-1-left">
					<img src="img/driverdownload/XIZAI1.png"/>
				</div>
				<div class="steps-1-right">
					<div class=" steps-btn steps-1-btn ">
						<div class="text-box">
							<em>1</em>
							<p>通过官网或者应用市场下载互联车主客户端。</p>
						</div>
						
						<a href="">下载司机客户端</a>
					</div>
				</div>
				</div>
			</div>
			<div class="steps-box">
			
			<div class="steps-2">
				<div class="bb">
				<div class="steps-2-left">
					<div class="steps-btn  steps-2-btn">
						<div class="text-box">
							<em>2</em>
							<p>打开软件，填写您的姓名、联系方式、上传身份证、驾驶证等信息，等待审核。</p>
						</div>
						
						<a href="">提交个人信息</a>
					</div>
				</div>
				<div class="steps-2-right">
					<img src="img/driverdownload/TU2.jpg"/>
				</div>
			</div>
			</div>
			<div class="steps-3">
				<div class="bb">
				<div class="steps-3-left">
					<img src="img/driverdownload/TU3.jpg"/>
				</div>
				<div class="steps-3-right">
					<div class="steps-btn  steps-3-btn">
						<div class="text-box">
							<em>3</em>
							<p>完成注册，可以开始接单啦！</p>
						</div>
						
						<a href="">完成注册</a>
					</div>
				</div>
				</div>
			</div>
			
			</div>
			
		</div>
				<jsp:include page="/web/footer.jsp"></jsp:include>
		<jsp:include page="/web/login.jsp"></jsp:include>
		<jsp:include page="/web/city.jsp"></jsp:include>
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="layer/layer.js"></script>
		<script src="js/hlsd-city-address.js"></script>
		<!--同比缩放-->
		<script src="js/zoom-body.js"></script>
		<!-- 登录 -->
		<script src="js/time-code.js?v=${nowTimeNow}"></script>
	</body>

</html>