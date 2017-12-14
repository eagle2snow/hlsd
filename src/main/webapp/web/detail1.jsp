
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
    <span style="font-family: 微软雅黑, Helvetica, 黑体, Arial, Tahoma; font-size: 25.6px; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">热烈祝贺互联速递招商峰会取得圆满成功</span>&nbsp; &nbsp;&nbsp;
</h1>
<p style="text-align: center;">
    时间：2017-03-17&nbsp; &nbsp;发布人：互联速递
</p>
<p>
    <br/>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(62, 62, 62); letter-spacing: 0px; font-size: 0.75rem; font-family: 微软雅黑;">&nbsp;&nbsp;&nbsp;&nbsp;3月15日，新疆乌鲁木齐南航明珠国际酒店，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: 1.75em; color: rgb(62, 62, 62); letter-spacing: 0px; font-size: 0.75rem; font-family: 微软雅黑;">从上午10:00点开始，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: 1.75em; color: rgb(62, 62, 62); letter-spacing: 0px; font-size: 0.75rem; font-family: 微软雅黑;">不断有人从四面八方涌来。</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(62, 62, 62); letter-spacing: 0px; line-height: 1.75em; font-size: 0.75rem; font-family: 微软雅黑;">半个小时后，</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(62, 62, 62); letter-spacing: 0px; line-height: 1.75em; font-size: 0.75rem; font-family: 微软雅黑;">酒店三楼的红山厅门口，</span>
</p>
<p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
    <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(62, 62, 62); letter-spacing: 0px; line-height: 1.75em; font-size: 0.75rem; font-family: 微软雅黑;">已是人山人海。</span>
</p>
<p>
    <br/>
