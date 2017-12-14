<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
							<input type="hidden" name="WITHDRAWALSHISTORY_ID"
								id="WITHDRAWALSHISTORY_ID" value="${pd.ID}" />
							<div id="zhongxin" style="padding-top: 13px;">
								<table id="table_report"
									class="table table-striped table-bordered table-hover">
									<tr>
										<td style="width: 75px; text-align: right; padding-top: 13px;">编号:</td>
										<td class='left'>${pd.ID}</td>
										
										<td style="width: 75px; text-align: right; padding-top: 13px;">用户电话:</td>
										<td class='left'>${pd.USERMOBILENO}</td>
									</tr>
									<tr>
										<td style="width: 75px; text-align: right; padding-top: 13px;">用户类型:</td>
										<td class='left'>
												<c:if test="${pd.USERTYPE == '1'}">用户</c:if>
												<c:if test="${pd.USERTYPE == '2'}">司机</c:if>
												<c:if test="${pd.USERTYPE == '5'}">骑手</c:if>
										</td>
										
										<td style="width: 75px; text-align: right; padding-top: 13px;">记录类型:</td>
										<td class='left'><c:if test="${pd.TRANSACTIONTYPE == '0'}">充值</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '1'}">提现</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '2'}">订单消费</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '3'}">提现失败反额</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '4'}">配送员收入</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '5'}">平台收入</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '6'}">财务结算</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '7'}">支付押金</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '8'}">邀请奖励</c:if> <c:if
												test="${pd.TRANSACTIONTYPE == '9'}">负责人抽成</c:if></td>
									</tr>
									<tr>
										<td style="width: 75px; text-align: right; padding-top: 13px;">记录状态:</td>
										<td class='left'>
												<c:if test="${pd.STATUS == '0'}">进行中</c:if>
												<c:if test="${pd.STATUS == '1'}">成功</c:if>
												<c:if test="${pd.STATUS == '2'}">失败</c:if>
											</td>
											
										<td style="width: 75px; text-align: right; padding-top: 13px;">支付方式:</td>
										<td class='left'>${pd.PAYWAY}</td>
									</tr>
									<tr>
										<c:if test="${not empty pd.ORDERID}">
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单id:</td>
											<td class='left'>${pd.ORDERID}</td>
											
											<td style="width: 75px; text-align: right; padding-top: 13px;">金额:</td>
											<td class='left'>${pd.TRANSACTIONAMOUNT}</td>
										</c:if>
										<c:if test="${empty pd.ORDERID}">
											<td style="width: 75px; text-align: right; padding-top: 13px;">金额:</td>
											<td class='left'>${pd.TRANSACTIONAMOUNT}</td>
											<td colspan="2"/>
										</c:if>
									</tr>
									<tr>
										<td style="width: 75px; text-align: right; padding-top: 13px;" class='center'>订单实际支付信息:</td>
										<!-- 订单支付成功 -->
										<c:if test="${pd.status == '0'}">
										<td class='left'><font color="green">${pd.message}</font></td>
										</c:if>
										<!-- 订单支付失败 -->
										<c:if test="${pd.status == '1'}">
										<td class='left' ><font color="red">${pd.message}</font></td>
										</c:if>
										<td colspan="2"/>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="10">
											<a class="btn btn-mini btn-primary" onclick="cancle();">处理</a>
										</td>
									</tr>
								</table>
							</div>
							<div id="zhongxin2" class="center" style="display: none">
								<br /> <br /> <br /> <br /> <br /> <img
									src="static/images/jiazai.gif" /><br />
								<h4 class="lighter block green">提交中...</h4>
							</div>
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
	<script type="text/javascript"
		src="static/js/validation/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
		$(function() {//初始化表单验证框架
			$.Tipmsg.r = null;
			var showValidatemsg = function(msg, o) {
				var id = $(o.obj.parents("td").next().find("id").context).attr(
						"id");
				$("#" + id).tips({
					side : 3,
					msg : msg,
					bg : '#AE81FF',
					time : 2
				});
				$("#" + id).focus();
			}
			$(".MyForm").Validform({
				tiptype : function(msg, o) {
					showValidatemsg(msg, o);
				},
				tipSweep : true
			});
		});

		//保存提交
		function save() {
			$("#Form").submit();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		});
	</script>
</body>
</html>