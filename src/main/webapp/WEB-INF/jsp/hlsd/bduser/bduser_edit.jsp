<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

							<form action="bduser/${msg }.do" name="Form" id="Form"
								class="MyForm" method="post">
								<input type="hidden" name="BDUSER_ID" id="BDUSER_ID"
									value="${pd.BDUSERID}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">BD专员编号:</td>
											<td><input readonly="readonly" type="text"
												name="BDUSERID" id="BDUSERID" datatype="*"
												nullmsg="请输入bd专员id!" value="${pd.BDUSERID}" maxlength="32"
												placeholder="这里输入bd专员id" title="bd专员id" style="width: 98%;" /></td>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">电话:</td>
											<td><input type="number" name="BDMOBILENO"
												id="BDMOBILENO" datatype="n" nullmsg="请输入电话!"
												value="${pd.BDMOBILENO}" maxlength="32" placeholder="这里输入电话"
												title="电话" style="width: 98%;" /></td>
										</tr>
										<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">BD码:</td>
								<td><input type="number" name="BDCODE" id="BDCODE" datatype="n" nullmsg="请输入bd码!" value="${pd.BDCODE}" maxlength="32" placeholder="这里输入bd码" title="bd码" style="width:98%;"/></td>
							</tr> --%>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">BD专员名称:</td>
											<td><input type="text" name="BDUSERNAME" id="BDUSERNAME"
												datatype="*" nullmsg="请输入BD专员名称!" value="${pd.BDUSERNAME}"
												maxlength="100" placeholder="这里输入BD专员名称" title="BD专员名称"
												style="width: 98%;" /></td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">省id:</td>
											<td><select name="PROVINCEID" onchange="showProvince()"
												id="province">
													<option>请选择省</option>
													<c:forEach items="${pd.provinces}" var="p">
														<option value="${p.PROVINCEID}">${p.PROVINCE}</option>
													</c:forEach>
											</select>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">市id:</td>
											<td><select name="CITYID" id="city"
												onchange="showCity()">
													<option>请选择市</option>
											</select></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">区编号:</td>
											<td><select name="AREAID" id="area"
												onchange="showArea()">
													<option>请选择区</option>
											</select></td>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">站id:</td>
											<td><select name="STANDID" id="stand">
													<option>请选择站</option>
											</select></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
												class="btn btn-mini btn-danger"
												onclick="top.layer.closeAll();">取消</a></td>
										</tr>
									</table>
								</div>
								<div id="zhongxin2" class="center" style="display: none">
									<br />
									<br />
									<br />
									<br />
									<br />
									<img src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green">提交中...</h4>
								</div>
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
	<script type="text/javascript"
		src="static/js/validation/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
		$(function() {//初始化表单验证框架
			$.Tipmsg.r = null;
			var showValidatemsg = function(msg, o) {
				var id = $(o.obj.parents("td").next().find("id").context).attr(
						"id");
				$("#" + id).tips({
					side : 3,
					msg : msg,
					bg : '#AE81FF',
					time : 2
				});
				$("#" + id).focus();
			}
			$(".MyForm").Validform({
				tiptype : function(msg, o) {
					showValidatemsg(msg, o);
				},
				tipSweep : true
			});
		});

		//保存提交
		function save() {
			$("#Form").submit();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		});
	</script>
	<script type="text/javascript">
		function showProvince() {
			var value1 = $("#province option:selected").val();
			var value2 = $("#province option:selected").text();
			if (value2 != "请选择") {
				$("#city").empty()
				$("#city").append("<option value=''>请选择</option>");
				$.getJSON("bduser/city.do?PROVINCEID=" + value1, function(
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
	<script type="text/javascript">
		function showCity() {
			var value1 = $("#city option:selected").val();
			var value2 = $("#city option:selected").text();
			if (value2 != "请选择") {
				$("#area").empty()
				$("#area").append("<option value=''>请选择</option>");
				$.getJSON("bduser/area.do?CITYID=" + value1, function(result) {
					$.each(result, function(i, field) {
						var option = $("<option value="+field.AREAID+">"
								+ field.AREA + "</option>");
						$("#area").append(option);
					});
				});
			}
		}
	</script>
	<script type="text/javascript">
		function showArea() {
			var value1 = $("#area option:selected").val();
			var value2 = $("#area option:selected").text();
			if (value2 != "请选择") {
				$("#stand").empty()
				$("#stand").append("<option value=''>请选择</option>");
				$.getJSON("bduser/stand.do?AREAID=" + value1, function(result) {
					$.each(result, function(i, field) {
						var option = $("<option value="+field.STANDID+">"
								+ field.STAND + "</option>");
						$("#stand").append(option);
					});
				});
			}
		}
	</script>
</body>
</html>