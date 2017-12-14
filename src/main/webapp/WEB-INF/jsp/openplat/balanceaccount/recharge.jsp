<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<!-- 验证框架样式 -->
	<link rel="stylesheet" href="static/js/validation/style.css" />
	<style type="text/css">
		body{
			overflow: hidden;
		}
		.btn-mini{
			margin: 5px 0 0 5px;
		}
		#descript{
			color: #888;font-size: 13px;
		}
		#descript p{
			margin-top: 5px;
		}
	</style>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="balanceaccount/${msg}.do" name="Form" id="Form" method="post" class="balanceaccountForm">
						<input type="hidden" name="XH" id="XH" value="${pd.XH}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">充值账号:</td>
								<td><input type="text" name="chargeMobile" id="chargeMobile" datatype="m" value="${pd.chargeMobile}" maxlength="11" 
								placeholder="充值手机号" title="充值手机号" style="width:75%;" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付类型:</td>
								<td>
						            <label style="float:left;padding-left: 5px;padding-top:7px;">
						                <input name="transactionWay" type="radio" checked="checked" class="ace" 
						                id="form-field-radio2">	<span class="lbl">
						                	<img alt="" src="static/weixin/WePayLogo.png">
						                </span>
						            </label>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">充值金额:</td>
								<td>
									<button type="button" value="100" class="btn btn-mini">100元</button>
									<button type="button" value="200" class="btn btn-mini">200元</button>
									<button type="button" value="300" class="btn btn-mini">300元</button>
									<button type="button" value="500" class="btn btn-mini">500元</button>
									<button type="button" value="1000" class="btn btn-mini">1000元</button>
									<button type="button" value="2000" class="btn btn-mini">2000元</button>
									<button type="button" value="5000" class="btn btn-mini">5000元</button>
									<button type="button" value="10000" class="btn btn-mini">10000元</button>
									<button type="button" value="20000" class="btn btn-mini">20000元</button>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付金额:</td>
								<td>
									<p class="form-control-static" lang="100" id="payMoney">100.00元</p>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<img alt="" src="" id="Payewm" style="display: none;">
									<a class="btn btn-mini btn-primary" id="scanBtn" onclick="scanPay(this);">点击扫描支付</a>
									<div id="descript">
										<p>【温馨提示】</p>
										<p>1.若出现已成功充值的提示，但金额未到帐，可能是网络或系统繁忙导致，我们会在2个工作日内核对后为您充值。</p>
										<p>2.在充值时请仔细确认充值的金额和账户，以免充值错误。</p>
										<p>3.在充值过程中如出现网页错误或打开缓慢时，请先查询银行或者相关支付方式的交易记录，检查扣款是否成功，<br/>
										然后查看帐户是否已成功充值。若没有确认，请不要反复刷新页面，以防止重复充值。</p>
									</div>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--验证框架-->
	<script type="text/javascript" src="static/js/validation/Validform_v5.3.2_min.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function(){//初始化表单验证框架
			//绑定按钮事件
			$("button").on("click",function(){
				$("#payMoney").text(this.value+".00元").attr("lang",this.value);
				$("button").css("border-color","#abbac3");
				$(this).css("border-color","#009fe8");
				$("#scanBtn").show();
				$("#descript").show();
				$("#Payewm").hide();
			});
		});
		
		//生成支付二维码
		function scanPay(obj){
			var money = $("#payMoney").attr("lang");
			var url = '<%=basePath%>generateQRcode?mobileNo=${pd.chargeMobile}&xh=${pd.xh}&money='+money+'&tm='+new Date().getTime();
			$("#Payewm").show();
			$("#Payewm").attr("src",url);
			$("#descript").hide();
			$(obj).hide();
		}
	</script>
</body>
</html>