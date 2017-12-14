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
					<form action="hourseman/${msg}.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="userId" id="userId" value="${pd.userId}"/>
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
								<td>
									<input type="text" name="userName" id="userName" value="${pd.userName}" maxlength="255" 
									placeholder="这里输入骑手姓名" title="骑手姓名" style="width:98%;"/>
								 </td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">手机:</td>
								<td>
									<input type="text" name="userMobileNo" id="userMobileNo" value="${pd.userMobileNo}" maxlength="255" 
									placeholder="这里输入骑手手机" title="骑手手机" style="width:98%;"/>
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">身份证号:</td>
								<td>
									<input type="text" name="userCardNo" id="userCardNo" value="${pd.userCardNo}" maxlength="255" 
									placeholder="这里输入骑手身份证号" title="骑手身份证" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">所属省市:</td>
								<td colspan="3">
								 	<select id="level2" name="provinceId" onchange="change2();">
								 		<option>所属省份</option>                       
                      				</select>
								 	<select id="level3" name="cityId" onchange="change3();">
								 		<option value="">所属地市</option>                       
                      				</select>
								 	<select id="level4" name="areaId" onchange="change4();">
								 		<option value="">所属区县</option>                       
                      				</select>
                      				<select id="level5" name="standId">
								 		<option value="">所在站点</option>                   
                      				</select>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">加入/注册时间:</td>
								<td style="padding-top: 13px;">
									${pd.createTime}
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">押金金额:</td>
								<td style="padding-top: 13px;">${empty pd.cashPledge ? 0 : pd.cashPledge} 元</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">认证照片:</td>
								<td style="padding-top: 13px;" colspan="3">
									<table style="width: 99%">
										<tr>
											<c:forEach var="item" items="${fjxxList}">
												<td>
													${item.FILE_NAME} <br/>
													<img alt="${item.FILE_NAME}" id="pic_${item.FILE_ID}" onclick="viewPic(this)" src="${ctx}/${item.FILE_PATH}" width="200" height="150"/>
												</td>
											</c:forEach>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="4">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.layer.closeAll();">关闭</a>
								</td>
							</tr>
						</table>
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
	
	<script type="text/javascript">
	
		function save(){
			$("#Form").submit();
		}
		
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
		
		function sendServer(statu,layindex){
			$.ajax({
				type: "POST",
				url: "${ctx}/hourseman/updateStatu.do?userId=${pd.userId}&status="+statu+"&yajin=${pd.cashPledge}&tm="+new Date().getTime(),
				cache: false,
				dataType:"json",
				success: function(data){
					top.layer.close(layindex);
					top.layer.msg(data.msg,{time:1500});
					if(data.result==true){
						$("input[name='renzhengRadio']").css("color","black");
						$("#renzhengRadio"+statu).parent("div").prevAll().each(function(){
							$(this).css("color","green");
						});
					}
				}
			});
		}
		
		$().ready(function(){
			//初始多级级联第一级 省份
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
				data: {DICTIONARIES_ID:'1'},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#level2").html('<option value="">所属省份</option>');
					 $.each(data.list, function(i, dvar){
					 	if('${pd.provinceId}' == dvar.BIANMA){
					 		$("#level2").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 	}else{
					 		$("#level2").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 	}
					 });
					 
					 if('${pd.provinceId}'!=''){
						change2();
					 }
				}
			});
		});
		
		//第二级值改变事件(初始第三级 地市)
		function change2(){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:$("#level2 option:selected").attr("id")},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#level3").html('<option value="">所属地市</option>');
					 $.each(data.list, function(i, dvar){
						 if('${pd.cityId}' == dvar.BIANMA){
						 		$("#level3").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}else{
						 		$("#level3").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}
					 });
					 if('${pd.cityId}'!=''){
						change3();
					 }
				}
			});
		}
		
		//第三级值改变事件(初始第四级 区县)
		function change3(){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:$("#level3 option:selected").attr("id")},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#level4").html('<option value="">所属区县</option>');
					 $.each(data.list, function(i, dvar){
						 if('${pd.areaId}' == dvar.BIANMA){
						 		$("#level4").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}else{
						 		$("#level4").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}
					 });
					 if('${pd.areaId}'!=''){
						change4();
					 }
				}
			});
		}
		
		//第四级值改变事件(初始第五级 站点)
		function change4(){
			if($("#level4 option:selected").attr("id")!=undefined){
				$.ajax({
					type: "POST",
					url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
			    	data: {DICTIONARIES_ID:$("#level4 option:selected").attr("id")},
					dataType:'json',
					cache: false,
					success: function(data){
						$("#level5").html('<option value="">所属站点</option>');
						 $.each(data.list, function(i, dvar){
							 if('${pd.standId}' == dvar.BIANMA){
							 		$("#level5").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
							 	}else{
							 		$("#level5").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
							 	}
						 });
					}
				});
			}
		}
	</script>
</body>
</html>