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
					
					<form action="systemcontent/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="SYSTEMCONTENT_ID" id="SYSTEMCONTENT_ID" value="${pd.SYSTEMCONTENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">司机好评每颗星分数:</td>
								<td><input type="number" name="ADDSCORE" id="ADDSCORE" datatype="*" nullmsg="请输入每颗星加分!" value="${pd.ADDSCORE}" maxlength="32" placeholder="这里输入每颗星加分" title="每颗星加分" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">司机差评每颗星分数:</td>
								<td><input type="number" name="SUBTRACTSCORE" id="SUBTRACTSCORE" datatype="*" nullmsg="请输入一个差评减去的分数!" value="${pd.SUBTRACTSCORE}" maxlength="32" placeholder="这里输入一个差评减去的分数" title="一个差评减去的分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">司机接单里程(米):</td>
								<td><input type="number" name="DRIVERDISTANCE" id="DRIVERDISTANCE" datatype="n" nullmsg="请输入字段名31!" value="${pd.DRIVERDISTANCE}" maxlength="32" placeholder="这里输入字段名31" title="字段名31" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">平台收费系数:</td>
								<td><input type="text" name="DRIVERORDERFEEPERCENT" id="DRIVERORDERFEEPERCENT" datatype="*" nullmsg="请输入字段名38!" value="${pd.DRIVERORDERFEEPERCENT}" maxlength="10" placeholder="这里输入字段名38" title="字段名38" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务费:</td>
								<td><input type="text" name="SERVICEFEE1" id="SERVICEFEE1" datatype="*" nullmsg="请输入字段名39!" value="${pd.SERVICEFEE}" maxlength="10" placeholder="这里输入字段名39" title="字段名39" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">第二单服务费:</td>
								<td><input type="text" name="SERVICEFEE2" id="SERVICEFEE2" datatype="*" nullmsg="请输入字段名40!" value="${pd.TWOORDERSERVICEFEE}" maxlength="10" placeholder="这里输入字段名40" title="字段名40" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">取消订单数量:</td>
								<td><input type="number" name="CANCELNUMBER" id="CANCELNUMBER" datatype="n" nullmsg="请输入字段名44!" value="${pd.CANCELNUMBER}" maxlength="32" placeholder="这里输入字段名44" title="字段名44" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省:</td>
								<td>
									<select name="PROVINCEID" onchange="showProvince()"
												id="province" required="required">
													<option value="1">所有</option>
													<c:forEach items="${pd.provinces}" var="p">
														<option value="${p.PROVINCEID}">${p.PROVINCE}</option>
													</c:forEach>
									</select>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">市:</td>
								<td>
									<select name="CITYID" id="city">
											<option value="1">所有</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小浮系数:</td>
								<td><input type="text" name="VOLUEFEE1" id="VOLUEFEE1" datatype="*" nullmsg="请输入字段名47!" value="${pd.VOLUEFEE1}" maxlength="10" placeholder="这里输入字段名47" title="字段名47" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">中浮系数:</td>
								<td><input type="text" name="VOLUEFEE2" id="VOLUEFEE2" datatype="*" nullmsg="请输入字段名48!" value="${pd.VOLUEFEE2}" maxlength="10" placeholder="这里输入字段名48" title="字段名48" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">大浮系数:</td>
								<td><input type="text" name="VOLUEFEE3" id="VOLUEFEE3" datatype="*" nullmsg="请输入字段名49!" value="${pd.VOLUEFEE3}" maxlength="10" placeholder="这里输入字段名49" title="字段名49" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">骑手接单范围(米):</td>
								<td><input type="number" name="HORSEMANDISTANCE" id="HORSEMANDISTANCE" datatype="n" nullmsg="请输入骑手接单范围!" value="${pd.HORSEMANDISTANCE}" maxlength="32" placeholder="这里输入骑手接单范围" title="骑手接单范围" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">骑手好评每颗星分数:</td>
								<td><input type="number" name="HORSEMANADDSCORE" id="HORSEMANADDSCORE" datatype="*" nullmsg="请输入字段名51!" value="${pd.HORSEMANADDSCORE}" maxlength="32" placeholder="这里输入字段名51" title="字段名51" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">骑手差评每颗星分数:</td>
								<td><input type="number" name="HORSEMANSUBTRACTSCORE" id="HORSEMANSUBTRACTSCORE" datatype="*" nullmsg="请输入字段名52!" value="${pd.HORSEMANSUBTRACTSCORE}" maxlength="32" placeholder="这里输入字段名52" title="字段名52" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="4">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.layer.closeAll();">取消</a>
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
		$(function(){//初始化表单验证框架
			$.Tipmsg.r=null;
			var showValidatemsg=function(msg,o){
				var id = $(o.obj.parents("td").next().find("id").context).attr("id");
				$("#"+id).tips({
					side:3,
		            msg:msg,
		            bg:'#AE81FF',
		            time:2
		        });
				$("#"+id).focus();
			}
			$(".MyForm").Validform({
				tiptype:function(msg,o){
					showValidatemsg(msg,o);
				},
				tipSweep:true
			});
		});
		
		//保存提交
		function save(){
			$("#Form").submit();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>