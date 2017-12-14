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
					
					<form action="examinfo/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="QUESTION_ID" id="QUESTION_ID" value="${pd.QUESTION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">题型:</td>
								<td style="padding-top: 13px;">
									${pd.QUESTION_TYPE eq '1' ? '单选' : '多选'}
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">题目描述:</td>
								<td style="padding-top: 13px;">
									${pd.QUESTION_NAME}
								 </td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">正确答案:</td>
								<td style="padding-top: 13px;">${pd.RIGHT_ANSWERS}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">是否加入考试:</td>
								<td style="padding-top: 13px;">${pd.JOIN_EXAM eq 1 ? '加入' : '不加入'}</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">题目选项:</td>
								<td style="padding-top: 13px;">
									<c:forEach var="item" items="${optList}">
										${item.OPTION_CODE} &nbsp;&nbsp;${item.OPTION_CONTENT} <br/>
									</c:forEach>
								</td>
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
</body>
</html>