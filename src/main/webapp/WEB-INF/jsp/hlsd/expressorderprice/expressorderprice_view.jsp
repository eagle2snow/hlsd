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
					
					<form action="expressorderprice/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="EXPRESSORDERPRICE_ID" id="EXPRESSORDERPRICE_ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">起点里程(公里):</td>
								<td>${pd.STARTMILEAGE}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">终点里程(公里):</td>
								<td>${pd.ENDMILEAGE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">里程费(元):</td>
								<td>${pd.MILEAGEPRICE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省:</td>
								<td>${pd.PROVINCE}
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">市:</td>
								<td>${pd.CITY}
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">配送员类型:</td>
								<td>
									<c:if test="${pd.DRIVERTYPE == '5'}">骑手</c:if>
									 <c:if test="${pd.DRIVERTYPE == '2'}">司机</c:if>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">费用类型:</td>
								<td>
									<c:if test="${pd.PRICETYPE == '1'}">里程费</c:if>
									<c:if test="${pd.PRICETYPE == '2'}">夜间费</c:if>
								</td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单类型:</td>
								<td><input type="text" name="ORDERTYPE" id="ORDERTYPE" datatype="*" nullmsg="请输入订单类型!" value="${pd.ORDERTYPE}" maxlength="2" placeholder="这里输入订单类型" title="订单类型" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">夜间费开始计费时间:</td>
								<td>${pd.STARTTIME}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">夜间费结束计费时间:</td>
								<td>${pd.ENDTIME}</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="2">
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
		<script type="text/javascript">
		function showProvince() {
			var value1 = $("#province option:selected").val();
			var value2 = $("#province option:selected").text();
			if (value2 != "请选择") {
				$("#city").empty()
				$("#city").append("<option value=''>请选择</option>");
				$.getJSON("expressorderprice/city.do?PROVINCEID=" + value1, function(
						result) {
					$.each(result, function(i, field) {
						var option = $("<option value="+field.CITYID+">"
								+ field.CITY + "</option>");
						$("#city").append(option);
					});
				});
			}
		}
	</script>
</body>
</html>