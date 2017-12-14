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
					
					<form action="balanceaccount/${msg }.do" name="Form" id="Form" method="post" class="balanceaccountForm">
						<input type="hidden" name="XH" id="XH" value="${pd.XH}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
								<td><input type="text" name="MOBILENO" id="MOBILENO" datatype="m" value="${pd.MOBILENO}" maxlength="50" placeholder="这里输入手机号" title="手机号" style="width:75%;"/>
									&nbsp;<a class="btn btn-mini btn-primary" onclick="getMobileYzm(this);">获取验证码</a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">验证码:</td>
								<td><input type="text" name="YZM" id="YZM" datatype="*" value="" maxlength="6" placeholder="手机接收到的验证码" title="验证码" style="width:75%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户id:</td>
								<td><input type="text" name="USERID" id="USERID" value="${empty pd.USERID ? sessionScope.sessionUser.USERNAME : pd.USERID}" maxlength="50" 
									placeholder="这里输入用户ID" title="用户ID" readonly="readonly" style="width:75%;" datatype="*"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">余额:</td>
								<td><input type="text" name="BALANCE1" id="BALANCE" datatype="*" readonly="readonly" value="${empty pd.BALANCE ? '0.00' : pd.BALANCE}" maxlength="14" placeholder="点击右边充值" title="余额" style="width:75%;"/>
									<c:if test="${not empty pd.XH}">
										&nbsp;<a class="btn btn-mini btn-primary" onclick="rechargeMoney(this);">去充值</a>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									&nbsp;
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
	<!--验证框架-->
	<script type="text/javascript" src="static/js/validation/Validform_v5.3.2_min.js"></script>
		<script type="text/javascript">
		$(top.hangge());
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
			$(".balanceaccountForm").Validform({
				tiptype:function(msg,o){
					showValidatemsg(msg,o);
				},
				tipSweep:true
			});
		});
		//保存提交
		function save(){
		    var mobileNo = $("#MOBILENO").val();
		    var yzm = $("#YZM").val();
		    if(yzm!=''){
		    	$.ajax({
					type: "POST",
					url: '<%=basePath%>balanceaccount/sginSixYzm.do?mobileNo='+mobileNo+'&yzm='+yzm+'&tm='+new Date().getTime(),
					cache: false,
					success: function(data){
						if($.trim(data)=='1'){
							$("#Form").submit();
						}else{
							top.layer.msg("验证码不正确",{time:1500});
						}
					}
				});
		    }else{
		    	top.layer.msg("验证码不能为空",{time:1500});
		    }
		}
		
		//倒计时设置
		var countdown=60; 
		function settime(obj) {
			if (countdown == 0) { 
				$(obj).removeAttr("disabled").text("获取验证码");
				countdown = 60; 
				return;
			} else { 
				$(obj).attr('disabled',"true").text("重新发送(" + countdown + ")");
				countdown--; 
			}
			setTimeout(function(){settime(obj)},1000);
		}
		
		//获取验证码
		function getMobileYzm(obj){
			var mobileNo = $("#MOBILENO").val();
			if(checkMobile(mobileNo)){
				settime(obj);
				$.ajax({
					type: "POST",
					url: '<%=basePath%>balanceaccount/getSixYzm.do?mobileNo='+mobileNo+'&tm='+new Date().getTime(),
					cache: false,
					success: function(data){
						if($.trim(data)=='1'){
							top.layer.msg("获取成功",{time:1500});
						}else if($.trim(data)=='2'){
							countdown = 0;
							top.layer.msg("获取失败，该手机号已绑定",{time:1500});
						}else{
							top.layer.msg("获取失败",{time:1500});
						}
					}
				});
			}
		}
		
		function checkMobile(str) {
		    var re = /^1\d{10}$/
		    if (!re.test(str)) {
		    	$("#MOBILENO").tips({
					side:3,
		            msg:'请填写正确的手机号',
		            bg:'#AE81FF',
		            time:2
		        });
		    	return false;
		    }else
		    	return true;
		}
		
		//去充值
		function rechargeMoney(obj){
			top.layer.open({
			  type: 2,
			  title:'账号充值',
			  area: ['700px', '500px'],
			  fixed: false, //不固定
			  shade: 0.1,
			  maxmin: false,
			  content: '<%=basePath%>balanceaccount/gotoPay.do?xh=${pd.XH}&mobileNo='+$("#MOBILENO").val()
			});
		}
	</script>
</body>
</html>