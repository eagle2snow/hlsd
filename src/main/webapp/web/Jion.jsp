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
		<link rel="stylesheet" type="text/css" href="css/json.css" />
		<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css?v=${nowTimeNow}" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	
		<!-- 视频 -->
		<link href="css/video-js.css" rel="stylesheet">
		<!-- If you'd like to support IE8 -->
		<script src="js/videojs-ie8.min.js"></script>
		<title>招商加盟</title>
		<style>
			

			.model-box{
				display: none;
				position: fixed;
				top: 0;
				left: 0;
				z-index:99999;
				height: 100%;
				width: 100%;
				background: rgba(0,0,0,0.6);

			}
			.model-content{
				width: 1000px;
				height: 600px;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: #fff;
				margin: auto;
				border-radius: 20px;
			}
			.model-content iframe{
				width:900px;
				height: 600px;
			}
			.model-box-close{
				position: absolute;
				top: -25px;
				right: -25px;
				background: #44acff;
				height: 50px;
				width: 50px;
				border-radius: 50%;
				text-align: center;
				line-height: 50px;
				font-size: 18px;
				color: #fff;
				
			}
			.model-box-html{
				height: 600px;
			}
			.m{ 
				zoom:1.18!important;
				width: 550px;
				 height: 380px; 
			 
			  }
			  .video-js .vjs-big-play-button{
			  	top:180px;
			  	left: 300px;
			  }
		</style>
	</head>

	<body>
		
		<!--hlsd-header-->
		<div class="j-header">
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
							<a class="hlsd-color" href="Jion.jsp">招商加盟</a>
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
				<div class="jion-header-box">
					<h2>加盟商签约仪式</h2>
					<ul>
						<li>• 突破传统  展望未来   </li>
						<li>• 互联速递信息服务平台已强势上线   </li>
						<li>• 面向全国招募合作伙伴  共同实现财富自由</li>
					</ul>
				</div>
			</div>
		</div>
		<!--jion-new-1-->
		<div class="jion-new">
			<div class="jion-new-text">
				<h2>行业前景</h2>
				<p> 2016年快递总收入4005亿元
