
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
    <span style="font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 25.6px; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">2017年互联速递项目发布会暨招商峰会盛大召开</span>
</h1>
<p style="text-align: center;">
    <span style="font-family: 微软雅黑; font-size: 14.1176px; text-align: center;">时间：2017-01-23&nbsp; &nbsp;发布人：互联速递</span>
</p>
<p>
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255);">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">2017年1月22日，乌鲁木齐市常诚恒业信息科技有限公司在君邦天山大饭店隆重召开“2017年互联速递项目发布会暨招商峰会”乌鲁木齐市常诚恒业信息科技有限公司特别邀请到我们战略合作伙伴，北京路演时代投资管理咨询有限公司董事长付守永先生担任本场主讲老师。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">　　伴随着移动O2O时代的来临，各行各业都在积极响应“互联网+”的行动计划，而互联速递是用 “互联网+速递”的技术改变传统速递模式，帮助用户和司机快递员线上直接交易，减少中间不必要环节，从根本上满足各方所需，真正做到服务国民，辐射全国。现在的物流机制存在缺失和空白，时效性不能被满足，信息获取局限性，资源流失性，信息货物的安全性。互联速递正是解决这些传统速递行业的痛点。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgvu2VxAUo0KXggAcwoAY42AQ.jpg" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAg7u6VxAUo2Nbf1AEw0Ac4igU.png" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">互联速递为了确保用户的支付安全和物品安全，与中国人民财产保险公司和招商银行的成功签约，他们成为平台的合作伙伴，为用户的物品安全保驾护航，中国银行和招商银行为用户确保支付的安全。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">互联速递顺应大趋势、大政策、大平台、大未来。始终坚持以互联网智慧便捷国民速递为宗旨，将踏实实践与大胆创新作为企业根本。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgou_VxAUosJbEjgQwoAY42AQ.jpg" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAg-u_VxAUoysL9uwEwoAY42AQ.jpg" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">睿智之选，步步为赢。我们坚信，互相精诚合作，将使分享财富变得更加简单，更加轻松愉快。在开启全国战略，加速推进互联速递辐射全国的形势下！互联速递于我们新疆区总代理以及库尔勒、石河子、乌苏、克拉玛依、呼图壁、奇台、库车、玛纳斯，成功签约达成合作伙伴关系，签约仪式总成交额达到1953万。相信他们正是抓住财富的机遇，将和互联速递共创财富帝国，互惠共赢、联通未来！</span><br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAgrfCVxAUowdb3lQMw2Qc4jAU.png" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhrxQU1opLkENnCB9ArIxUwWq26RwicbQNpQN3ubDHibBSJfI6PzP0icQfn0s21DvR4xKYyPEs741UXQ/0?tp=webp&wxfrom=5&wx_lazy=1" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgyPCVxAUowKCicTD9BDjuBQ.jpg" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhrxQU1opLkENnCB9ArIxUwWq26RwicbQNpQN3ubDHibBSJfI6PzP0icQfn0s21DvR4xKYyPEs741UXQ/0?tp=webp&wxfrom=5&wx_lazy=1" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAg8fCVxAUolsPg0gYw0gc4jwU.png" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">本次项目发布会的成功举办，我们清楚的认识到，未来移动互联网产业及互联速递APP所蕴含的异常广阔的发展空间，在一系列主流媒体的支持下，为互联速递在未来谱写新的华彩篇章奠定了坚实的基础。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgyvGVxAUo_qDavAIwoAY42AQ.jpg" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img title="分割线" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhrxQU1opLkENnCB9ArIxUwWq26RwicbQNpQN3ubDHibBSJfI6PzP0icQfn0s21DvR4xKYyPEs741UXQ/0?tp=webp&wxfrom=5&wx_lazy=1" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;">
    <img src="http://11769024.s21i-11.faiusr.com/4/ABUIABAEGAAg6fGVxAUousbnaTDOBziHBQ.png" alt=" "/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-family: 微软雅黑; font-size: 0.75rem;">此次峰会不但让大家跳出传统的创业思路，了解“互联速递”的强大团队，更让大家看到了巨大的市场。我们相信，财富的航母已经启动，志同道合的同仁将聚力合创互联网产业的财富自由。</span>
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
