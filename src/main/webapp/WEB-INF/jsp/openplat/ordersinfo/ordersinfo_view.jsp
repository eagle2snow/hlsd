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
	<style type="text/css">
		#table_report tr td{
			vertical-align:bottom;
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
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<col width="15%"/>
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">订单号:</td>
								<td>${pd.ORDERID}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">下单时间:</td>
								<td>${pd.ORDERTIME}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">发货人姓名:</td>
								<td>${pd.SENDERNAME}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">发货人电话:</td>
								<td>${pd.SENDERPHONE}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">发货完整地址:</td>
								<td colspan="3">
									${pd.SENDPROVANCE}${pd.SENDCITY}${pd.SENDAREA}${pd.SENDDETAILADDRESS}
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">承运司机:</td>
								<td>${pd.REALNAME} ${pd.MOBILENO}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">速运类型:</td>
								<td>${pd.EXPRESSTYPE eq '1' ? '汽车' : '骑手'}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">订单类型:</td>
								<td>${pd.ORDERTYPE eq '1' ? '实时订单' : '预约订单'}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">预约时间:</td>
								<td>${pd.APPOINTMENTTIME}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">订单状态:</td>
								<td>
									<a href="javascript:void(0)" id="yyyycc" onclick="viewStatus('${pd.ORDERID}',this);">${pd.STATUNAME}</a>
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">寄付到付:</td>
								<td>${pd.DONATIONTYPE}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">订单总价:</td>
								<td>${pd.ORDERPRICE} 元</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">总里程:</td>
								<td>${pd.ORDERMILEAGE} km</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">是否上门取货:</td>
								<td>${pd.PICKUP eq true ? '是' : '否'}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">服务费:</td>
								<td>${pd.SERVICECHARGE} 元</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">起步价:</td>
								<td>${pd.STARTPRICE} 元</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">打赏金额:</td>
								<td>${pd.AWARDAMOUNT} 元</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">优惠金额:</td>
								<td>${pd.PREFERENTIALAMOUNT} 元</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">优惠方式:</td>
								<td>${pd.PREFERENTIALTYPE}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">支付状态:</td>
								<td>${pd.PAYSTATUS eq '1' ? '已支付' : '未支付'}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">支付方式:</td>
								<td>${pd.PAYTYPE}</td>
							</tr>
							<!-- <tr>
								<td style="text-align: center;" colspan="4">
									<a class="btn btn-mini btn-danger" onclick="top.layer.closeAll();">关闭</a>
								</td>
							</tr> -->
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none;"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		//查看订单的步骤详情
		function viewStatus(orderId,obj){
			var res_msg = '';
			$.ajax({
				url:'<%=basePath%>ordersinfo/getOrderSteps?ORDERID='+orderId,
				type:"post",
				dataType:"json",
				async:false,
				success:function(data){
					$.each(data,function(i){
						if(data.length-1==i){
							res_msg+=data[i].STEPNAME+"  "+data[i].CREATETIME+" <i class='ace-icon fa fa-hand-o-left bigger-110'></i>";
						}else{
							res_msg+=data[i].STEPNAME+"  "+data[i].CREATETIME+"<br/>";
						}
					});
					if(res_msg!=''){
						$(obj).tips({side:3,width:600,bg:'#AE81FF', time:20,msg:res_msg});
						$(".jq_tips_info").css("max-width",250);
					}
				}
			});
		}
	</script>
</body>
</html>