据中国邮政数据统计2017年5月份快递收入已经突破了4000亿元（相当于2016年全年的收入，根据历年快递收入月环比数据可以肯定2017年快递收入将远超预测的数字）
快递主要分为   同城快递   国内异地快递  国际快递三大类
根据国家邮政统计快递年复合增长率在28-35%之间
同城快递，异地和国际快递业务量分别占全部快递业务量的26.1%，71.8%和2.1% 
业务收入分别占全部快递收入的14.5%，54.6%和13.3%，
通过上述可见快递三大板块业务量数据占比相对稳定但是从收入上来看<span style="color: red">同城快递</span>是快递业务中<span style="color: red">增长速度最快</span>的子行业；<span style="color: red">互联速递项目属于同城速递项目 及“互联网+速递”</span>
				</p>
			</div>
			<div class="jion-new-img">
				<img src="img/jion/new-1.jpg" />
			</div>
		</div>
		<!--jion-new-2-->
		<div class="jion-new">
			<div class="jion-new-img">
			<div class="m">
		<video id="my-video" class="video-js" controls preload="auto" width="650" height="380"
		  poster="img/jion/tiaozhuan.jpg" data-setup="{}">
			<source src="http://app.huliansudi.com/web/web/mp4/cetv_1_huliansudi.mp4" type="video/mp4">
			
			<p class="vjs-no-js">
			  浏览器不支持，请重新下载最新浏览器...
			  <a href="" target="_blank">互联速递</a>
			</p>
		  </video>
		  <script src="./js/video.min.js"></script>	
		  <script type="text/javascript">
			var myPlayer = videojs('my-video');
			// videojs("my-video").ready(function(){
			// 	var myPlayer = this;
			// 	myPlayer.play();
			// });
		</script>
	</div>
			<!-- <div class="jion-new-img-btn">
				<img src="img/jion/tiaozhuan.jpg" />
				<img  id="paly" src="img/jion/play.svg" />
				
			</div>
			 -->
				<!-- <div style="position:relative; padding-bottom:56.25%; overflow:hidden;"><iframe src="//content.jwplatform.com/players/40mHzzbP-zt5U7pCU.html" width="100%" height="100%" frameborder="0" scrolling="auto" allowfullscreen style="position:absolute;"></iframe></div> -->
				
				
			<!-- 	<ul>
					<li>• 降低物流信息资源的低速性、流失性，提高全民物流信息资源的时效性、合理性，促进资源有效利用。</li>
					<li>• 中国人保为平台战略合作伙伴，提供保险理赔支持。</li>
					<li>• 线上线下高效融合大众创业万众创新，创新物流资源配置方式，发展商业新模式、经营新业 态，提升速递业信息化、标准化、智能化，实现速递业转型升级，为国民经济提质增效提供有力支撑。
					</li>
				</ul> -->

			</div>
			<div class="jion-new-text-1">
				<h2>互联商业模式</h2>
				<p> 项目以“互联网+”的理念，采用O2O的商业模式，线上线下做到无缝对接，让线下业务环节转换到线上操作。 帮助用户、司机、快递员在线交易。解决需求者信息及时匹配、沟通、下单、发运，收件、支付。从根本上降低物品流通费用。 首先，我们打造——面向全民的免费线上速递 信息服务平台 提升速递平台信息服务的精、准、稳，利用合理资源匹配，既能让客户享受到物品流通之便利，又能让司机增加额外收入，最大化满足各方所需，真正做到创新、协调、绿色、开放、共享的发展理念。 其次，通过打造线下遍布全国的信息服务平台网点，线下网点帮助全民速递信息服务平台拓宽服务渠道，进行线下信息服务平台的支撑和推广。
				</p>
			</div>

		</div>
		<!--link-->
		<div class="link">
			<div class="link-box">
				<h2>如何成为我们的合伙人</h2>
				<h3>WHAT SHOULD THE PARTNERS DO</h3>
				<p class="border"></p>
				<ul>
					<li>> 所有合伙人招募的团队由总公司统一打造、培训、管理；</li>
					<li>> 导入客户，客户免费在平台上与车辆、快递员直接交易，为客户带来更多优惠；</li>
					<li>> 另一端导入车辆司机，增加司机收入，降低空车率；</li>
					<li>> 导入快递公司，增加快递公司原有订单量，业务量不断上升；</li>
					<li>> 客户、司机、快递员在平台上免费注册、线上交易，真正实现轻松化、系统化收益。</li>
				</ul>
			</div>
		</div>
		<!--jionus-->
		<div class="jionus">
			<div class="jionus-box">
				<h2>为什么选择我们</h2>
				<h3>合伙人的收益</h3>
				<ul>
					<li><img src="img/jion/jion1.png"/>
					<p class="title-p">畅享盈利点</p>
					<p class="title-b">经营的盈利（由三大业务组成）</p>
					<p class="title-b">股权的盈利   &nbsp; 配送的盈利</p>

					</li>
					<li><img src="img/jion/jion2.png"/>
					<p class="title-p">获得原始股权</p>
					<p class="title-b">拥有原始股权</p>
					<p class="title-b"> 享有市值裂变，股份升值</p></li>
					<li><img src="img/jion/jion3.png"/>
					<p class="title-p">资源共享</p>
					<p class="title-b">全国的互联速递加盟伙伴</p>
					<p class="title-b"> 资源互通，信息共享</p></li>
					<li><img src="img/jion/jion4.png"/>
					<p class="title-p">获得全国人脉圈</p>
					<p class="title-b">加盟等于获得辐射全国的人脉圈</p>
					<p class="title-b"> </p></li>
				</ul>
				<div class="jion-structure">
				<h2>合伙人合作结构</h2>
				<div><img src="img/jion/structure.png"/></div>
			</div>

			<!-- <div class="jion-input">
				<p><label for="">合伙人姓名</label><input type="text" name="" id="" value="" /></p>
				<p><label for="">意向区域</label><input type="text" name="" id="" value="" /></p>
				<p><label for="">意向加盟级别</label>
					<b class="radio-input">
						<input name="Fruit" type="radio" value="" />省级
						<input name="Fruit" type="radio" value="" />市级
						<input name="Fruit" type="radio" value="" />区级
						<input name="Fruit" type="radio" value="" />县级
					</b></p>
				<p><label for="">电话号码</label><input type="text" name="" id="" value="" /></p>
				<p><label for="">验证码</label><input style="width: 200px;"  type="text" name="" id="" value="" /><input class="countdown" type="button" name="" id="countdown" value="获取验证码" /></p>
				<a href="">提交</a>
			</div> -->
			</div>
		</div>
		<!-- new -->
		<div class="new">
			<div class="new-left">
				<div class="new-left-box">
					<h2><b>互联动态</b> <span>News</span></h2>
					<ul>
						<li id='detail1' style="padding-top: 20px">
							<a href="detail1.jsp">
								<p>2017/03/17</p>
								<span>热烈祝贺互联速递招商峰会取得圆满成功</span>
							</a>
						</li>
						<li id='detail'>
							<a href="detail.jsp">
								<p>2017/02/24</p>
								<span>互联商学院首届加盟商精英培训</span>
							</a>
						</li>
						
						<li id='detail2'>
							<a href="detail2.jsp">
								<p>2017/01/23</p>
								<span>2017年互联速递项目发布会暨招商峰会盛大召开</span>
							</a>
						</li>
						<li id='detail4'>
							<a href="detail4.jsp">
								<p>2017/01/06</p>
								<span>互联速递——北京项目签约会圆满落幕</span>
							</a>
						</li>
						<li id='detail3'>
							<a href="detail3.jsp">
								<p>2016/12/26</p>
								<span>互联速递招商峰会，新疆省代成功签约</span>
							</a>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="new-right">
			<!-- 第1篇 -->
				<div class="new-right-top detail1">
					<div class="new-right-data">
						<p>03.17</p>
						<span>2017</span>
					</div>
					<div class="new-right-img">
						<img src="http://image.135editor.com/files/users/90/904901/201703/DGabeZa4_bCGr.jpg">
					</div>
					<div class="new-right-detail">
						<h2>热烈祝贺互联速递招商峰会取得圆满成功</h2>
						<p> 3月15日，新疆乌鲁木齐南航明珠国际酒店，
							从上午10:00点开始，
							不断有人从四面八方涌来。
							半个小时后，酒店三楼的红山厅门口，
							已是人山人海。互联速递为加盟商颁发授权牌
							 
							互联速递为来自
							库尔勒、昌吉、哈密、
							玛纳斯、呼图壁、五家渠、
							的加盟商伙伴颁发授权牌
							他们在第一时间加入到互联速递中，
							成为互联速递的成员。</p>
						<a class="hlsd-btn new-more-btn" href="detail1.jsp">了解更多</a>
					</div>
				</div>


				
			<!-- 第2篇 -->
				<div class="new-right-top detail">
					<div class="new-right-data">
						<p>02.24</p>
						<span>2017</span>
					</div>
					<div class="new-right-img">
						<img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgu4PAxQUovKbdjQcw3hk4shA!1000x1000.jpg">
					</div>
					<div class="new-right-detail">
						<h2>互联商学院首届加盟商精英培训</h2>
						<p> 2月19号互联速递首期加盟商精英培训班，
