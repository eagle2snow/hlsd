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
		<link rel="stylesheet" type="text/css" href="css/myorder.css" />
	
		<title>我的速递</title>
	</head>

	<body>
		<!--hlsd-header-->
		<div class="hlsd-header">
			<div class="header-link">

			</div>
			<div class="nav">
				<div class="logo">
					<img src="img/navlogo.png" />
				</div>
				<div class="list">
					<ul class="list-ul">
						<li class="nav-active">
							<a href="index.jsp">首页</a>
						</li>
						<li class="sudi-nav">
							<a class="hlsd-color" href="intracity.jsp">速递</a>
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
							<a href="###"  id="loginuser">登录</a>
						</li>
					</ul>

				</div>
			</div>
		</div>
		<!--tab-->
		<div class="ordertab">
			<ul id="tabul">
				<li>
					<a href="intracity.jsp">
						<img class="imgbtn" src="img/ordernav/tongcheng_.png" />
						<span>同城速递</span>

					</a>
				</li>
				<li>
					<a href="crosscity.jsp">
						<img class="imgbtn" src="img/ordernav/kuacheng.png" />
						<span>跨城速递</span>

					</a>
				</li>
				<li>
					<a href="myorder.jsp">
						<img class="imgbtn" src="img/ordernav/wode_.png" />
						<span class="hlsd-color">我的速递</span>
						<div class="order-active"></div>
					</a>
				</li>
				<li>
					<a href="price.jsp">
						<img class="imgbtn" src="img/ordernav/jiage.png" />
						<span>速递价格</span>
					</a>
				</li>
			</ul>

		</div>
		<!--myorder-->
		<div class="myorder">
			<div class="myorder-left">
				<ul>
					<li>
						<a href="myorder.jsp">我的订单</a>
					</li>
					<li class="myorder-active">
						<a href="account.jsp">我的账户</a>
					</li>
					<li>
						<a href="account.jsp">账户设置</a>
					</li>
				</ul>
			</div>
			<div class="myorder-right">
				<ul class="myorder-tab">
					<li class="myorder-order-active">
						<a href="#tab1"> 账户余额<span></span></a>
					</li>
					<li>
						<a href="#tab2">充值/提现<span></span></a>
					</li>
					<li>
						<a href="#tab3">优惠券<span></span></a>
					</li>
					<li>
						<a href="#tab4">交易明细<sapn></sapn></a>
					</li>
					
				</ul>
				<div class="myorder-content" id="tab1">
					<div class="order-box">
						<ul class="order-box-title">
							<li>
								<p>你当前的余额</p>
								<p style="color: red;">126元</p>
								<p>
									<a href="">充值</a>
									<a href="">提现</a>
								</p>
							</li>
							<li>
								<p>余额消费明细</p>
								<p>充值明细</p>
								<p>提现明细</p>
							</li>
						</ul>
						<div class="order-box-border">
							<ul class="order-box-head">
							<li>下单时间</li>
							<li>订单号</li>
							<li>交易类型</li>
							<li>订单金额</li>
							<li>优惠信息</li>
							<li>实付金额</li>
							<li>支付状态</li>
						</ul>
						<ul class="order-box-content">
							<li>2017-06-06 12:30</li>
							<li>DH2017060913342102</li>
							<li>快车两单</li>
							<li>20元</li>
							<li>-10</li>
							<li>10元</li>
							<li>已支付</li>
						</ul>
						<ul class="order-box-content">
							<li>2017-06-06 12:30</li>
							<li>DH2017060913342102</li>
							<li>快车两单</li>
							<li>20元</li>
							<li>-10</li>
							<li>10元</li>
							<li>已支付</li>
						</ul>
						<ul class="order-box-content">
							<li>2017-06-06 12:30</li>
							<li>DH2017060913342102</li>
							<li>快车两单</li>
							<li>20元</li>
							<li>-10</li>
							<li>10元</li>
							<li>已支付</li>
						</ul>
						<ul class="order-box-content">
							<li>2017-06-06 12:30</li>
							<li>DH2017060913342102</li>
							<li>快车两单</li>
							<li>20元</li>
							<li>-10</li>
							<li>10元</li>
							<li>已支付</li>
						</ul>
						<ul class="order-box-content">
							<li>2017-06-06 12:30</li>
							<li>DH2017060913342102</li>
							<li>快车两单</li>
							<li>20元</li>
							<li>-10</li>
							<li>10元</li>
							<li>已支付</li>
						</ul>
						</div>
						
					</div>
					</div>
				</div>
				<div class="myorder-content" id='tab2'>
					<div class="order-null">
						暂无充值/提现
					</div>
				</div>
				<div class="myorder-content" id='tab3'>
					<div class="order-null">
						暂无待取货订单
					</div>
				</div>
				<div class="myorder-content" id='tab4'>
					<div class="order-null">
						暂无交易明细
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
		<script src="js/hlsd-hover.js"></script>
		<!--同比缩放-->
		<script src="js/zoom-body.js"></script>
		<!-- 登录 -->
		<script src="js/time-code.js?v=${nowTimeNow}"></script>
		<script>
			var temp = 2
			$(document).ready(function() {

				//Default Action  
				$(".myorder-content").hide(); //Hide all content  
				$("ul.myorder-tab li:first").addClass("active").show(); //Activate first tab  
				$(".myorder-content:first").show(); //Show first tab content  

				//On Click Event  
				$("ul.myorder-tab li").click(function() {
					$("ul.myorder-tab li").removeClass("myorder-order-active"); //Remove any "active" class  
					$(this).addClass("myorder-order-active"); //Add "active" class to selected tab  
					$(".myorder-content").hide(); //Hide all tab content  
					var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content  
					console.log($(activeTab))
					$(activeTab).slideDown(); //Fade in the active content
					return false;
				});

			});
		</script>
	</body>

</html>