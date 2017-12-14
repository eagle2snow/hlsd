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
					
					<form action="minprice/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
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
								<td style="width:75px;text-align: right;padding-top: 13px;">起步价:</td>
								<td><input type="number" name="MINPRICE" id="MINPRICE" datatype="*" nullmsg="请输入拼车起步价!" value="${pd.MINPRICE}" maxlength="32" placeholder="这里输入拼车起步价" title="拼车起步价" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">第二单最低消费:</td>
								<td><input type="number" name="SECONDORDERMINFEE" id="SECONDORDERMINFEE" datatype="*" nullmsg="请输入字段名9!" value="${pd.SECONDORDERMINFEE}" maxlength="32" placeholder="这里输入字段名9" title="字段名9" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">拼单失败起步价(元):</td>
								<td><input type="number" name="BMINPRICE" id="BMINPRICE" datatype="*" nullmsg="请输入字段名5!" value="${pd.BMINPRICE}" maxlength="32" placeholder="这里输入字段名5" title="字段名5" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">拼单成功起步价(元):</td>
								<td><input type="number" name="PMINPRICE" id="PMINPRICE" datatype="*" nullmsg="请输入字段名6!" value="${pd.PMINPRICE}" maxlength="32" placeholder="这里输入字段名6" title="字段名6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">配送员类型:</td>
								<td><input type="text" name="DRIVERTYPE" id="DRIVERTYPE" datatype="*" nullmsg="请输入字段名7!" value="${pd.DRIVERTYPE}" maxlength="2" placeholder="这里输入字段名7" title="字段名7" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品描述:</td>
								<td><input type="text" name="GOODSDESCRIPTION" id="GOODSDESCRIPTION" datatype="*" nullmsg="请输入字段名8!" value="${pd.GOODSDESCRIPTION}" maxlength="200" placeholder="这里输入字段名8" title="字段名8" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
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