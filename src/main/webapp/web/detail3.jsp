
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
		<div class="detail-content" style="padding-top: 50px;width: 1400px;margin: 0 auto; text-align: center;">
		
		<h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;">
    <span style="font-family: icomoon; font-size: 25.6px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">互联速递招商峰会，新疆省代成功签约</span>
</h1>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.8rem;">2016年12月26日“互联速递招商峰会新疆省代签约”在激情热烈的气氛中展开！</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <a style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: blue; padding: 0px; text-decoration-line: underline; cursor: pointer;"><img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAg7_qIwwUo5J-OgAQw6hg4xhA!800x800.jpg" alt=" "/></a>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">“互联速递招商峰会，新疆省代成功签约”，恭祝各位企业家朋友们携手常诚恒业智想财富大未来。签约仪式的开展，得到了多方面的认可，来自新疆总代理意向合作深层次洽谈签约。互联速递希望利用平台用户与数据的力量，加速速递行业的发展。在举办的“互联速递招商峰会，新疆省代签约”，常诚恒业清晰的道出了互联速递的定位——“全民速递信息服务平台”互联速递以智能速递帝国正以稳健切大跨步式的面向全国诚招合伙人，现在是互联网的时代亦是资本的时代，互联速递合伙人火热招募中，望与有共同梦想的有志之士携手共赢智想未来！</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">加盟热线：400-0755-828</span></strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <a style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: blue; padding: 0px; text-decoration-line: underline; cursor: pointer;"><img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgqe2IwwUoqtXj-Qcw6hg4xhA!800x800.jpg" alt=" "/></a>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.75rem; font-family: 微软雅黑;">顺应大坏境发展，互联速递与传统快递的区别在于发货信息从物流公司发送转变为发件人、车主手机APP（互联速递）直接交易从下单、接单、取件、送件也依然是一个加速互联速递发展中心化的模式，但更像是速递业的O2O作为客户、司机、快递公司拥有将收入翻番的机会，也作为速递行业O2O的必需品，互联网+速递业在最有互联网节奏的行业中非常具有创新和可发展价值。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <a style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(0, 0, 0); padding: 0px; text-decoration-line: underline; cursor: pointer;"><img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAg3_2IwwUomKTOmwUw6hg4xhA!800x800.jpg" alt=" "/></a>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <a style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: blue; padding: 0px; text-decoration-line: underline; cursor: pointer;"><img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgqO6IwwUo4f2H0Qcw6hg4xhA!800x800.jpg" alt=" "/></a>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">中国快递协会年会发布数据，2015年，快递业完成业务量206亿件，最高日处理量超过1.6亿件；快递业务收入完成2760亿元。综合考虑市场发展、市场前期占有率等因素，按照平台1%比例服务费收益，平均一个县的年服务费收益约在80万元，地级市年服务费收益约在121万元，省会城市年服务费收益约在201万元，直辖市年服务费收益约在252万元。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAgl9WEwgUoiNH6uQYwmAI4jwI.png" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 24px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">据不完</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">全统计2014年、2015年每年同城、跨城小货短距离托运费为1700亿和2000亿，每年以20%以上速度递增，按照平台3%比例服务费收益，平均一个县的年服务费收益约在175万元，地级市年服务费</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">收益约在263万元，省会城市年服务费收益约在439万元，直辖市年服务费收益约在549万元。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <a style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: blue; padding: 0px; text-decoration-line: underline; cursor: pointer;"><img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAgrPmKwgUo8Kz73QEwvQs45wQ!800x800.png" alt=" "/></a>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">简单的说，互联速递搭建了一个平台，连接有需求的商家和需要发件人、配送物品，以平台为媒介，以发件人为点，提供服务。平台使用都是免费的，并有着完善返利的优惠力度。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAg3vmKwgUomM6u9QMwvAc4zAE.png" alt=" "/>
</p>
<p></p>
<section>
    <section>
        <section>
            <section>
                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0.4rem 1.15rem; max-width: 100%; border-radius: 25px; color: rgb(255, 255, 255); font-family: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(0, 88, 156); background-color: rgb(0, 88, 156); box-sizing: border-box !important; word-wrap: break-word !important;">合伙人收益</span>
            </section>
        </section>
    </section>
</section>
<p></p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; color: rgb(51, 51, 51); line-height: 1.75rem; font-family: 微软雅黑; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">&gt; 享有车辆信息服务费3%作为盈利点；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; color: rgb(51, 51, 51); line-height: 1.75rem; font-family: 微软雅黑; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">&gt; 享有快递业务的1%作为盈利点；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; color: rgb(51, 51, 51); line-height: 1.75rem; font-family: 微软雅黑; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">&gt; 拥有原始</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; line-height: 1.75rem; font-family: 微软雅黑; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">股权，享有市值裂变，股份升值；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; line-height: 1.75rem; font-family: 微软雅黑; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">&gt; 全国的互联速递加盟伙伴，资源互通，信息共享；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; line-height: 1.75rem; font-family: 微软雅黑; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">&gt; 加盟等于获得辐射全国的人脉圈；</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAg1oiKwgUoie7C0gcw7QI4mgI.png" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; text-indent: 2em; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; color: rgb(51, 51, 51); line-height: 1.75rem; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; line-height: 1.75rem; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">在当下互联网时代，信息安全重要性凸显，通过积极利用信息技术提升安全监管能力，完善速递业安全监管信息平台，健全信息采集标准和共享机制，实现快件信息溯源追查，将全面提高行业服务品质怎样在新的领域赢得消费者青睐，不仅要坚持‘用户至上’，也要让</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; line-height: 1.75rem; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">服务更贴心一度，配送专业化更强并努力降低成本，互联速递是速递行业痛点的解决者。</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; line-height: 1.75rem; padding: 0rem; max-width: 100%; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">互联速递合伙</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; line-height: 1.75rem; padding: 0rem; max-width: 100%; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;">人火热招募中，望与有共同梦想的有志之士携手共赢智想未来共同实现财富自由！</span></span></span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; white-space: normal; max-width: 100%; clear: both; min-height: 1em; color: rgb(62, 62, 62); font-size: 0.8rem; text-indent: 2em; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; color: rgb(51, 51, 51); line-height: 1.75rem; font-family: 微软雅黑; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; padding: 0rem; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0rem; line-height: 1.75rem; padding: 0rem; max-width: 100%; font-size: 0.75rem; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; text-align: center; text-indent: 30px; white-space: normal; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">加盟热线：400-0755-828</span></strong></span></span></span>
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
