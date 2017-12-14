
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
		<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css" />
		<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
		<title>互联速递</title>
	</head>

	<body>
		<!--header-->
		<div class="detail-header">
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

				
			</div>

		</div>
		<div class="detail-content" style="padding-top: 50px;width: 1400px;margin: 0 auto;">
<h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;">
    互联商学院首届加盟商精英培训
</h1>
<p style="text-align: center;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：2017-02-24&nbsp; &nbsp;发布：互联速递&nbsp;&nbsp;
</p>
<p style="text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgnP2-xQUokIWQqQIwnQk4nQk!1000x1000.jpg" alt=" " width="811" height="656"/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); letter-spacing: 2px; text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">&nbsp;&nbsp;&nbsp;&nbsp;进入2017年，快递行业内的市场前景可观。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); letter-spacing: 2px; text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">在竞争激烈的经济大环境下，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); letter-spacing: 2px; text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">互联速递的全体加盟商们</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); letter-spacing: 2px; text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">如何在汹涌的市场浪潮中激流勇进?</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); letter-spacing: 2px; text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">如何让更多的用户们了解互联速递认可互联速递?</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); letter-spacing: 2px; text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">如何在互联商学院大展宏图？</span>
</p>
<p style="text-align: center;">
    <br/><img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAgoIHAxQUowr7tnQEw1Aw4nQc.png" alt=" " width="757" height="553"/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">2月19号互联速递首期加盟商精英培训班，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">在互联速递商学院教室举行，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">来自全国各地加盟商和业务骨干们参加了此次培训会，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">学习“互联网+”的思维进一步提升自身的战斗力</span>
</p>
<p style="text-align:center">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);"><img src="http://image.135editor.com/files/users/104/1047531/201702/GkIkaLYY_Pghr.jpg" alt="20170221_161820_005.jpg"/></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">小编向大家介绍一下互联商学院的大智囊，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">有他们的智慧头脑带领</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">着我们在前进</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);">的道路上越战越勇。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: 微软雅黑; font-size: 0.8rem; background: rgb(250, 250, 250);"><img src="http://image.135editor.com/files/users/104/1047531/201702/OcLjIf58_B4Y2.jpg" alt="1.jpg"/></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 1rem; color: rgb(0, 112, 192);"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 1.4rem;">互联商学院的院长</span></span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; letter-spacing: 2px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 1rem; color: rgb(0, 112, 192);"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 1.4rem;">付守永老师</span></span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; letter-spacing: 2px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">他是著名财经作家，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">畅销书《工匠精神》《路演大师》作者，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">中国工匠精神传播第一人；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">2013年出版《工匠精神》持续畅销至今，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">经过四年传播，2016年工匠精神上升到国家战略；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">付守永老师被誉为“和平年代的民族英雄”；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">在过去十多年里，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">付守永老师致力于中国成长型企业的案例研究，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">尤其是对中国隐形冠军企业的研究，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">掌握了大量丰富的实战案例，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">在理论创新、</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">实践及创作方面均有深厚建树。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">付守永老师的课程简单、</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">系统、实效、接地气、易落地，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">被学员誉为“用生命演讲的人”；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">南开大学MBA特聘专家学者、</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">清华大学总裁班导师。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">中国首位能将中国企业案例研究、理论创新、</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">方法论形成并指导企业实践落地的专家学者。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">付守永老师的其他著作：</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">《解密价值型企业》《持续赢利》《德胜规矩》</span>
</p>
<p style="text-align: center;">
    <img src="http://image.135editor.com/files/users/104/1047531/201702/8wCYOEuS_5n6B.jpg" alt="IMG_9720_meitu_4.jpg" width="832" height="672"/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; letter-spacing: 2px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(0, 112, 192); font-size: 1.4rem;">李冰玉</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; letter-spacing: 2px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit; color: rgb(0, 112, 192); font-size: 1.4rem;">互联商学院执行院长</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; letter-spacing: 2px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit; font-size: 0.8rem;">常诚恒业信息科技有限公司策划经理</span></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">互联商学院执行院长</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">互联商学院培训导师</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">曾任职新疆华春集团和新疆德汇集团</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center; letter-spacing: 2px;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">在团队管理和专业路演领域均有骄人斩获</span>