在互联速递商学院教室举行，
来自全国各地加盟商和业务骨干们参加了此次培训会，
学习“互联网+”的思维进一步提升自身的战斗力.</p>
						<a class="hlsd-btn new-more-btn" href="detail.jsp">了解更多</a>
					</div>
				</div>
				
			<!-- 第3篇 -->
				<div class="new-right-top detail2">
					<div class="new-right-data">
						<p>01.22</p>
						<span>2017</span>
					</div>
					<div class="new-right-img">
						<img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAgvu2VxAUo0KXggAcwoAY42AQ.jpg">
					</div>
					<div class="new-right-detail">
						<h2>2017年互联速递项目发布会暨招商峰会盛大召开</h2>
						<p> 2017年1月22日，乌鲁木齐市常诚恒业信息科技有限公司在君邦天山大饭店隆重召开“2017年互联速递项目发布会暨招商峰会”乌鲁木齐市常诚恒业信息科技有限公司特别邀请到我们战略合作伙伴，北京路演时代投资管理咨询有限公司董事长付守永先生担任本场主讲老师。
　　伴随着移动O2O时代的来临，各行各业都在积极响应“互联网+”的行动计划，而互联速递是用 “互联网+速递”的技术改变传统速递模式，帮助用户和司机快递员线上直接交易，减少中间不必要环节，从根本上满足各方所需，真正做到服务国民，辐射全国。现在的物流机制存在缺失和空白，时效性不能被满足，信息获取局限性，资源流失性，信息货物的安全性。互联速递正是解决这些传统速递行业的痛点。</p>
						<a class="hlsd-btn new-more-btn" href="detail2.jsp">了解更多</a>
					</div>
				</div>
				
			<!-- 第4篇 -->
				<div class="new-right-top detail4">
					<div class="new-right-data">
						<p>03.17</p>
						<span>2017</span>
					</div>
					<div class="new-right-img">
						<img src="http://image.135editor.com/files/users/90/904901/201701/5YPc9rFr_hUph.jpg">
					</div>
					<div class="new-right-detail">
						<h2>互联速递——北京项目签约会圆满落幕</h2>
						<p> 互联速递全民速递信息服务平台，帮助发件人、车主、快递员通过手机APP（互联速递）。真正做到合理资源无缝匹配，既能帮助客户解决物品流通所需，又能提高司机收入，减少快递员不必要沟通、定位过程，提高工作效率，最大程度的满足各方所需。
