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
					
					<form action="tuser/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TUSER_ID" id="TUSER_ID" value="${pd.TUSER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户编号:</td>
								<td><input type="text" name="USERID" id="USERID" value="${pd.USERID}" maxlength="255" placeholder="这里输入用户编号" title="用户编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户生日:</td>
								<td><input class="span10 date-picker" name="USERBIRTHDAY" id="USERBIRTHDAY" value="${pd.USERBIRTHDAY}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="用户生日" title="用户生日" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户性别:</td>
								<td><input type="text" name="USERSEX" id="USERSEX" value="${pd.USERSEX}" maxlength="2" placeholder="这里输入用户性别" title="用户性别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户部门:</td>
								<td><input type="text" name="USERDEPT" id="USERDEPT" value="${pd.USERDEPT}" maxlength="255" placeholder="这里输入用户部门" title="用户部门" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户身份证号:</td>
								<td><input type="text" name="USERCARD" id="USERCARD" value="${pd.USERCARD}" maxlength="255" placeholder="这里输入用户身份证号" title="用户身份证号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#USERID").val()==""){
				$("#USERID").tips({
					side:3,
		            msg:'请输入用户编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERID").focus();
			return false;
			}
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入用户名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#USERBIRTHDAY").val()==""){
				$("#USERBIRTHDAY").tips({
					side:3,
		            msg:'请输入用户生日',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERBIRTHDAY").focus();
			return false;
			}
			if($("#USERSEX").val()==""){
				$("#USERSEX").tips({
					side:3,
		            msg:'请输入用户性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERSEX").focus();
			return false;
			}
			if($("#USERDEPT").val()==""){
				$("#USERDEPT").tips({
					side:3,
		            msg:'请输入用户部门',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERDEPT").focus();
			return false;
			}
			if($("#USERCARD").val()==""){
				$("#USERCARD").tips({
					side:3,
		            msg:'请输入用户身份证号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERCARD").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>