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
		<link rel="stylesheet" type="text/css" href="css/index.css?v=${nowTimeNow}" />
		<!--动画文件-->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css" />
		<!--高德地图-->
		<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css" />
	
		<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
		<title>互联速递</title>
		<style>
			.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '»';
  position: absolute;
  opacity: 1;
  top: -10px;
  right: -45px;
  transition: 0.5s;
  font-size: 72px
}

.button:hover span {
  padding-right: 45px;
}

.button:hover span:after {
  opacity: 0;
  right: -90px;
}
		</style>
	</head>

	<body>
		<!--header-->
		<div class="header">
			<div class="header-link"></div>
			<!-- <div id="success"></div> -->
			<div class="nav">
				<div class="logo">
					<img src="${ctx}/web/img/logo.png" />
					<div class="website">
						HULIANSUDI.COM
					</div>
				</div>
				<div class="list">
					<ul class="list-ul">
						<li class="nav-active">
							<a class="hlsd-color" href="">首页</a>
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
							<a href="Driverdownload.jsp">司机注册</a>
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

				<div class="goorder">
					<a href="intracity.jsp" class="button"><span>立即下单</span> </a>
				</div>
				<!-- <div class="downorder">
					<div class="bb">
						<div class="bb-hlsd">
							互联速递
						</div>
						<div class="bb-hlsd-intro"><em>全民速递信息服务平台</em></div>
						<div class="bb-order">
							<a href="intracity.html">在线下单</a>
						</div>
					</div> -->
					<!--<img src="img/bannertop.png"/>-->
				<!-- </div> -->
			</div>

		</div>
		<!--content-->
		<div class="content">
			<!--四个按钮-->
			<div class="content-list">
				<ul>
					<li class="list1">
					<a href="">
							<img src="img/indexlist4/time.png" />
							<p>同城1小时</p>
							<b></b>
							<span>点对点即发即送 同城配送</br>
无中转环节 直达目的地</span>
						</a>
						
					</li>
					<li class="list2">
						<a href="">
							<img src="img/indexlist4/kuacheng.png" />
							<p>跨城当天到</p>
							<b></b>
							<span>当天到达 跨城顺风车</br>
省时省钱高效</span>
						</a>
					</li>
					<li class="list3">
					
						<a href="">
							<img src="img/indexlist4/renzheng.png" />
							<p>安全专业 PICC承保</p>
							<b></b>
							<span>自有骑手 统一管理 专业收发
全程中国人保财险承保</span>
						</a>
					</li>
					<li class="list4">
					<a href="">
							<img src="img/indexlist4/time24.png">
							<p>速递业务 全新体验</p>
							<b></b>
							<span>专人配送 随时下单 即时上门 
无需等候 24小时为您服务</span>
						</a>
						
					</li>
				</ul>
			</div>
			<!--互联速递业务介绍-->
			<div class="content-intro">
				<h2>互联速递业务介绍</h2>
				<p style="text-indent: 36px">以同城速递和跨城速递业务为核心主营业务，市场细分以鲜花配送、蛋糕配送为主；客户细分以无自主配送能力的电商平台、配送能力不够的电商平台、线下实体商户、个人等四大类客户为重点服务客户，通过运用大数据、云计算等先进信息技术系统，策略性的资源整合和流程优化，旨在打造同城或跨城物流配送解决方案的saas服务平台。后期还将陆续开放快递公司接入，通过公司积累的技术和稳固的市场地位帮助快递公司增加更多的业务收入同时也让使用互联速递的人士获得最便捷的用户体验。
				</p>
			</div>
			<!--用户端介绍-->
			<div class="content-user">
				<div class="user-left">
					<img id="userapp" src="img/userapp.png" />
				</div>
				<div class="user-right">
					<div class="user-download">
						<h2>用户端介绍</h2>
						<p>同城骑手就近匹配，1小时内送达；</br>
独家配备减震设备，货品更安全；</br>
跨城专职司机当日配送上门，省时、省心、省钱</p>
						<a href="">点击下载</a>
					</div>

				</div>

			</div>
			<!--司机端介绍-->
			<div class="content-admin">

				<div class="admin-left">
					<div class="admin-download">
						<h2>司机端介绍</h2>
						<p>全面覆盖一线城市，数万家商户订单；</br>
配送工具统一配备，按单结算，回报丰厚；</br>
互联速递，就等你来</p>
						<a href="">点击下载</a>
					</div>

				</div>
				<div class="admin-right">
					<img id="adminapp" src="img/adminapp.png" />
				</div>

			</div>
		</div>
		<!-- link -->
		<!-- <div class="link"></div> -->
		<!-- intro -->
<!-- 		<div class="intro">
			<div class="intro-top">
				<div class="intro-img">
					<img src="img/zhaoshang.jpg" alt="">
				</div>
				<div class="intro-more">
					<a class="hlsd-btn intro-more-btn" href="">了解更多</a>
				</div>
			</div>
			<div class="intro-bottom">
				<div class="intro-title">
					<h2>招商介绍</h2>
				</div>
				<div class="intro-p">
					<p>中国快递协会年会发布数据，2015年，快递业完成业务量206亿件，最高日处理量超过1.6亿件；快递业务收入完成2760亿元。综合考虑市场发展、市场前期占有率等因素，按照平台1%比例服务费收益，平均一个县的年服务费收益约在80万元，地级市年服务费收益约在121万元，省会城市年服务费收益约在201万元，直辖市年服务费收益约在252万元。</p>

				</div>

			</div>

		</div> -->
		
		<jsp:include page="/web/footer.jsp"></jsp:include>
		<jsp:include page="/web/login.jsp"></jsp:include>
		<jsp:include page="/web/city.jsp"></jsp:include>
		
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