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
		<link rel="stylesheet" type="text/css" href="css/price.css" />
		
		<title>速递价格</title>
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
							<a href="###" id="loginuser">登录</a>
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
						<img class="imgbtn" src="img/ordernav/wode.png" />
						<span>我的速递</span>

					</a>
				</li>
				<li>
					<a href="price.jsp">
						<img class="imgbtn" src="img/ordernav/jiage_.png" />
						<span class="hlsd-color">速递价格</span>
						<div class="order-active"></div>
					</a>
				</li>
			</ul>

		</div>
		<!--price -->
		<div class="price">
			<div class="price-box">
				<div class="intracity-price">
					<div class="price-title">同城速递价格</div>
					<div class="price-content">
						<div class="price-content-left">
							<div class="price-content-title">骑手价格</div>
							<ul>
								<li><b>起步价:</b><span>配送里程≤3公里的价格，普通物品起步价为12元，送生日蛋糕起步价16元。						
起步价包含里程为3公里。骑手接单范围为5公里，最大配送距离为10公里。						
</span></li>
								<li><b>里程费:</b><span>2元/公里（3-15公里内）</span></li>
								<li><b>夜间费:</b><span>0.5元/公里（夜间23：00--次日05：00时，预约订单以预约时间为准）</span></li>
								<li><b>远途费:</b><span>1.5元/公里（里程数>15公里）</span></li>
								<li><b>服务费:</b><span>骑手暂无服务费</span></li>
								<li><b style="height: 120px;">浮动费:</b><span>根据货物的重量和体积大小交叉组合，在总价（除开夜间费和服务费）的基础上增加一定百分比的上浮费用。
					 							<p>大型物品：上浮系数为20%；</p>
					 							<p>中型物品：上浮系数为10%；</p>
					 							<p>小型物品：上浮系数为0（即不增加上浮费用）。</p>
					 							</span></li>

							</ul>
						</div>
						<div class="price-content-right">
							<div class="price-content-title">司机价格</div>
							<ul>
								<li><b>起步价:</b><span>配送里程≤3公里的价格，普通物品起步价为15元，送生日蛋糕起步价16元。							
