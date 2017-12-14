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
	<style type="text/css">
		.renzhengRadio{float: left;padding-bottom: 10px;}
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
						<input type="hidden" name="QUESTION_ID" id="QUESTION_ID" value="${pd.userId}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<col width="20%"/>
							<col width="30%"/>
							<col width="20%"/>
							<col width="30%"/>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">骑手编号:</td>
								<td style="padding-top: 13px;">
									${pd.userId}
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">姓名:</td>
								<td style="padding-top: 13px;">
									${pd.userName}
								 </td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">手机:</td>
								<td style="padding-top: 13px;">${pd.userMobileNo}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">身份证号:</td>
								<td style="padding-top: 13px;">${pd.userCardNo}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">加入时间:</td>
								<td style="padding-top: 13px;">${pd.createTime}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">所属省市:</td>
								<td style="padding-top: 13px;">${pd.province} ${pd.city}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">所在站点:</td>
								<td style="padding-top: 13px;" colspan="3">${pd.stand}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">确认操作:</td>
								<td style="padding-top: 13px;" colspan="3">
									<div class="renzhengRadio"><input name="renzhengRadio" type="radio" class="ace" value="5" id="renzhengRadio5"><span class="lbl">考试通过</span>
									 	&nbsp;&nbsp;</div>
									<div class="renzhengRadio"><input name="renzhengRadio" type="radio" class="ace" value="6" id="renzhengRadio6"><span class="lbl">考试不通过</span>
									 	&nbsp;&nbsp;</div>
									<br/>
									<a class="btn btn-mini btn-success" style="float: right;margin-right: 5%;" onclick="sureSub();">确定提交</a>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="4">
									<a class="btn btn-mini btn-danger" onclick="top.layer.closeAll();">关闭</a>
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
	
	<script type="text/javascript">
		function viewPic(obj){
			top.layer.open({
				  type: 1,
				  title: false,
				  closeBtn: 1,
				  skin: 'layui-layer-nobg', //没有背景色
				  shadeClose: true,
				  content: "<img src='"+$(obj).attr("src")+"' width='100%' height='100%'/>"
			});
		}
		$("#renzhengRadio${pd.status}").attr("checked",true).parent("div").css("color","green");
		
		//确定提交
		function sureSub(){
			var currCk = $("input[name='renzhengRadio']:checked").val();
			var layindex = top.layer.confirm('确定要更新选中的状态吗?',function(){
				sendServer(currCk,layindex);
			});
		}
		
		function sendServer(statu,layindex){
			$.ajax({
				type: "POST",
				url: "${ctx}/hourseman/updateStatu.do?userId=${pd.userId}&status="+statu+"&tm="+new Date().getTime(),
				cache: false,
				dataType:"json",
				success: function(data){
					top.layer.close(layindex);
					top.layer.msg(data.responseMessage,{time:1500});
					if(data.result==true){
						$("input[name='renzhengRadio']").css("color","black");
						$("#renzhengRadio"+statu).parent("div").prevAll().each(function(){
							$(this).css("color","green");
						});
					}
				}
			});
		}
	</script>
</body>
</html>