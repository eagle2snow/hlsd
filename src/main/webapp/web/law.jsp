
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
    互联速递法律法规
</h1>
<p style="text-align: center;">
    公路货物运输保险条款（2009版）
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    保险标的范围
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第一条 凡在国内经公路运输的货物均可为本保险之标的。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第二条 下列货物非经投保人与保险人特别约定，并在保险单（凭证）上载明，不在保险标的范围以内：金银、珠宝、钻石、玉器、首饰、古币、古玩、古书、古画、邮票、艺术品、稀有金属等珍贵财物。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第三条 下列货物不在保险标的范围以内：蔬菜、水果、活牲畜、禽鱼类和其它动物。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    保险责任
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第四条 由于下列保险事故造成保险货物的损失和费用，保险人依照本条款约定负责赔偿：
</p>
<p style="text-align: center;">
    （一）火灾、爆炸、雷电、冰雹、暴风、暴雨、洪水、海啸、地陷、崖崩、突发性滑坡、泥石流；
</p>
<p style="text-align: center;">
    （二）由于运输工具发生碰撞、倾覆或隧道、码头坍塌，或在驳运过程中因驳运工具遭受搁浅、触礁、沉没、碰撞；
</p>
<p style="text-align: center;">
    （三）在装货、卸货或转载时因意外事故造成的损失；
</p>
<p style="text-align: center;">
    （四）因碰撞、挤压而造成货物破碎、弯曲、凹瘪、折断、开裂的损失；
</p>
<p style="text-align: center;">
    （五）因包装破裂致使货物散失的损失；
</p>
<p style="text-align: center;">
    （六）液体货物因受碰撞或挤压致使所用容器（包括封口)损坏而渗漏的损失，或用液体保藏的货物因液体渗漏而造成该货物腐烂变质的损失；
</p>
<p style="text-align: center;">
    （七）符合安全运输规定而遭受雨淋所致的损失；
</p>
<p style="text-align: center;">
    （八）在发生上述灾害事故时，因纷乱造成货物的散失以及因施救或保护货物所支付的直接合理的费用。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    责任免除
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第五条 由于下列原因造成保险货物的损失，保险人不负赔偿责任：
</p>
<p style="text-align: center;">
    （一）战争、敌对行为、军事行动、扣押、罢工、暴动、哄抢；
</p>
<p style="text-align: center;">
    （二）地震造成的损失；
</p>
<p style="text-align: center;">
    （三）盗窃或整件提货不着的损失；
</p>
<p style="text-align: center;">
    （四）在保险责任开始前，保险货物已存在的品质不良或数量短差所造成的损失；
</p>
<p style="text-align: center;">
    （五）保险货物的自然损耗，本质缺陷、特性所引起的损失或费用；
</p>
<p style="text-align: center;">
    （六）市价跌落、运输延迟所引起的损失；
</p>
<p style="text-align: center;">
    （七）属于发货人责任引起的损失；
</p>
<p style="text-align: center;">
    （八）投保人、被保险人的故意行为或违法犯罪行为。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第六条 经国家有关部门认定的违法、非法货物，保险人不负赔偿责任。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第七条 其他不属于保险责任范围的损失，保险人不负赔偿责任。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    责任起讫
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第八条 保险责任自签发保险凭证后，保险货物运离起运地发货人的最后一个仓库或储存处所时起，至该保险凭证上注明的目的地的收货人在当地的第一个仓库或储存处所时终止。但保险货物运抵目的地后，如果收货人未及时提货，则保险责任的终止期最多延长至保险货物卸离运输工具后的十五天为限。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    保险价值和保险金额
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第九条 保险价值为货物的实际价值，按货物的实际价值或货物的实际价值加运杂费确定。保险金额由投保人参照保险价值自行确定，并在保险合同中载明。保险金额不得超过保险价值。超过保险价值的，超过部分无效，保险人应当退还相应的保险费。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    投保人、被保险人的义务
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十条 投保人应当履行如实告知义务，如实回答保险人就保险标的或者被保险人的有关情况提出的询问。
</p>
<p style="text-align: center;">
    投保人故意或因重大过失未履行前款规定的如实告知义务，足以影响保险人决定是否同意承保或者提高保险费率的，保险人有权解除保险合同。&nbsp;
</p>
<p style="text-align: center;">
    投保人故意不履行如实告知义务的，保险人对于保险合同解除前发生的保险事故，不承担赔偿责任，并不退还保险费。