</p>
<p style="text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgu4PAxQUovKbdjQcw3hk4shA!1000x1000.jpg" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(0, 112, 192); font-size: 1.4rem;">王晓鹏</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(0, 112, 192); font-size: 1.4rem;">互联商学院首席讲师</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;"></span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">常诚恒业信息科技有限公司项目讲师</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">中国体验式培训导师</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">曾任职巨力中国营销策划机构，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">对当今的企业经营及员工培训研究了六年，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">总结出一套易落地，易执行的课程，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">同时也是中国工匠精神传播大师付守永老师的得意门生！</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;"><img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgmoTAxQUore_glwYwphA4lxI!800x800.jpg" alt=" "/></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;"></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(0, 112, 192); font-size: 1.4rem;">徐鹏煊</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(0, 112, 192); font-size: 1.4rem;">互联商学院项目实战讲师</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">常诚恒业信息科技有限公司市场部经理</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit; font-size: 0.8rem;">曾任职顺丰快递（新疆区）</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">并一直负责市场营销相关管理工作，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">有丰富的一线客户开发、</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">销售团队管理工作经验。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <img src="http://image.135editor.com/files/users/104/1047531/201702/MhPTtfpd_kQSU.jpg" alt="20170221_161820_001.jpg"/><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;"><br/></span><br/>
</p>
<p style="text-align: center;">
    <span style="color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 38.4px; text-align: center; text-indent: 37px; background-color: rgb(255, 255, 255);">精英培训班现场如火如荼，全身心投入到培训课程当中</span>
</p>
<p style="text-align: center;">
    <br/>
</p>
<p style="text-align: center;">
    <span style="color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 38.4px; text-align: center; text-indent: 37px; background-color: rgb(255, 255, 255);"><img src="http://image.135editor.com/files/users/104/1047531/201702/TfPFHxNQ_qzrV.jpg" alt="20170221_161820_003.jpg"/></span>
</p>
<p style="text-align: center;">
    <span style="color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 38.4px; text-align: center; text-indent: 37px; background-color: rgb(255, 255, 255);">大家认真做笔记</span>
</p>
<p style="text-align: center;">
    <span style="color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 38.4px; text-align: center; text-indent: 37px; background-color: rgb(255, 255, 255);"><img src="http://image.135editor.com/files/users/104/1047531/201702/3TvBwAMZ_7hWm.jpg" alt="20170221_161820_004_meitu_7.jpg"/></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">相信有这些大智囊给我们灌输</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: arial; line-height: 1.5rem; font-size: 0.8rem; background-color: rgb(250, 250, 250);">“</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">互联网+新物流</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(50, 50, 50); font-family: arial; line-height: 1.5rem; font-size: 0.8rem; background-color: rgb(250, 250, 250);">”</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">的思维，<br/></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">学习互联网文化，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">在互联商学院这样一个好的氛围下</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">精英培训班的学院们</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">会学习到更多的知识。</span>
</p>
<p style="text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAg5IXAxQUo-tC1lwMwgA84uAg.jpg" alt=" " width="831" height="444"/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">在大智囊的带领下，</span><br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 1.2rem; color: rgb(0, 112, 192);">互联速递深圳技术研发中心</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">在背后一直为之默默付出。</span>
</p>
<p style="text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgv4bAxQUo2LKUuQQwgA84uAg.jpg" alt=" " width="834" height="515"/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem; line-height: 1.8;">作为我们强大的技术后盾，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">为我们的广大的用户群体，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">提供更安全更放心的保证，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">有他们在互联速递会越做越强！</span>
</p>
<p style="text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgjIfAxQUossPCjgIwwBk49A0.jpg" alt=" " width="818" height="470"/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem; line-height: 1.8; text-indent: 37px;">互联商学院是互联文化的重要组成部分，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">让学习成为自己成长的动力之源，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">是每个互联人的共识，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">为精英培训班的每一位学员们，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">提供一个相互学习相互交流的平台，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">因为我们坚信过去现在乃至未来，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">机会只属于那些越做越专业，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">越做越用心的人。<br/></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">互联速递</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: 1.25rem; font-size: 0.8rem;">现面向全国招募合作伙伴、</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">合伙人火热招募中，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">抓住机会，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 37px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.8rem;">我们在这里等你哟！</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-size: 36px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); font-family: 微软雅黑; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.9rem;">招商热线：400-0755-828</span></strong>
</p>
<p>
    <br/>
</p>
		</div>
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
