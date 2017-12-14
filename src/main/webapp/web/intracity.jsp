<%@page import="java.util.Date"%>
<%@page import="com.fh.controller.weixin.pay.util.MD5Util"%>
<%@page import="com.fh.util.Tools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
		<link rel="stylesheet" type="text/css" href="css/intracity.css?v=${nowTimeNow}" />
		<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css?v=${nowTimeNow}" />
		<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=9893bf55f84d406da003b615c526b4a9"></script> 
		<!-- <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=9893bf55f84d406da003b615c526b4a9"></script> -->
		 <script src="//webapi.amap.com/ui/1.0/main.js"></script>
		<title>同城速递</title>
	</head>

	<body>
	
		<!--hlsd-header-->
		<div class="hlsd-header">
			<div class="header-link"></div>
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
						<img class="imgbtn" src="img/ordernav/tongcheng.png" />
						<span class="hlsd-color">同城速递</span>
						<div class="order-active"></div>
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
						<img class="imgbtn" src="img/ordernav/jiage.png" />
						<span>速递价格</span>
					</a>
				</li>
			</ul>

		</div>
		<!--form-->
		<div class="tc-order">
			<!--发货人-->
			<div class="tc-from tc-hover">
				<div class="tc-active"></div>
				<div class="from-content">
					<ul>
						<li style="position: relative;">
							<label for="">寄货地址 <span class="require-red">*</span></label>
							<div class="input-adress-box">
								<input id='from-address' placeholder="请输入地址"  class="input-address" type="text" name="fromaddress" id="fromaddress" value="" />
								<div class="address-location address-add" style="cursor:pointer"></div>
								<div class="address-btn" style="cursor:pointer">常用</div>

							</div>
							<div class="common-box" style="display: none;">
								<div class="common-box-list">
										<div class="zwcy">暂无常用</div>
								</div>
							
								<b class="address-btn-close">关闭</b>
							</div>
						</li>
						<li><label for="">门牌号<span class="require-red">*</span></label><input class="input-large require" type="text" name="fromnum" id="fromnum" value="" placeholder="请输入寄货人门牌号" /></li>
						<li><label for="">寄货人<span class="require-red">*</span></label><input class="input-small require" type="text" name="fromname" id="fromname" value="" placeholder="请输入寄货人姓名" />
							<label for="">手机号<span class="require-red">*</span></label><input class="input-small require  re-phone" type="text" name="fromphone" id="fromphone" value="" placeholder="请输入寄货人手机号" /></li>
						<li style="height: 50px">
							<label for=""></label>	
							<div class="common-checkbox"><input type="checkbox" value="cybox" name="choose" id="cybox">
 								 <label for="cybox">保存为常用</label></div>
 								</li>	
							
					</ul>

					<div class="detail-content">
					<ul>
						<li><label for="">配送方式<span class="require-red">*</span></label>
							<div class="order-radio select1">
								<a href="###" data_id='2' class="type-active">骑手</a>
								<a href="###" data_id='1'>车主</a>
							</div>
						</li>
						<li><label for="">取货时间<span class="require-red">*</span></label>
							<div class="order-radio select2">
								<a href="###" data_id='1' class="type-active">立即</a>
								<a id="other-time" href="###" data_id='2'>预约时间</a>
								<div id="hello3" style="display: none;margin-left: 450px; width: 150px;height: 46px;line-height: 46px" class="laydate-icon other-time-text"></div>
							</div>
						</li>
						<li><label for="">上门取货<span class="require-red">*</span></label>
							<div class="order-radio select3">
								<a href="###" data_id='true' class="type-active">需要</a>
								<a href="###" data_id='false'>不需要</a>
							</div>
						</li>
						<li><label for="">付款方式<span class="require-red">*</span></label>
							<div class="order-radio select4">
								<a href="###" class="type-active">寄付</a>
								<a href="###">到付</a>
							</div>
						</li>
					</ul>
				</div>
				</div>
			</div>
			<!--多订单-->
			<div class="order-all-box" id="toporder">
				<!-- <div class="order-detail tc-hover" style="padding-left: 0;width: 1200px;">
					<div class="order-title">

						<label for="" style="padding-left: 60px;">订单详细</label>
						<div class="del-edit-btn">
							<a href="">编辑</a>
							<a href="">删除</a>
						</div>

					</div>
					<div class="order-content">
						<p>收货地址：深圳市南山区一二等分水电费速度发生的速度发1118</p>
						<p><span>收货人：王小节   </span> <span>电话：18888888888</span> </p>
						<p><span>20公斤以下   </span> <span>小型货物</span> </p>
						<p><span>寄货方已付款 </span> <span>需上门取货</span> </p>
						<p>取货时间：2017/06/06 上午12:00 </p>
					</div>
				</div> -->


			</div>
			

			<!--收货人-->
			<div class="tc-to tc-hover">
				<div class="tc-active"></div>
				<div class="to-content">
					<ul>
						<li style="position: relative;">
							<label for="">收货地址<span class="require-red">*</span></label>
							<div class="input-adress-box">
								<input  class="input-address"  placeholder="请输入地址" type="text" name="toaddress" id='to-address' value="" />
								<div class="address-location address-add" style="cursor:pointer"></div>
								<div class="address-btn" style="cursor:pointer">常用</div>

							</div>
							<div class="common-box" style="display: none;">
								<div class="common-box-list-to"><div class="zwcy">暂无常用</div></div>
									<b class="address-btn-close">关闭</b>
								
							</div>
						</li>
						<li><label for="">门牌号<span class="require-red">*</span></label><input class="input-large  require" type="text" name="tonum" id="tonum" value="" placeholder="请输入收货人门牌号"  /></li>
						<li><label for="">收货人<span class="require-red">*</span></label><input class="input-small  require" type="text" name="toname" id="toname" value="" placeholder="请输入收货人姓名" />
							<label for="">手机号<span class="require-red">*</span></label><input class="input-small  require  re-phone" type="text" name="tophone" id="tophone" value="" placeholder="请输入收货人手机号" /></li>
							<li style="height: 50px">
							<label for=""></label>	
							<div class="common-checkbox"><input type="checkbox" value="cyboxto" name="choose" id="cyboxto">
 								 <label for="cyboxto">保存为常用</label></div>
 								</li>
 									

					</ul>
					<div class="detail-content">
					<ul>
						<li class="type-li"><label for="">物品类型<span class="require-red">*</span></label>
							<div class="type-radio select5">
								<a href="###" data-id="蛋糕" class="type-active">蛋糕</a>
								<a href="###" data-id="鲜花">鲜花</a>
								<a href="###" data-id="手机">手机</a>
								<a href="###" data-id="服饰">服饰</a>
								<a href="###" data-id="生活物品">生活物品</a>
								<a href="###" data-id="文件">文件</a>
								<a id="other" href="###" data-id="">其它</a>
								<input style="display: none;" class="other-text" type="text" name="" id="other-text-id" value="" />
							</div>
						</li>
						
						<li><label for="">物品重量<span class="require-red">*</span></label>
							<div class="order-radio select6">
								<a href="###" data-id="1" class="type-active">20公斤以下</a>
								<a href="###" data-id="2">20-50公斤</a>
								<a href="###" data-id="3">50公斤以上</a>
							</div>
						</li>
						<li><label for="">物品体积<span class="require-red">*</span></label>
							<div class="order-radio select7">
								<a href="###" data-id="1" class="type-active">小型物品</a>
								<a href="###" data-id="2">中型物品</a>
								<a href="###" data-id="3">大型物品</a>
							</div>
						</li>
						
					</ul>
					
				</div>
				<div class="add-order">
					<a href="###">确认收货信息</a>
					<!-- <a id="add-order" href="#toporder">添加订单+</a> -->

				</div>
				</div>
			</div>
			
			<!--支付详情-->
			<div class="tc-pay tc-hover">
				<div class="tc-active"></div>
				<div class="pay-content">
					<div id="hlsd-container" style="width:600px; height:360px;float: left;"></div>
					<div class="pay-right">
						<ul >
							<li style="height: 70px;" >
							<p id="startPrice">起步价：0元</p>
								<p id="serviceCharge">服务费：0元</p>
								<p  id="distance">里程：0公里</p>
							<!-- 	<span>寄件方付款</span>
								<span>需上门取货</span> -->
							</li>
							<li style="height: 40px;">
								
								
								
								<!-- 取货时间：2017-08-07 13:00 -->
							</li>
							<li>
								合计：<b style="color: red;" id="total">0</b>元
							</li>
							<li>
								选择优惠券：
								<select name="select" class="youhui">
									<option value="">选择优惠券</option>
								</select>
							</li>
							<li>
								还需支付：<b style="color: red;" id="totaldiscount">0</b>元
							</li>
							<li class="pay-box">
								<p>支付方式：</p>
								<div>
									<input name="paybtn" id="wechat" type="radio" checked="checked" value="" /><label for="wechat"><img src="img/pay1.png"/></label>
									<input name="paybtn" id="alipay" type="radio" disabled="disabled" value="" /><label for="alipay"><img src="img/pay2.png"/></label>
									<input name="paybtn" id="hlsdpay" type="radio" disabled="disabled" value="" /><label for="hlsdpay"><img src="img/pay3.png"/></label>
								</div>
							</li>
							<li>
								<input class="pay-order-btn" type="submit" name="" id="pay" value="确认支付" />
							</li>
						</ul>
						<!-- <div class="pay-login" style="display:none">
							<p>距离：XXX公里         <span style="margin-left: 50px;">体积/重量：小物品/0kg</span></p>
							<p><label for="">请输入手机号：</label><input type="text" name="" id="" value="" /> 
								<input class="countdown" type="button" name="" id="countdown" value="获取验证码" /><span ></p>
							<p><label for="">请输入验证码：</label><input type="text" name="" id="" value="" />
								<span style="color: red;margin-left: 10px;">验证码不正确</span>
							</p>
							<input class="pay-order-btn" id="login-btn" type="submit" name="" id="" value="登录" />
						</div> -->
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/web/footer.jsp"></jsp:include>
		<jsp:include page="/web/login.jsp"></jsp:include>
		<jsp:include page="/web/city.jsp"></jsp:include>
		<!--选择地址-->
		<div id="map" style="display: none;">
			<div id="select-address" style="width: 1000px;height: 600px;"></div>

			<div class="select-tip">
				<label for="">请输入地址：</label>
				<input id="tipinput" />
				<!-- <span id="add-address" style="cursor:pointer">使用该地址</span> -->
			</div>
		</div>

		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="layer/layer.js"></script>
		<script src="js/hlsd-city-address.js?v=${nowTimeNow}"></script>
		<script src="js/hlsd-hover.js?v=${nowTimeNow}"></script>
		<!--同比缩放-->
		<script src="js/zoom-body.js?v=${nowTimeNow}"></script>
		<!-- 下单js -->
		<!-- <script src="js/intracity.js?v=${nowTimeNow}"></script> -->
		<!-- 登录 -->
		<script src="js/time-code.js?v=${nowTimeNow}"></script>
		<!-- 日历 -->
		<script src="js/calendar/laydate/laydate.js"></script>
		<!-- 添加地址 -->
		<script src="js/add-address.js?v=${nowTimeNow}"></script>
		<!--sweetalert弹出框 -->
		<script src="sweetalert/sweetalert.min.js?v=${nowTimeNow}"></script>
		<!-- 下单js v1.0.0-->
		<script src="js/common-sigle.js?v=${nowTimeNow}"></script>
		<script src="js/one-single.js?v=${nowTimeNow}"></script>
		<!-- xss -->
		<script src="js/xss.js"></script>
		<script type="text/javascript">
		//默认发货人手机号
		defaultfn();
		function defaultfn(){
			var userName=sessionStorage.getItem('userName')
			console.log($('#fromphone').val(userName)=='')
			if(userName){
				$('#fromphone').val(userName)
			}
			
		}
		//获取网络时间并格式化 		
		Date.prototype.Format = function (fmt) { //author: meizz 
			    var o = {
			        "M+": this.getMonth() + 1, //月份 
			        "d+": this.getDate(), //日 
			        "h+": this.getHours(), //小时 
			        "m+": this.getMinutes(), //分 
			        "s+": this.getSeconds(), //秒 
			        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			        "S": this.getMilliseconds() //毫秒 
			    };
			    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			    for (var k in o)
			    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
			}
		function getServerDate(){
			return new Date($.ajax({async: false}).getResponseHeader("Date")).Format("yyyy-MM-dd hh:mm:ss");
		}
		!function(){
			laydate.skin('dahong');//切换皮肤，请查看skins下面皮肤库
			laydate({
				  elem: '#hello3',
				   format: 'YYYY-MM-DD hh:mm:ss',
				  istime: true,
				  istoday: true,
				  min: getServerDate(), //-1代表昨天，-2代表前天，以此类推
				  max: laydate.now(+2) //+1代表明天，+2代表后天，以此类推
			});
		}();
		console.log(getServerDate())
		 
		</script>
		<script>
		var temp = 0
		$(document).ready(function(){
			
			onload()
			 
		})
		 
		//数据对象
		var md5KeyObj={
		    md5Key: '${md5Key}'
		};
		
		var url='${ctx}/app_openapi/getSixYzm'
		var urllogin="${ctx}/app_openapi/loginByMobile"
		var urlorder='${ctx}/app_openapi/createMyOrder'
		var urlprice='${ctx}/app_openapi/getMyOrderPrice'
		var urlpay='${ctx}/weixin/generateQRcode'
		var urldiscount='${ctx}/app_openapi/getMyCoupons'
		//计算优惠券
		var discounthtml=''
		function adddiscount(cb){
			 var fromaddress=sessionStorage.getItem('fromaddress')
			$('.youhui').html('<option value="">选择优惠券</option>')
			discounthtml=''
			discountObj=$.extend({},md5KeyObj, loginObj);
			//发货地编号
			discountObj.sendCity=fromaddress
			console.log(discountObj)
			checklogin(function(){
				$.ajax({
		        url: urldiscount,
		        method: 'POST',
		        data: discountObj,
		        dataType: 'json',
		        success: function(res) {
		            if(res.result&&res.datas.length>0){
		            	
		            	for(var i=0;i<res.datas.length;i++){
		            		discounthtml+='<option value="'+res.datas[i].XH+'" data-id="'+res.datas[i].COUPONMONEY+'">'+res.datas[i].COUPONNAME+'</option>'
		            	}
		            	$('.youhui').html(discounthtml)
		            	discountsum()
		            }else{
		            	$('.youhui').html('<option value="">暂无优惠券</option>')	
		            }
		            cb()         
		        }
   		 		})
			})
			 
		}
		function discountsum(){
			var totaldiscount=Subtr($('#total').html(), $('.youhui').children('option:selected').attr('data-id'))
			if(totaldiscount>=0){
				$('#totaldiscount').html(totaldiscount)
			}else{
				$('#totaldiscount').html($('#total').html())
			}
		}

		$('.youhui').change(function(){
			 discountsum()
		})
		   //减法函数  
		    function Subtr(arg1, arg2) {
		        var r1, r2, m, n;
		        try {
		            r1 = arg1.toString().split(".")[1].length;
		        } catch (e) { r1 = 0; }
		        try { r2 = arg2.toString().split(".")[1].length; } catch (e) { r2 = 0; } m = Math.pow(10, Math.max(r1, r2));
		        //last modify by deeka     
		        //动态控制精度长度     
		        n = (r1 >= r2) ? r1 : r2;
		        return ((arg1 * m - arg2 * m) / m).toFixed(n);
		    }
		   //骑手车主切换
		   $('.select3').parent().hide()
		   $('.select4').parent().hide()
		   $('.select1 a').on('click',function(){
		   		console.log($(this).attr("data_id"))
		   		var id=$(this).attr("data_id")
		   		if(id==2){
		   			console.log($('.select3').parent())
		   			$('.select3').parent().hide()
		   			$('.select4').parent().hide()
		   			$('.select3 a').removeClass('type-active') 
		   			$('.select4 a').removeClass('type-active') 
		   			$('.select3 a').eq(0).addClass('type-active')
		   			$('.select4 a').eq(0).addClass('type-active')
		   		}else{
		   			$('.select3').parent().show()
		   			$('.select4').parent().show()
		   		}
		   })

		</script>
	</body>

</html>