</p>
<section>
    <section>
        <section>
            <img alt="111.png" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9wbmcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUnlNQWJpYzZzZ0p0RUxHWUVNQTNPVmpNRWpXNDF3M2VRalNzc2p3Sm5QSm5TRmFEOWJKN0hSSEEvMD93eF9mbXQ9cG5n" title="111.png"/>
        </section>
    </section>
    <section>
        <section>
            <section>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <img title="分割线" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd0JDNmhpY3JpYlNZaWJBVXlpYmNuaWN1RDlITUxuRTdwaWJOOWlidno3MmljdkRseFhDVWprZmhGYWhhVnZnLzA=" alt=" "/>
                </p>
            </section>
            <section>
                <section>
                    <section>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 1.2rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(30, 155, 232);">“掌上新物流 &nbsp;智享大未来”</span></strong></span>
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(30, 155, 232); font-size: 1rem;"></span>十个大字格外亮眼。
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            互联速递招商峰会
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            在南航明珠国际酒店召开。
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                            <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9wbmcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUnlnQm04TGtyTnptTmZsVlVjcVpCR0x5QWVzaFU3V3Z3aWF1S2ljeHRBMzNwV0UwOG9mamd5aWE4QS8wP3d4X2ZtdD1wbmc=" title="QQ截图20170316143744.png" alt="QQ截图20170316143744.png"/><br/>
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
                            <br/>
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: 1.25rem; text-align: right; font-size: 0.7rem;">签名墙上，大家挥笔留念</span>
                        </p>
                        <section>
                            <section>
                                <img alt="nnnn.jpg" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUjkxQU12Uk5nWVVCSHVJV1dRdjdwZlJ4NTU1RElRSEJpYUlxNmlhUG1pY0R5YVl5cnlpYnZ4R2IyRWcvMD93eF9mbXQ9anBlZw==" title="nnnn.jpg"/>
                                <section>
                                    <section>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; border-color: rgb(30, 155, 232); color: inherit;">
                                            <br/>
                                        </p>
                                    </section>
                                </section>
                            </section>
                        </section>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.7rem;">11点开始的活动，10点半时，</span>
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.7rem;">200人的大厅已经坐满。</span>
                        </p>
                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; color: rgb(62, 62, 62); text-align: center;">
                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.7rem;">每位来宾认真聆听</span>
                        </p>
                        <section>
                            <section>
                                <section>
                                    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                                        <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUk02WkdTUlZNVXNqaWJHQkZ6bEZBZGZHZVhiamxNb0ttZnNoeFRxZ29ITVJyRUlNcGRUTUFCT0EvMD93eF9mbXQ9anBlZw==" title="QQ截图20170316151524.jpg" alt="QQ截图20170316151524.jpg"/>
                                    </p>
                                </section>
                            </section>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                讲真，大会全场规模恢宏，
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                你有多久没见过这样的场面？
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                讲真！来的200位宾客，
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                可是全国各大地区的商家！
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(255, 0, 0); font-size: 0.9rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">是什么力量，让他们聚在一起？</strong></span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(255, 0, 0); font-size: 0.9rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">是什么渴望，让他们翘首以待？</strong></span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em;">
                                <br/>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(255, 0, 0); font-size: 1.4rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">—互联速递</strong></span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
                                <br/>
                            </p>
                            <section>
                                <section>
                                    <section>
                                        <section>
                                            <span class="135brush" style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; padding: 0.4rem 1.15rem; border-radius: 25px; color: rgb(255, 255, 255); font-weight: inherit; text-decoration: inherit; border-color: rgb(0, 88, 156); background-color: rgb(0, 88, 156);">参会嘉宾</span>
                                        </section>
                                    </section>
                                </section>
                            </section>
                            <section>
                                <section>
                                    <section>
                                        <section>
                                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 0em; text-align: center;">
                                                <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUlJidlFpYjhBb0VHZjhNeVdaeGhpYkV0RHNsNU9kcVRaMU5PaWN5aGg1U0JhQUFMNkxra3BidUlMZy8wP3d4X2ZtdD1qcGVn" title="QQ截图20170316161749.jpg" alt="QQ截图20170316161749.jpg"/>
                                            </p>
                                        </section>
                                    </section>
                                </section>
                            </section>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
                                <br/>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">此次会议我们邀请到的嘉宾有：</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">自治区工商联光彩事业办</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;"></span><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; font-size: 0.9rem;">王勇 &nbsp;&nbsp;</span></strong><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">部长</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">乌鲁木齐建材商会</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">秘书长</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">新疆新丰供应链管理有限公司</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; font-size: 0.9rem;">秦</span></strong><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; font-size: 0.9rem;">旭&nbsp;</span></strong><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">&nbsp;</strong><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">总经理</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">阿克苏台州商会</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; font-size: 0.9rem;">王美仙女士</span></strong>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;">
                                <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px;">&nbsp; &nbsp;兵团食品商会代表。</span>
                            </p>
                            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
                                <br/>
                            </p>
                            <section>
                                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                                    <img title="分割线" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd0JDNmhpY3JpYlNZaWJBVXlpYmNuaWN1RDlITUxuRTdwaWJOOWlidno3MmljdkRseFhDVWprZmhGYWhhVnZnLzA=" alt=" "/>
                                </p>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
    <section>
        <section>
            <img alt="QQ截图20170316163711.jpg" src="http://image.135editor.com/files/users/90/904901/201703/3ISAsf65_PEtV.jpg" title="QQ截图20170316163711.jpg"/>
            <section>
                <section>
                    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; border-color: rgb(33, 33, 34); color: inherit;">
                        <br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;"><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(255, 0, 0);">互联速递与新疆新丰供应链管理有限公司签订战略合作协议</span></strong><br/>
    </p>
    <section>
        <section>
            <section>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <img src="http://image.135editor.com/files/users/90/904901/201703/DGabeZa4_bCGr.jpg" title="316164356_meitu_2.jpg" alt="316164356_meitu_2.jpg"/>
                </p>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    互联速递为加盟商颁发授权牌
                </p>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <img title="分割线" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd0JDNmhpY3JpYlNZaWJBVXlpYmNuaWN1RDlITUxuRTdwaWJOOWlidno3MmljdkRseFhDVWprZmhGYWhhVnZnLzA=" alt=" "/>
                </p>
            </section>
        </section>
    </section>
    <section>
        <section>
            <section>
                <section>
                    <section>
                        <section>
                            <section>
                                <section>
                                    <section>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5rem; text-align: center;">
                                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(12, 12, 12); letter-spacing: 0px; line-height: inherit;">互联速递为来自</span>
                                        </p>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5rem; text-align: center;">
                                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(12, 12, 12); letter-spacing: 0px; line-height: inherit;">库尔勒、昌吉、哈密、</span>
                                        </p>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5rem; text-align: center;">
                                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(12, 12, 12); letter-spacing: 0px; line-height: inherit;">玛纳斯、呼图壁、五家渠、</span>
                                        </p>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5rem; text-align: center;">
                                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(12, 12, 12); letter-spacing: 0px; line-height: inherit;">的加盟商伙伴颁发授权牌</span>
                                        </p>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5rem; text-align: center;">
                                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(12, 12, 12); letter-spacing: 0px; line-height: inherit;">他们在第一时间加入到互联速递中，</span>
                                        </p>
                                        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.5rem; text-align: center;">
                                            <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(12, 12, 12); letter-spacing: 0px; line-height: inherit;">成为互联速递的成员。</span>
                                        </p>
                                    </section>
                                </section>
                            </section>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
    <section>
        <section>
            <section>
                <section>
                    <span class="135brush" style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; padding: 0.4rem 1.15rem; border-radius: 25px; color: rgb(255, 255, 255); font-weight: inherit; text-decoration: inherit; border-color: rgb(0, 88, 156); background-color: rgb(0, 88, 156);">主讲人</span>
                </section>
            </section>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUnVWaDV0ZlhkSmV6Z2x3dVpLQ2MweDVVcmRTTkcycXJkN1JuYUdTU0dFSmNVM0w0SlRKRmdEdy8wP3d4X2ZtdD1qcGVn" alt="QQ截图20170316155947.jpg"/><br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.9rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">付守永老师</strong></span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        他是著名财经作家，
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        畅销书《工匠精神》<span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">《路演大师》作者，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">中国工匠精神传播第一人；</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        2013年出版《工匠精神》<span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">持续畅销至今，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">经过四年传播，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        2016年工匠精神上升到国家战略；
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: 1.1rem;">被誉为</span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">“和平年代的民族英雄”；</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        在过去十多年里<span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">致力于</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">中国成长型企业的案例研究，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        尤其是对中国隐形冠军企业的研究，
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        掌握了大量丰富的实战案例，<span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">在理论创新、</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        实践及创作方面均有深厚建树。
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        被学员誉为“用生命演讲的人”；
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        南开大学MBA特聘专家学者、
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: inherit;">清华大学总裁班导师。</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem;">
        <br/>
    </p>
    <section>
        <section>
            <img alt="QQ截图20170316160856.jpg" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUkpTbW1XU1BCcU5WaWNUZlNRdVd1Q0piaWFTcXZZVUNuOEFSd1NKMkhTUk9IdnRaSnRSOGpQVTV3LzA/d3hfZm10PWpwZWc=" title="QQ截图20170316160856.jpg"/>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
        <br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.9rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">王晓鹏老师</strong></span><span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.75rem; line-height: inherit;"></span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        互联商学院首席讲师
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        常诚恒业信息科技有限公司项目讲师
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        中国体验式培训导师
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        曾任职巨力中国营销策划机构，
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        对当今的企业经营
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        及员工培训研究了六年，
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        总结出一套易落地，易执行的课程，
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        同时也是中国工匠精神传播者
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        付守永老师的得意门生！
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem;">
        <br/>
    </p>
    <section>
        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
            <img title="分割线" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd0JDNmhpY3JpYlNZaWJBVXlpYmNuaWN1RDlITUxuRTdwaWJOOWlidno3MmljdkRseFhDVWprZmhGYWhhVnZnLzA=" alt=" "/>
        </p>
    </section>
    <section>
        <section>
            <section>
                <img src="http://image.135editor.com/files/users/90/904901/201703/WSu8YLxG_t599.jpg" title="20170316181603.jpg" alt="20170316181603.jpg"/>
                <section>
                    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(102, 102, 102); font-size: 0.7rem; text-align: center; text-decoration: inherit;">
                        <br/>
                    </p>
                </section>
            </section>
            <section>
                <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUk05aWFZYmJkUWljT0wzbW1KVkVxaWNNcUZweFc3eUQwR005R3ZNOVBSZDFDajludkhGSllub2RGQS8wP3d4X2ZtdD1qcGVn" title="QQ截图20170316170314.jpg" alt="QQ截图20170316170314.jpg"/>
                <section>
                    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; color: rgb(102, 102, 102); font-size: 0.7rem; font-weight: inherit;">
                        <br/>
                    </p>
                </section>
            </section>
            <section></section>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
        <br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; font-size: 0.75rem;">会议现场<span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; line-height: 1rem;">掌声雷动</span></span>
    </p>
    <section>
        <section>
            <section>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUks4WG9pYnVneXVUUFNsSUM2bXBwMWdwZlEzMmlicWR0dzRCZTBHdEJ1NTVOc1VHYXBzWnFReWliQS8wP3d4X2ZtdD1qcGVn" title="QQ截图20170316170826.jpg" alt="QQ截图20170316170826.jpg"/>
                </p>
                <section>
                    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                        <br/>
                    </p>
                </section>
            </section>
        </section>
    </section>
    <section>
        <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
            <img title="分割线" src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpei9jWlYyaFJwdUFQaHJ4UVUxb3BMa0VObkNCOUFySXhVd0JDNmhpY3JpYlNZaWJBVXlpYmNuaWN1RDlITUxuRTdwaWJOOWlidno3MmljdkRseFhDVWprZmhGYWhhVnZnLzA=" alt=" "/>
        </p>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
        <br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.3rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">来自五湖四海的精英们相聚在一起，<br/></span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.3rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">为的就是 “车轮上的财富密码”——互联速递，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.3rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">“互联网+新物流”发展趋势做探讨。</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem;">
        <br/>
    </p>
    <section>
        <section>
            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUkZaMXY4aWJDS2RuTWR2UXFaeDdDd0kwN0xpYlY0WkhBSmtUTXc4WXFVZkh2R2J2WHBxbEl3MmxRLzA/d3hfZm10PWpwZWc=" title="QQ截图20170316171937.jpg" alt="QQ截图20170316171937.jpg"/>
            </p>
        </section>
        <section>
            <section></section>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
        <br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">伴随着欢快的音乐，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">现场签约仪式逐渐达到了高潮，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">在工作人员的引领下，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; letter-spacing: 0px; color: rgb(12, 12, 12);">加盟商陆陆续续地完成签约仪式，</span>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem;">
        <br/>
    </p>
    <section>
        <section>
            <section></section>
            <section></section>
        </section>
        <section>
            <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                <img src="http://image2.135editor.com/cache/remote/aHR0cHM6Ly9tbWJpei5xbG9nby5jbi9tbWJpel9qcGcvNTZjMVNRaWNZdjBIWTRUSTVXTzYwNm1uTWgwMWU5S2liUjhOang4UnQzZ1ZmUGljYUtTMzBTeTFsM3Z2djFKdzhZWWppYk5zbmFZOFA1a09Ia1hFM1lpYzJTUS8wP3d4X2ZtdD1qcGVn" title="QQ截图20170316171216.jpg" alt="QQ截图20170316171216.jpg"/>
            </p>
        </section>
        <section>
            <section></section>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
        <br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">互联速递招商峰会</strong>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">在激情四射的氛围中圆满落下帷幕。</strong>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">互联速递强大的技术支持、</strong>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">对商业模式的精准定位、</strong>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">完善的市场培训，必将吸引更多加盟商加入进来，</strong>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">携手并肩，共赢天下，</strong>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">实现财富自由，创造无限可能！</strong>
    </p>
    <section>
        <section>
            <section>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem; text-align: center;">
                    <img src="http://image.135editor.com/files/users/90/904901/201703/ELrS2NaS_PuBI.jpg" title="QQ截图20170316174551.jpg" alt="QQ截图20170316174551.jpg"/>
                </p>
                <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.2rem;">
                    <br/>
                </p>
            </section>
        </section>
    </section>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">彩蛋来啦~</strong><br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem;">
        <br/>
    </p>
    <p style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin-top: 0px; margin-bottom: 0px; line-height: 1.25rem; text-align: center;">
        <span style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px; color: rgb(255, 0, 0); font-size: 1rem;"><strong style="-webkit-tap-highlight-color: rgba(255, 255, 255, 0); margin: 0px;">常家军—年轻的力量势不可挡</strong></span>
    </p>
    <section>
        <section>
            <img alt="454502057233221584.jpg" src="http://image.135editor.com/files/users/90/904901/201703/7HIxHuuT_zuxz.jpg" title="454502057233221584.jpg"/>
        </section>
    </section>
</section>
<p>
    <br/>
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
