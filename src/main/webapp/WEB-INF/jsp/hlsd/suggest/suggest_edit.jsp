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
					
					<form action="suggest/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="Id" id="Id" value="${pd.Id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编号:</td>
								<td><input readonly="readonly" type="number" name="Id" id="Id" datatype="n" nullmsg="请输入编号!" value="${pd.Id}" maxlength="32" placeholder="这里输入编号" title="编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户id:</td>
								<td><input readonly="readonly" type="text" name="userId" id="userId" datatype="*" nullmsg="请输入用户id!" value="${pd.userId}" maxlength="200" placeholder="这里输入用户id" title="用户id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td><input readonly="readonly" type="text" name="content" id="content" datatype="*" nullmsg="请输入内容!" value="${pd.content}" maxlength="21845" placeholder="这里输入内容" title="内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input readonly="readonly" class="span10 date-picker" name="createTime" datatype="*" nullmsg="请输入创建时间!" id="createTime" value="${pd.createTime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单id:</td>
								<td><input readonly="readonly" type="text" name="orderId" id="orderId" datatype="*" nullmsg="请输入订单id!" value="${pd.orderId}" maxlength="255" placeholder="这里输入订单id" title="订单id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">问题类型:</td>
								<td><input readonly="readonly" type="text" name="suggestType" id="suggestType" datatype="*" nullmsg="请输入问题类型!" value="${pd.suggestType}" maxlength="255" placeholder="这里输入问题类型" title="问题类型" style="width:98%;"/></td>
							</tr>
							<c:if test="${pd.suggestType == '1'}">
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">投诉处理(要扣除服务分数):</td>
									<td><input type="number" name="commentScore" id="commentScore" datatype="n" nullmsg="请输入要扣分数!" value="20" maxlength="3" placeholder="这里输入要扣分数" title="服务分" style="width:98%;"/>
									<br/>
									<a class="btn btn-mini btn-success" style="float: right;margin-right: 50%;" onclick="sureSub();">确定提交</a>
									</td>
								</tr>
							</c:if>
							<tr>
								<td style="text-align: center;" colspan="10">
									<!-- <a class="btn btn-mini btn-primary" onclick="save();">保存</a> -->
									<a class="btn btn-mini btn-danger" onclick="top.layer.closeAll();">关闭</a>
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