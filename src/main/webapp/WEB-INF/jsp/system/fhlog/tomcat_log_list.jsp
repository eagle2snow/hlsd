<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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
							
						<!-- 检索  -->
						<form action="fhlog/listTomcatDir.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 92%;">
							    	 <input type="hidden" name="fileDir" id="fileDir" value="${pd.fileDir}"/>
							    </td>
								<td style="vertical-align:top;width: 8%;">
									<c:if test="${QX.cha == 1 }">
										 <a class="btn btn-info btn-xs" onclick="tosearch();" title="刷新">
										 <i id="nav-search-icon" class="ace-icon fa fa-refresh bigger-110"></i>刷新</a>
										 <a class="btn btn-info btn-xs" onclick="goBack()" title="返回">
										 <i id="nav-search-icon" class="ace-icon fa fa-undo bigger-110"></i>返回</a>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">文件名</th>
									<th class="center">文件地址</th>
									<th class="center">文件类型</th>
									<th class="center">文件大小</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='left'>
												<a href="javascript:viewFiles('${var.fileName}','${var.fileType}','${var.filePath}')">
												<i class="ace-icon fa blue ${var.fileType eq 'file' ? 'fa-file-text-o' : 'fa-folder-open-o'}"></i>
												&nbsp;${var.fileName}</a>
											</td>
											<td class='left'>${var.filePath}</td>
											<td class='left'>
												${var.fileType eq 'file' ? '文件' : '文件夹'}
											</td>
											<td class='center'>${var.fileSize}</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<div id="contentDiv" style="display: none;">
		<div id="contentDivbox"></div>
		<input type="hidden" id="_childPath"/>
		<!-- 如果需要分页阅读放开这个，并且修改后台读取日志的逻辑 -->
		<!-- <div style="width:100%;"><a class="btn btn-mini btn-info" style="margin-left:50%" id="nextRead"
		title="继续阅读" >继续阅读 <i class="ace-icon fa fa-angle-double-down bigger-110"></i></a> -->
		</div>
		<script>
			$('#nextRead').on('click',function(){
				sendServer($("#_fileName").val(),$("#_childPath").val());
			});
			
			function sendServer(fileName,childPath){
				 $.ajax({
						type: "POST",
						url: '<%=basePath%>fhlog/readLogFile.do?tm='+new Date().getTime(),
				    	data: {fileName:fileName,childDir:childPath},
						dataType:'json',
						//beforeSend: validateData,
						async:true,
						cache: false,
						success: function(data){
							$("#contentDivbox").append(data.responseMessage);
						}
					});
			}
		</script>	
	</div>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//退回到上一步
		function goBack(){
			$("#fileDir").val('');
			tosearch();
		}
		
		function viewFiles(fileName,fileType,filePath){
			//var loadIndex = top.layer.msg('文件读取中', {icon: 16,shade: 0.5});
			if(fileType=='dir'){ //进入列出文件夹里面的日志文件
				$("#fileDir").val(filePath);
				$("#Form").submit();
			}else{//直接打开文件
				var loadIndex = top.layer.msg('努力读取中', {icon: 16,shade: 0.3,time:10000});
				$.ajax({
					type: "POST",
					url: '<%=basePath%>fhlog/readLogFile.do?tm='+new Date().getTime(),
			    	data: {fileName:filePath},
					async:true,
					cache: false,
					success: function(data){
					    $("#contentDivbox").append(data);
						top.layer.open({
							  type: 1,
							  title:'日志详情',
							  area: ['1000px', '700px'],
							  closeBtn:1,
							  fixed: false, //不固定
							  maxmin: true,
							  content: $("#contentDiv").html()
						}); 
						top.layer.close(loadIndex);
					}
				});
				
			}
			
		}
		
	</script>

</body>
</html>