司接单范围为5公里，配送距离没有限制，配送距离超过15公里时需要加收长途费用。							
</span></li>
								<li><b>里程费:</b><span>2元/公里（3-15公里内）</span></li>
								<li><b>夜间费:</b><span>0.5元/公里（夜间23：00--次日05：00时，预约订单以预约时间为准）</span></li>
								<li><b>远途费:</b><span>1.5元/公里（里程数>15公里）</span></li>
								<li><b>服务费:</b><span>10元（用户需要司机提供上门取件服务时需支付服务费）。</span></li>
								<li><b style="height: 120px;">浮动费:</b><span>根据货物的重量和体积大小交叉组合，在总价（除开夜间费和服务费）的基础上增加一定百分比的上浮费用。
					 							<p>大型物品：上浮系数为20%；</p>
					 							<p>中型物品：上浮系数为10%；</p>
					 							<p>小型物品：上浮系数为0（即不增加上浮费用）。</p>
					 							</span></li>

							</ul>
						</div>
						<!-- <div class="price-content-left">
							<div class="price-content-title">一车多单价格</div>
							<ul>
								<li><b>起步价:</b><span>配送里程≤3公里的价格，起步价为15元,第二单不满8元，按照8元计。</span></li>
								<li><b>里程费:</b><span>2元/公里（3-15公里内）</span></li>
								<li><b>夜间费:</b><span>0.5元/公里（夜间23：00--次日05：00时，预约订单以预约时间为准）</span></li>
								<li><b>远途费:</b><span>1.5元/公里（里程数>15公里）</span></li>
								<li><b>服务费:</b><span>10元（用户需要司机提供上门取件服务时需支付服务费，一车多单只收取一次10元服务费）。</span></li>
								<li><b style="height: 120px;">浮动费:</b><span>根据货物的重量和体积大小交叉组合，在总价（除开夜间费和服务费）的基础上增加一定百分比的上浮费用。
					 							<p>大型物品：上浮系数为20%；</p>
					 							<p>中型物品：上浮系数为10%；</p>
					 							<p>小型物品：上浮系数为0（即不增加上浮费用）。</p>
					 							<p>交叉组合物品，取大的浮动系数上浮。</p>
					 							</span></li>
								<li><b>计价公式:</b><span>总价=第一单价格+第二单价格+第三单价格</span></li>
								<li><b style="height: 100px;">说明:</b><span>
					 							<p>1、一车多单采用分段收费，配送顺序由里程决定。</p>
					 							<p>2、一车多单中第一单未超过15公里，则不计算远途费。</p>
					 							<p>3、一车多单中浮动费用按寄货人到收货人的实际里程数进行费用计算。</p>
					 							<p>4、一车多单总价格为每个里程段的费用相加。</p>
					 			</span></li>
								<li><b>重量模式:</b><span>
					 							<p>0-20公斤:	小型货物		长宽高小于40CM为小型货物		</p>
					 							<p>21-50公斤:	中型货物   		长宽高小于60CM为中型货物		</p>
					 							<p>50公斤以上:	大型货物		长宽高大于60CM为大型货物	</p>
					 			</span></li>
							</ul>
						</div> -->
					</div>

				</div>
				<div class="intracity-price">
					<div class="price-title">跨城速递价格</div>
					<div class="price-content">
						<div class="price-content-left">
							<div class="price-content-title">拼车成功</div>
							<ul>
								<li><b>起步价:</b><span>配送里程≤3公里的价格，起步价为8元</span></li>
								<li><b style="height: 120px;">里程费:</b><span><p>1元/公里（≤3公里），优惠价格：各区间价格相加</p>
					 								  <p>3-10公里部分    8折      0.8元/公里</p>
					 								  <p>10-30公里部分   6折      0.6元/公里</p>
					 								  <p>30-200公里部分  4折      0.4元/公里</p>
					 								  <p>200-500公里部分 3折      0.3元/公里</p>
					 								  <p>500公里以上部分 2折      0.2元/公里</p>
					 									</span></li>

								<li><b>远途费:</b><span>拼车成功无远途费</span></li>
								<li><b>夜间费：</b><span>0.5元/公里（夜间23：00--次日05：00时，预约订单以预约时间为准）</span></li>
								<li><b>服务费:</b><span>10元（用户需要司机提供上门取件服务时需支付服务费）。</span></li>
								<li><b style="height: 150px;">浮动费:</b><span>根据货物的重量和体积大小交叉组合，在总价（除开夜间费和服务费）的基础上增加一定百分比的上浮费用。
					 							<p>大型物品：上浮系数为20%；</p>
					 							<p>中型物品：上浮系数为10%；</p>
					 							<p>小型物品：上浮系数为0（即不增加上浮费用）。</p>
					 							<p>交叉组合物品，取大的浮动系数上浮。</p>
					 							</span></li>

							</ul>
						</div>
						<div class="price-content-right">
							<div class="price-content-title">未拼车成功</div>
							<ul>
								<li><b>起步价:</b><span>配送里程≤3公里的价格，起步价为10元.</span></li>
								<li><b>里程费:</b><span>1元/公里（3-15公里）</span></li>
								<li><b>远途费:</b><span>里程数≥15公里 3.5元/公里(2+1.5元/公里)</span></li>
								<li><b>夜间费:</b><span>0.5元/公里（夜间23：00--次日05：00时，预约订单以预约时间为准）</span></li>
								<li><b>服务费:</b><span>10元（用户需要司机提供上门取件服务时需支付服务费）。</span></li>
								<li><b style="height: 150px;">浮动费:</b><span>根据货物的重量和体积大小交叉组合，在总价（除开夜间费和服务费）的基础上增加一定百分比的上浮费用。
					 							<p>大型物品：上浮系数为20%；</p>
					 							<p>中型物品：上浮系数为10%；</p>
					 							<p>小型物品：上浮系数为0（即不增加上浮费用）。</p>
					 							<p>交叉组合物品，取大的浮动系数上浮。</p>
					 							</span></li>

							</ul>
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
		<script src="js/hlsd-hover.js"></script>
		<!--同比缩放-->
		<script src="js/zoom-body.js"></script>
		<!-- 登录 -->
		<script src="js/time-code.js?v=${nowTimeNow}"></script>
		<script>
			var temp = 3
		</script>
	</body>

</html>