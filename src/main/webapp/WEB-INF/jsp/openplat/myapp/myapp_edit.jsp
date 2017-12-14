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
					
					<form action="myapp/${msg }.do" name="Form" id="Form" method="post" class="myappForm">
						<input type="hidden" name="XH" id="XH" value="${pd.XH}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">应用名称:</td>
								<td>
									<input type="text" name="APPNAME" id="APPNAME" value="${pd.APPNAME}" maxlength="255" placeholder="这里输入应用名称" 
									title="应用名称" style="width:98%;" class="inputxt Validform_error" datatype="s3-100" errormsg="至少3个字符！" nullmsg="请输入应用名称！"/>
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">用户id:</td>
								<td><input type="text" name="USERID" id="USERID" value="${empty pd.USERID ? sessionScope.sessionUser.USERNAME : pd.USERID}" maxlength="50" 
									placeholder="这里输入用户ID" title="用户ID" readonly="readonly" style="width:98%;" datatype="*"/>
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">appid:</td>
								<td><input type="text" name="APPID" id="APPID" value="${pd.APPID}" readonly="readonly" maxlength="50" 
									placeholder="点击获取" title="appid" style="width:85%;" datatype="*"/>
									&nbsp;<a class="btn btn-mini btn-primary" onclick="getUniqeId(this);">获取</a>
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">appkey:</td>
								<td><input type="text" name="APPKEY" id="APPKEY" readonly="readonly" value="${pd.APPKEY}" maxlength="50" 
									placeholder="点击获取" title="appkey" style="width:85%;" datatype="*"/>
									&nbsp;<a class="btn btn-mini btn-primary" onclick="getUniqeId(this);">获取</a>	
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">openid:</td>
								<td><input type="text" name="OPENID" id="OPENID" readonly="readonly" value="${pd.OPENID}" maxlength="50" 
									placeholder="点击获取" title="openid" style="width:85%;" datatype="*"/>
									&nbsp;<a class="btn btn-mini btn-primary" onclick="getUniqeId(this);">获取</a>
								</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">绑定余额账号(手机号):</td>
								<td>
									<select class="chosen-select form-control" name="BALANCEACCOUNT" datatype="*"
										id="BALANCEACCOUNT" data-placeholder="请选择" style="width: 85%;">
										<option value="">---请选择---</option>
										<c:forEach items="${balanceList}" var="item">
											<option value="${item.MOBILENO}" <c:if test="${pd.BALANCEACCOUNT eq item.MOBILENO}">selected="selected"</c:if>>
												${item.MOBILENO}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									&nbsp;&nbsp;
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
		//$(top.hangge());
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
			$(".myappForm").Validform({
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
		
		function getUniqeId(obj){
			if($(obj).prev().val()!=''){
				var layindex = top.layer.confirm('确定要重新获取吗？重新获取保存后会导致以前的APP版本不可用',function(){
					$.ajax({
						type: "POST",
						url: '<%=basePath%>myapp/getUuid.do?tm='+new Date().getTime(),
						cache: false,
						success: function(data){
							$(obj).prev().val(data);
							top.layer.close(layindex);
						}
					});
				});
			}else{
				$.ajax({
					type: "POST",
					url: '<%=basePath%>myapp/getUuid.do?tm='+new Date().getTime(),
					cache: false,
					success: function(data){
						$(obj).prev().val(data);
					}
				});
			}
		}
	</script>
</body>
</html>