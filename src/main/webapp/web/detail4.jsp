
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
    <span style="font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 25.6px; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">互联速递——北京项目签约会圆满落幕</span>
</h1>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    <span style="font-family: 微软雅黑; font-size: 14.1176px; text-align: center;">时间：2017-01-06&nbsp; &nbsp;发布人：互联速递</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    辞旧迎新的2017年1月1日互联速递带着梦想的翅膀远航首都——北京！
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">常诚恒业互联速递对接北京路演时代投资管理有限公司。</strong>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;">
    <br/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <img src="http://image.135editor.com/files/users/90/904901/201701/rRrzV8wv_OD9Y.jpg" title="男常女常.jpg" alt="男常女常.jpg"/>
                </section>
            </section>
            <section>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <img src="http://image.135editor.com/files/users/90/904901/201701/vc4ZmqtZ_raOy.jpg" title="合照.jpg" alt="合照.jpg"/>
                </p>
            </section>
        </section>
    </section>
    <section>
        <section>
            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
            </p>
        </section>
        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
            <br/>
        </p>
    </section>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    一个好的项目，一个实实在在利国利民的项目就是这样掷地有声，就是这样一呼百应。在与北京路演时代对接的过程中，我司对我司开发的互联速递进行了阐述和演示，短短八分钟就征服了在场的参会人员。
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 2em;">
    <img src="http://image.135editor.com/files/users/90/904901/201701/6wprYY63_hscG.jpg" alt="王小鹏.jpg"/>
</p>
<p>
    <section>
        <section>
            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
            </p>
        </section>
    </section>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    互联速递全民速递信息服务平台，帮助发件人、车主、快递员通过手机APP（互联速递）。真正做到合理资源无缝匹配，既能帮助客户解决物品流通所需，又能提高司机收入，减少快递员不必要沟通、定位过程，提高工作效率，最大程度的满足各方所需。
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    高效是我们的责任，品质是我们的追求。从下单、接单、取件、送件我们全程提供优质的速递信息服务。上门收件减轻客户负担；健全的线上系统，对物品进行精准跟踪。专车速递信息服务、顺风车速递信息服务更加方便国民速递生活。
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 19px;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 2em;">
    <img src="http://image.135editor.com/files/users/90/904901/201701/IUg9DurB_OwDm.png" alt="互联网+速递.png"/>
</p>
<p>
    <section>
        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
            <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
        </p>
    </section>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    常诚恒业互联速递、北京路演时代投资管理有限公司双方就合作事宜达成一致，成为彼此战略合作伙伴。
</p>
<p>
    <section>
        <section></section>
    </section>
    <section>
        <section>
            <section>
                <section></section>
                <section></section>
                <section></section>
                <section>
                    <section>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                            北京路演时代投资管理有限公司董事长、高级研究员价值型企业理论的创建者、实践者、传播者！中国教育培训产业的革新人物，北京大学经济管理学院 特聘讲师，被业界誉为“用生命演讲的人&quot;的付守永先生给予互联速递高度的评价：这是一款国民所需的APP，这是一款可以解决行业痛点的APP！
                        </p>
                    </section>
                </section>
                <section></section>
                <section></section>
                <section></section>
            </section>
        </section>
    </section>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 2em;">
    <img src="http://image.135editor.com/files/users/90/904901/201701/5YPc9rFr_hUph.jpg" alt="路演大师.jpg"/>
</p>
<p>
    <section>
        <section>
            <section>
                <section>
                    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                        <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
                    </p>
                </section>
            </section>
        </section>
    </section>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    2017年1月2日，互联速递与北京路演时代就战略合作正式签约。北京路演时代将带领常诚恒业人以匠人的精神精细打磨互联速递，引导互联速递在互联网+的领域内隽永屹立！
</p>
<p>
    <section>
        <section>
            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                <img src="http://image.135editor.com/files/users/90/904901/201701/PZW5vFm2_VK52.jpg" title="活动.jpg" alt="活动.jpg"/>
            </p>
        </section>
        <section>
            <section>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; width: auto;"><img src="http://image.135editor.com/files/users/90/904901/201701/bKreRSVI_SYTg.jpg" title="学习交流.jpg" alt="学习交流.jpg"/></span>
                </p>
            </section>
        </section>
    </section>
    <section>
        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
            <img title="分割线" src="http://image3.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd1dxMjZSd2ljYlFOcFFOM3ViREhpYkJTSmZJNlB6UDBpY1FmbjBzMjFEdlI0eEtZeVBFczc0MVVYUS8wP3d4X2ZtdD1naWY=" alt=" "/>
        </p>
    </section>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    互联速递与北京路演时代强强联手，只为给有共同梦想的合伙人创造财富自由。
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    互联速递现面向全国招募省级合作伙伴、直辖市级合作伙伴、省会级合作伙伴、市级合作伙伴、县级合作伙伴。
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    席位有限，财富无限！
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    颠覆传统，展望未来！
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    互通合作，连接财富！
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 28px;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 25.6px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em; text-align: center;">
    <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">招商热线：400-0755-828</strong>
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
