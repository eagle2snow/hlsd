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
					
					<form action="hourseman/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="userId" id="userId" value="${pd.userId}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">骑手id:</td>
								<td><input type="text" name="USERID" id="USERID" datatype="*" nullmsg="请输入用户id!" value="${pd.USERID}" maxlength="200" placeholder="这里输入用户id" title="用户id" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">骑手名称:</td>
								<td><input type="text" name="userName" id="userName" datatype="*" nullmsg="请输入骑手名称!" value="${pd.userName}" maxlength="200" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户电话:</td>
								<td><input type="text" name="userMobileNo" id="userMobileNo" datatype="*" nullmsg="请输入骑手电话!" value="${pd.userMobileNo}" maxlength="50" placeholder="这里输入用户电话" title="用户电话" style="width:98%;"/></td>
							</tr>
						<%-- 	<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属省:</td>
								<td><input type="text" name="provinceId" id="provinceId" datatype="*" nullmsg="请输入所在省!" value="${pd.provinceId}" maxlength="200" placeholder="这里输入省编号" title="省编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属市:</td>
								<td><input type="text" name="cityId" id="cityId" datatype="*" nullmsg="请输入所在市!" value="${pd.cityId}" maxlength="200" placeholder="这里输入市编号" title="市编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属区:</td>
								<td><input type="text" name="areaId" id="areaId" datatype="*" nullmsg="请输入所在区!" value="${pd.areaId}" maxlength="200" placeholder="这里输入区编号" title="区编号" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务分:</td>
								<td><input type="number" name="commentScore" id="commentScore" datatype="*" nullmsg="请输入评分!" value="${pd.commentScore}" maxlength="32" placeholder="这里输入评分" title="评分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否能用:</td>
								<td style="vertical-align:top;padding-left:2px;">
											 	<select class="chosen-select form-control" name="isUse" id="isUse" data-placeholder="账号是否能用" maxlength="2" style="vertical-align:top;width: 98%;">
												<option value="0" <c:if test="${pd.isUse == '0'}">selected="selected"</c:if>>是</option>
												<option value="1" <c:if test="${pd.isUse == '1'}">selected="selected"</c:if>>否</option>
											  	</select>
											</td>
								<%-- <td><input type="text" name="isUse" id="isUse" datatype="*" nullmsg="请输入是否能用!" value="${pd.isUse}" maxlength="2" placeholder="这里输入是否能用" title="是否能用" style="width:98%;"/></td> --%>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">角色:</td>
								<td><input type="text" name="ROLE" id="ROLE" datatype="*" nullmsg="请输入角色!" value="${pd.ROLE}" maxlength="200" placeholder="这里输入角色" title="角色" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">等级积分:</td>
								<td><input type="number" name=scaleScore id="scaleScore" datatype="*" nullmsg="请输入字段名73!" value="${pd.scaleScore}" maxlength="50" placeholder="这里输入字段名73" title="字段名73" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="closeAll();">关闭</a>
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
		
	     function closeAll(){
	    	 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	    	 parent.layer.close(index);                   //关闭父窗口
	    	  } 
		</script>
</body>
</html>