</p>
<p style="text-align: center;">
    投保人因重大过失未履行如实告知义务，对保险事故的发生有严重影响的，保险人对于保险合同解除前发生的保险事故，不承担赔偿责任，但应当退还保险费。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十一条 投保人在保险人或其代理人签发保险单（凭证）的同时，应一次交清应付的保险费。若投保人未按照约定交付保险费，保险费交付前发生的保险事故，保险人不承担赔偿责任。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十二条　投保人和被保险人应当严格遵守国家及交通运输部门关于安全运输的各项规定，维护保险标的的安全。货物运输包装必须符合国家和主管部门规定的标准。
</p>
<p style="text-align: center;">
    保险人可以对保险标的的安全状况进行检查，向投保人、被保险人提出消除不安全因素和隐患的书面建议，被保险人应该认真付诸实施。
</p>
<p style="text-align: center;">
    对于因被保险人未遵守上述约定而导致保险事故的，保险人不负赔偿责任；对于因被保险人未遵守上述约定而导致损失扩大的，保险人对扩大的损失不负赔偿责任。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十三条　在合同有效期内，保险标的危险程度显著增加的，被保险人按照合同约定应当及时通知保险人，保险人有权要求增加保险费或者解除合同。&nbsp;
</p>
<p style="text-align: center;">
    被保险人未履行前款规定的通知义务的，因保险标的危险程度显著增加而发生的保险事故，保险人不承担赔偿责任。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十四条 保险货物如果发生保险责任范围内的损失时，投保人或被保险人获悉后，应迅速采取合理的施救和保护措施并立即通知保险人的当地机构（最迟不超过10天）。
</p>
<p style="text-align: center;">
    故意或者因重大过失未及时通知，致使保险事故的性质、原因、损失程度等难以确定的，保险人对无法确定的部分，不承担赔偿责任，但保险人通过其他途径已经及时知道或者应当及时知道保险事故发生的除外。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    赔偿处理
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十五条 被保险人向保险人申请索赔时，必须提供下列有关单证：
</p>
<p style="text-align: center;">
    （一）保险单（凭证）、运单（货票）、提货单、发票（货价证明）；
</p>
<p style="text-align: center;">
    （二）承运部门签发的事故签证、交接验收记录、鉴定书；
</p>
<p style="text-align: center;">
    （三）收货单位的入库记录、检验报告、损失清单及救护保险货物所支付的直接合理的费用单据；
</p>
<p style="text-align: center;">
    （四）被保险人所能提供的其他与确认保险事故的性质、原因、损失程度等有关的证明和资料。 保险人收到被保险人的赔偿请求后，应当及时就是否属于保险责任作出核定，并将核定结果通知被保险人。情形复杂的，保险人在收到被保险人的赔偿请求并提供理赔所需资料后三十日内未能核定保险责任的，保险人与被保险人根据实际情形商议合理期间，保险人在所商定的期间内作出核定结果并通知被保险人。对属于保险责任的，在与被保险人达成有关赔偿金额的协议后十日内，履行赔偿义务。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十六条 保险货物发生保险责任范围内的损失时，保险金额等于或高于保险价值时，保险人应根据实际损失计算赔偿，但最高赔偿金额以保险金额价值为限；保险金额低于保险价值的，保险人对其损失金额及支付的施救保护费用按保险金额与保险价值的比例计算赔偿。保险人对货物损失的赔偿金额，以及因施救或保护货物所支付的直接合理的费用，应分别计算，并各以不超过保险金额为限。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十七条 保险货物发生保险责任范围内的损失，如果根据法律规定或有关约定，应当由承运人或其他第三者负责赔偿部分或全部的，被保险人应首先向承运人或其他第三者提出书面索赔，直至诉讼。保险事故发生后，保险人未履行赔偿保险金义务之前，被保险人放弃对有关责任方请求赔偿的权利的，保险人不承担赔偿责任；如被保险人要求保险人先予赔偿，被保险人应签发权益转让书和应将向承运人或第三者提出索赔的诉讼书及有关材料移交给保险人，并协助保险人向责任方追偿。 由于被保险人的故意或重大过失致使保险人不能行使代位请求赔偿权利的，保险人可以相应扣减保险赔偿金。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十八条 经双方协商同意，保险人可将其享有的保险财产残余部分的权益作价折归被保险人，并可在保险赔偿金中直接扣除。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第十九条 被保险人与保险人发生争议时，协商解决，双方不能达成协议时，可以提交仲裁机关或法院处理。 本保险合同适用中华人民共和国法律(不包括港澳台地区法律）。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    其他事项
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第二十条 凡经公路与其他运输方式联合运输的保险货物，按相应的运输方式分别适用本条款及《铁路货物运输保险条款（2009版）》、《水路货物运输保险条款（2009版）》和《国内航空货物运输保险条款（2009版）》。
</p>
<p>
    <br/>
</p>
<p style="text-align: center;">
    第二十一条 凡涉及本保险的约定均采用书面形式。
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
