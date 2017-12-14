<%@page import="java.util.Date"%>
<%@page import="com.fh.controller.weixin.pay.util.MD5Util"%>
<%@page import="com.fh.util.Tools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
	request.setAttribute("ctx", request.getContextPath());
	request.setAttribute("nowTimeNow", new Date().getTime());
	request.setAttribute("md5Key", MD5Util.string2MD5(Tools.getProperty("api_token_key", "")));
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="keywords" content="互联速递，同城速递，专人直送，同城急件，代买，代送，代购，同城加急，同城快递，限时送达，最快的快递">
		<meta name="description" content="互联速递是国内最快的同城速递和跨城速递服务公司，专人直送，60分钟送达全城！24小时在线为用户提供同城或者跨城急件,蛋糕,鲜花,生鲜,水果等限时递送服务。">
		<link rel="stylesheet" type="text/css" href="css/reset.css?v=${nowTimeNow}" />
		<link rel="stylesheet" type="text/css" href="css/basic.css?v=${nowTimeNow}" />
		<link rel="stylesheet" type="text/css" href="css/myorder.css?v=${nowTimeNow}"/>
		<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css?v=${nowTimeNow}" />
		<link rel="stylesheet" href="css/pagination.css">
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
							<a class="hlsd-color"  href="intracity.jsp">速递</a>
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
						<img class="imgbtn" src="img/ordernav/tongcheng_.png"/>
						<span >同城速递</span>
						
					</a>
				</li>
				<li>
					<a href="crosscity.jsp">
						<img  class="imgbtn" src="img/ordernav/kuacheng.png"/>
						<span >跨城速递</span>
						
					</a>
				</li>
				<li>
					<a href="myorder.jsp">
						<img class="imgbtn" src="img/ordernav/wode_.png"/>
						<span class="hlsd-color">我的速递</span>
						<div class="order-active"></div>
					</a>
				</li>
				<li>
					<a href="price.jsp">
						<img class="imgbtn" src="img/ordernav/jiage.png"/>
						<span>速递价格</span>
					</a>
				</li>
			</ul>

		</div>
		<!--myorder-->
		<div class="myorder">
			<div class="myorder-left">
				<ul>
					<li class="myorder-active"><a href="myorder.jsp">我的订单</a></li>
					<li><a href="###">我的账户</a></li>
					<li><a href="###">账户设置</a></li>
				</ul>
			</div>
			<div class="myorder-right">
				<ul class="myorder-tab">
					<li class="myorder-order-active"><a href="#tab1"> 全部订单<span id="sumordertab1">[0]</span></a></li>
					
					<li><a href="#tab2">待取货<span id="sumordertab2">[0]</span></a></li>

					<li><a href="#tab3">运送中<span id="sumordertab3">[0]</span></a></li>
					<li><a href="#tab4">已过期<sapn id="sumordertab4">[0]</sapn></a></li>
					<li><a href="#tab5">待评价<span id="sumordertab5">[0]</span></a></li>
				</ul>
			<div class="myorder-content" id="tab1"><div class="order-null">
						正在加载订单......
					</div></div>
			<div class="myorder-content" id='tab2'><div class="order-null">
						正在加载订单......
					</div></div>	
			<div class="myorder-content" id='tab3'><div class="order-null">
						正在加载订单......
					</div></div>
			<div class="myorder-content" id='tab4'><div class="order-null">
						正在加载订单......
					</div></div>
			<div class="myorder-content" id='tab5'><div class="order-null">
						正在加载订单......
					</div></div>
					  <div class="M-box3"></div>
			</div>
		</div>
		<jsp:include page="/web/footer.jsp"></jsp:include>
		<jsp:include page="/web/login.jsp"></jsp:include>
		<jsp:include page="/web/city.jsp"></jsp:include>
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="layer/layer.js"></script>
		<!-- <script src="layui/layui.js" charset="utf-8"></script> -->
		<script src="js/hlsd-city-address.js?v=${nowTimeNow}"></script>
		<script src="js/hlsd-hover.js?v=${nowTimeNow}"></script>
		<!--同比缩放-->
		<script src="js/zoom-body.js?v=${nowTimeNow}"></script>
		<!-- 登录 -->
		<script src="js/time-code.js?v=${nowTimeNow}"></script>
		<!--sweetalert弹出框 -->
		<script src="sweetalert/sweetalert-dev.js?v=${nowTimeNow}"></script>
		<!-- 分页 -->
		<script src="js/jquery.pagination.js"></script>	
		<script>
	
		
			var urlpay='${ctx}/weixin/generateQRcode'
			var urlseed='${ctx}/app_openapi/sureSendGoods'

			var myorderObj={
				md5Key:'${md5Key}'
			}
			var md5KeyObj={
				md5Key:'${md5Key}'
			}
			var urlObj={
				myorder:'${ctx}/app_openapi/selectMyOrders'
			}

			var temp=2
			var tabDom='tab1'
			var apiStatus=''
			var currentPage=1
		
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
			        console.log( $(activeTab)[0].id)
			        switch( $(activeTab)[0].id)
						{
						case 'tab1':
						
						tabDom='tab1'
						apiStatus=''
						  break;
						case 'tab2':
						
						 	 tabDom='tab2'
							apiStatus='1'
						  break;
						  case 'tab3':
							 tabDom='tab3'
							apiStatus='2'
						  break;
						  case 'tab4':
						  tabDom='tab4'
							apiStatus='3'
						  break;
						  case 'tab5':
						  	tabDom='tab5'
							apiStatus='4'
						  break;
						  case 'tab6':
						  tabDom='tab6'
							apiStatus='5'
						  break;
						default:
						}
					myorder(1, tabDom, apiStatus) 	
					$(activeTab).slideDown(); //Fade in the active content
			        return false;
			    });  
			  
			});  
		</script>
		<!--  -->
		<script src="js/myorder.js?v=${nowTimeNow}"></script>
	</body>

</html>