高效是我们的责任，品质是我们的追求。从下单、接单、取件、送件我们全程提供优质的速递信息服务。上门收件减轻客户负担；健全的线上系统，对物品进行精准跟踪。专车速递信息服务、顺风车速递信息服务更加方便国民速递生活。</p>
						<a class="hlsd-btn new-more-btn" href="detail4.jsp">了解更多</a>
					</div>
				</div>
				
			<!-- 第5篇 -->
				<div class="new-right-top detail3">
					<div class="new-right-data">
						<p>12.26</p>
						<span>2016</span>
					</div>
					<div class="new-right-img">
						<img src="http://11769024.s21i-11.faiusr.com/2/ABUIABACGAAg7_qIwwUo5J-OgAQw6hg4xhA!800x800.jpg">
					</div>
					<div class="new-right-detail">
						<h2>互联速递招商峰会，新疆省代成功签约</h2>
						<p> “互联速递招商峰会，新疆省代成功签约”，恭祝各位企业家朋友们携手常诚恒业智想财富大未来。签约仪式的开展，得到了多方面的认可，来自新疆总代理意向合作深层次洽谈签约。互联速递希望利用平台用户与数据的力量，加速速递行业的发展。在举办的“互联速递招商峰会，新疆省代签约”，常诚恒业清晰的道出了互联速递的定位——“全民速递信息服务平台”互联速递以智能速递帝国正以稳健切大跨步式的面向全国诚招合伙人，现在是互联网的时代亦是资本的时代，互联速递合伙人火热招募中，望与有共同梦想的有志之士携手共赢智想未来！
加盟热线：400-0755-828</p>
						<a class="hlsd-btn new-more-btn" href="detail3.jsp">了解更多</a>
					</div>
				</div>
				<div class="new-right-bottom"></div>
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
		<!--sweetalert弹出框 -->
		<script src="sweetalert/sweetalert.min.js?v=${nowTimeNow}"></script>
		<script>
		 

        
		// $('.jion-new-img-btn').on('mouseover',function(){
		// 	console.log(0)
		// 	$('#paly').show()
		// })
		// $('.jion-new-img-btn').on('mouseout',function(){
		// 	console.log(1)
		// 	$('#paly').hide()
		// })


		$('.jion-new-img-btn').on('click',function(){
			$('.model-box').show()
		})
		$('.model-box-close').on('click',function(){
			$('.model-box').hide()
		})

			$('.new-right-top').hide()
			$('.detail1').show()
			$('.new-left-box li').on('mouseenter',function () {
				console.log($(this).attr('id'))
				$('.new-right-top').hide()
				$('.'+$(this).attr('id')).show()
			})
		</script>
	</body>
	<script>
	// $(document).ready(function(){browserRedirect();
	// function browserRedirect() {
 //            var sUserAgent = navigator.userAgent.toLowerCase();
 //            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
 //            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
 //            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
 //            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
 //            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
 //            var bIsAndroid = sUserAgent.match(/android/i) == "android";
 //            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
 //            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
           
 //            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
 //                //phone
              
 //            } else {
 //              //pc
 //              $('body').append('<div class="model-box"><div class="model-content"><div class="model-box-close">X</div><div class="model-box-html"><iframe src="https://m.365yg.com/i6445855072747258382?v=${nowTimeNow}" frameborder="0"   width="900" height="550" scrolling="no" ></iframe></div></div></div>')
 //            }
 //        }})
		
		
	</script>

</html>