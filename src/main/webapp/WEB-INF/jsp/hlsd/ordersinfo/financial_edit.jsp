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
							<col width="18%"/>
							<col width="32%"/>
							<col width="18%"/>
							<col width="32%"/>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">结算时间段:</td>
								<td colspan="2">
									<input class="span10 date-picker" name="lastStart" id="lastStart"  type="text" data-date-format="yyyy-mm-dd" readonly="readonly" 
									style="width:120px;" placeholder="结算开始日期" title="结算开始日期"/>
									~
									<input class="span10 date-picker" name="lastEnd" id="lastEnd"  type="text" data-date-format="yyyy-mm-dd" readonly="readonly" 
									style="width:120px;" placeholder="结算结束日期" title="结算结束日期"/>
								</td>
								<td>
									 <a class="btn btn-info btn-xs" onclick="calc();" title="计算"><i class="ace-icon fa fa-calculator " ></i> 计算金额</a>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">时间段内订单数量:</td>
								<td>
									<font style="font-size: 14px;color: black;" id="orderCount">0 单</font>
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">时间段内订单金额:</td>
								<td>
									<font style="font-size: 14px;color: black;" id="orderMoney">0￥</font>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">用户余额:</td>
								<td>
									<font style="font-size: 14px;color: green;" id="userYue">${money}￥</font>
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">本次结算金额:</td>
								<td>
									<input type="text" name="settleAccount" id="settleAccount" maxlength="6" placeholder="本次结算金额" title="本次结算金额" 
									value="" style="width:150px;" class="inputxt" onkeyup="num(this);"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="center">
									<c:if test="${money>0.00}">
										<a class="btn btn-info btn-xs" onclick="sureAccount();" title="结算"><i class="ace-icon fa fa-money bigger-110" ></i> 结算</a>
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="center">
									<div style="width: 60%">
										ps: 平台收取10%的费用，所以订单金额乘以90%就是用户所得的金额。账户余额已经是收取了10%后的实际司机可以结算的金额！
									</div>
								</td>
							</tr>
						</table>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
		$(top.hangge());
		
		//计算
		function calc(){
			var startTime = $("#lastStart").val();
			var endTime = $("#lastEnd").val();
			if(startTime=='' && endTime==''){
				var lcIndex = top.layer.confirm("您没选择时间段，会显示此用户所有的有效订单数量和金额",function(){
					getJine(startTime,endTime);
					top.layer.close(lcIndex);
				});
			}else{
				getJine(startTime,endTime);
			}
		}
		
		//验证只能输入最多2位小数
		function num(obj){
			obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
			obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
			obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
			obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
			obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
		}
		
		function getJine(startTime,endTime){
			$.ajax({
				url:'<%=basePath%>hlsdorders/findOrderCount.do',
				data:{
					userId:'${userId}',
					lastStart:startTime,
					lastEnd:endTime
				},
				type:"post",
				dataType:"json",
				async:false,
				success:function(data){
					$("#orderCount").html(data.orderCnt+"单");
					$("#orderMoney").html(data.allMoney+"￥");
				}
			});
		}
		
		//确定结算
		function sureAccount(){
			var settleAccount = $("#settleAccount").val();
			top.layer.close(fiIndex);
			if(settleAccount>${money}){
				top.layer.msg("结算金额不能大于用户余额",{time:1500});
			}else if(settleAccount<=0 || settleAccount==''){
				top.layer.msg("结算金额必须大于0",{time:1500});
			}else{
				var fiIndex = top.layer.confirm("确定 "+settleAccount +" 元已结算给骑手了吗？",function(){
				$.ajax({
					url:'<%=basePath%>hlsdorders/updateUserMoney.do',
					data:{
						userId:'${userId}',
						settlementMoney:settleAccount
					},
					type:"post",
					dataType:"json",
					async:false,
					success:function(data){
						if(data.result==true){
							top.layer.msg('结算成功', {time:1500,icon:1});
							$("#userYue").html(${money} - settleAccount);
							$("#settleAccount").val(0);
						}else{
							top.layer.msg("结算失败，请联系管理员",{time:1500,icon:2});
						}
					}
				  });
			   });
			}
		}
	</script>
</body>
</html>