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
	<style type="text/css">
		#table_report tr td{
			vertical-align:bottom;
		}
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
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<col width="15%"/>
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
							<c:forEach var="item" items="${detailList}" varStatus="status">
								<tr>
								<td colspan="4"><font style="font-weight: bolder;">第 ${status.count} 单</font></td>
								</tr>
								<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">收货人:</td>
									<td>${item.CONSIGNEENAME}</td>
									<td style="width:100px;text-align: right;padding-top: 13px;">收货人电话:</td>
									<td>${item.CONSIGNEEPHONE}</td>
								</tr>
								<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">收货详细地址:</td>
									<td colspan="3">
										${item.CONSIGNEEPROVANCE}${item.CONSIGNEECITY}
										${item.CONSIGNEEAREA}${item.CONSIGNEEDETAILADDRESS}
									</td>
								</tr>
								<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">里程:</td>
									<td>${item.MILEAGE} km</td>
									<td style="width:100px;text-align: right;padding-top: 13px;">里程费:</td>
									<td>${item.MILESTONESPAYMENT} 元</td>
								</tr>
								<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">浮动费:</td>
									<td>${item.FLOATINGCHARGE} 元</td>
									<td style="width:100px;text-align: right;padding-top: 13px;">夜间费:</td>
									<td>${item.NIGHTFEE} 元</td>
								</tr>
								<tr>
									<td style="width:100px;text-align: right;padding-top: 13px;">配送物品名称:</td>
									<td>${item.GOODSNAME}</td>
									<td style="width:100px;text-align: right;padding-top: 13px;">物品体积/重量:</td>
									<td>
										<c:if test="${item.GOODSVOLUME eq '1'}">小型</c:if>
										<c:if test="${item.GOODSVOLUME eq '2'}">中型</c:if>
										<c:if test="${item.GOODSVOLUME eq '3'}">大型</c:if>
										/
										<c:if test="${item.GOODSWEIGHT eq '1'}">20kg以下</c:if>
										<c:if test="${item.GOODSWEIGHT eq '2'}">20~50kg</c:if>
										<c:if test="${item.GOODSWEIGHT eq '3'}">50kg以上</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none;"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
</body>
</html>