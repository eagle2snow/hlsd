<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	request.setAttribute("nowDate", new Date().getTime());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
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
						<div id="accordion" class="accordion-style1 panel-group" style="margin-top:20px;width: 100%;">
							<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
								<h4 class="lighter">终端接口测试</h4>
							</div>
							<!-- Token+Redis方式请求 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle collapsed" id="oneReqType" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false">
											<i class="bigger-110 ace-icon fa fa-angle-right" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
											&nbsp;Token+Redis方式请求
										</a>
									</h4>
								</div>

								<div class="panel-collapse collapse" id="collapseOne" aria-expanded="false" style="height: 0px;">
									<div class="panel-body">
										<div class="span12">
											<div class="widget-box">
												<div class="widget-body">
												 <div class="widget-main">
														<div class="step-content row-fluid position-relative">
															<input name="form-field-radio_one" id="form-field-radio_one" onclick="setType('POST');" type="radio" value="icon-edit" checked="checked" class="ace"><span class="lbl">POST</span>&nbsp;&nbsp;
															<input name="form-field-radio_one" id="form-field-radio_one" onclick="setType('GET');" type="radio" value="icon-edit" class="ace"><span class="lbl">GET</span>&nbsp;&nbsp;
															<input name="userId" id="userId" style="width:10%;" type="text" value="12345678900" title="用户登录ID" />
															<input name="userId_qs" id="userId_qs" style="width:10%;" type="hidden" />
															<input name="userPwd" id="userPwd" style="width:10%;" type="text" value="1" title="用户登录密码" />
															<input name="serviceNo" id="serviceNo" style="width:10%;" type="text" value="001" title="登录设备号,保证唯一" />
														</div>
														<div class="step-content row-fluid position-relative" style="margin-top: 3px;">
															Token： <input name="Token" id="Token" style="width:36%;" type="text" value="" title="token参数">
															&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="getToken();">认证获取Token</a>
														</div>
														<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
															<div style="float: left;">
																<span class="input-icon">
																	<input type="text" id="indexReqUrl" title="请求前缀" value="<%=basePath%>app/invoker/" style="width:310px;">
																	<i class="ace-icon fa fa-globe"></i>
																</span>
																<input type="text" id="reqService" title="请求服务器名" value="demoService" style="width:160px;">
																<input type="text" id="reqMethod" title="请求方法名" value="handle" style="width:160px;">
															</div>
															<div>
																&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="sendTokenSever();">请求</a>
																&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="gReload();">重置</a>
															</div>
														</div>
														<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
															请求参数：<textarea id="params-json-field" title="请求参数" class="autosize-transition span12" style="width:690px;">USERNAME=Chao</textarea>
															<br/>
															返回结果：<textarea id="result-json-field" title="返回结果" rows="7" class="autosize-transition span12" style="width:690px;"></textarea>
														</div>
														</div>
												    </div>
												 </div>
										   </div>
									</div>
								</div>
							</div>
						 
							 <!-- 固定参数加密方式 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false">
											<i class="bigger-110 ace-icon fa fa-angle-right" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
											&nbsp;固定加密参数方式
										</a>
									</h4>
								</div>
								<div class="panel-collapse collapse" id="collapseTwo" aria-expanded="false" style="height: 0px;">
									<div class="panel-body">
										<div class="span12">
											<div class="widget-box">
												<div class="widget-body">
												 <div class="widget-main">
														<div class="step-content row-fluid position-relative">
															<input name="form-field-radio1" id="form-field-radio1" onclick="setType('POST');" type="radio" value="icon-edit" checked="checked" class="ace"><span class="lbl">POST</span>&nbsp;&nbsp;
															<input name="form-field-radio1" id="form-field-radio2" onclick="setType('GET');" type="radio" value="icon-edit" class="ace"><span class="lbl">GET</span>&nbsp;&nbsp;&nbsp;&nbsp;
															<input name="key" id="form-field-radio1" type="radio" value="icon-edit" checked="checked" class="ace" ><span class="lbl">加密参数:</span>
															<input name="S_TYPE_S" id="S_TYPE_S" style="width:150px;" type="text" value="USERNAME" title="例子">
														</div>
														<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
															<div style="float: left;">
																<span class="input-icon">
																	<input type="text" id="serverUrl" title="输入请求地址" value="<%=basePath%>appuser/getAppuserByUm.do?USERNAME=Chao" style="width:540px;">
																	<i class="ace-icon fa fa-globe"></i>
																</span>
															</div>
															<div>
																&nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="sendSever();">请求</a>
																&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="gReload();">重置</a>
															</div>
														</div>
														<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
														<textarea id="json-field" title="返回结果" class="autosize-transition span12" style="width:690px;"></textarea>
													 	</div>
													 	<div class="step-content row-fluid position-relative">
														<label style="float:left;padding-left: 35px;">服务器响应：<font color="red" id="stime">-</font>&nbsp;毫秒</label>
														<label style="float:left;padding-left: 35px;">客户端请求：<font color="red" id="ctime">-</font>&nbsp;毫秒</label>
														</div>
														<br/>
														<div class="step-content row-fluid position-relative">
															<ul class="unstyled spaced2">
																<li class="text-warning orange"><i class="ace-icon fa fa-exclamation-triangle"></i>
																	相关参数协议：result: 00	请求失败 ; 01	请求成功; 02	返回空值; 03	请求协议参数不完整  ; 04  用户名或密码错误; 05  FKEY验证失败
																</li>
																<li class="text-warning green"><i class="ace-icon fa fa-star blue"></i>
																	校验加密规则：(取其中一个参数名+当前日期[格式 20150405]+混淆码",fh," 然后md5加密 的值作为 参数FKEY的值提交)
																</li>
															</ul>
														</div>
													 <input type="hidden" name="S_TYPE" id="S_TYPE" value="POST"/>
												 </div><!--/widget-main-->
												</div><!--/widget-body-->
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 网站管理系统接口请求方式 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle collapsed" id="ThreeReqType" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false">
											<i class="bigger-110 ace-icon fa fa-angle-right" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
											&nbsp;网站管理系统接口请求方式
										</a>
									</h4>
								</div>

								<div class="panel-collapse collapse" id="collapseThree" aria-expanded="false" style="height: 0px;">
									<div class="panel-body">
										<div class="span12">
											<div class="widget-box">
												<div class="widget-body">
												 <div class="widget-main">
														<div class="step-content row-fluid position-relative">
															<input name="form-field-radio_three" id="form-field-radio_three" onclick="setType('POST');" type="radio" value="icon-edit" checked="checked" class="ace"><span class="lbl">POST</span>&nbsp;&nbsp;
															<input name="form-field-radio_three" id="form-field-radio_three" onclick="setType('GET');" type="radio" value="icon-edit" class="ace"><span class="lbl">GET</span>&nbsp;&nbsp;
															<input name="mobileNo" id="mobileNo" style="width:10%;" type="text" value="13349907099" title="用户手机号" />
															<input name="valid6Code" id="valid6Code" style="width:10%;" type="text" value="999999" title="6位验证码" />
														</div>
														<div class="step-content row-fluid position-relative" style="margin-top: 3px;">
															Token： <input name="validToken" id="validToken" style="width:36%;" type="text" value="" title="token参数">
															&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="getTokenByWebSite();">获取Token</a>
														</div>
														<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
															<div style="float: left;">
																<span class="input-icon">
																	<input type="text" id="indexReqUrl_website" title="请求前缀" value="<%=basePath%>app_openapi/" style="width:310px;">
																	<i class="ace-icon fa fa-globe"></i>
																</span>
																<input type="text" id="reqMethod_website" title="请求服务器名" value="getMyCoupons" style="width:160px;">
															</div>
															<div>
																&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="sendTokenSever_website();">请求</a>
																&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="gReload();">重置</a>
															</div>
														</div>
														<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
															请求参数：<textarea id="params-json-field_website" title="请求参数" class="autosize-transition span12" style="width:690px;">USERNAME=Chao&orderId=xxx</textarea>
															<br/>
															返回结果：<textarea id="result-json-field_website" title="返回结果" rows="7" class="autosize-transition span12" style="width:690px;"></textarea>
														</div>
														</div>
												    </div>
												 </div>
										   </div>
									</div>
								</div>
							</div>
							
							
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
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon sfa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--MD5-->
	<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/interfaceTest.js?v=${nowDate}"></script>
	<script type="text/javascript">
		$("#oneReqType").click();
	</script>
</body>
</html>