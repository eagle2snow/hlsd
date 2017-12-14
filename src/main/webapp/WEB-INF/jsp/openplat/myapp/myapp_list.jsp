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
						<form action="myapp/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 80%;">
							    	<table>
										<tr>
											<td>
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" style="width: 300px" placeholder="这里输入应用名称/用户ID/余额账号 " class="nav-search-input" 
														id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" />
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
										</tr>
									</table>
							    </td>
								<td style="vertical-align:top;width: 20%;">
									<c:if test="${QX.add == 1 }">
										 <a class="btn btn-light btn-xs" onclick="tosearch();" title="查询">
										 <i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 blue "></i>查询</a>
									</c:if>
									<c:if test="${QX.cha == 1 }">
										<a class="btn btn-light btn-xs" onclick="add();">
										<i id="nav-search-icon" class="ace-icon fa fa-plus bigger-110 blue"></i>新增</a>
									</c:if>
									<c:if test="${QX.toExcel == 1 }">
										<a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到Excel">
										<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 blue"></i>导出</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
										<a class="btn btn-xs btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >
										<i id="nav-search-icon" class="ace-icon fa fa-trash bigger-110"></i>删除</a>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center" style="width:15%">应用名称</th>
									<th class="center" style="width:12%">用户id</th>
									<th class="center" style="width:12%">绑定余额账号</th>
									<th class="center">状态</th>
									<th class="center" style="width:130px;">创建时间</th>
									<th class="center" style="width:100px;">创建人</th>
									<th class="center" style="width:130px;">修改时间</th>
									<th class="center" style="width:100px;">修改人</th>
									<th class="center" style="width:80px;">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.XH}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.APPNAME}</td>
											<td class='center'>${var.USERID}</td>
											<td class='center'>${var.BALANCEACCOUNT}</td>
											<td class='center'>
												<c:if test="${var.STATUS eq 1}">正常</c:if>
												<c:if test="${var.STATUS eq 0}">异常</c:if>
											</td>
											<td class='center'>
												<fmt:formatDate value="${var.CREATETIME}" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td class='center'>${var.CREATEUSER}</td>
											<td class='center'>
												<fmt:formatDate value="${var.UPDATETIME}" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td class='center'>${var.UPDATEUSER}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.XH}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.XH}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.XH}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.XH}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
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
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.layer.open({
				  type: 2,
				  title:'新增',
				  area: ['600px', '450px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>myapp/goAdd.do'
			 });
		}
		
		//删除
		function del(Id){
			var layindex = top.layer.confirm('确定要删除吗?',function(){
				$.ajax({
					type: "POST",
					url: "<%=basePath%>myapp/delete.do?XH="+Id+"&tm="+new Date().getTime(),
					cache: false,
					success: function(data){
						$(obj).prev().val(data);
						top.layer.close(layindex);
					}
				});
			});
		}
		
		//修改
		function edit(Id){
			 top.layer.open({
				  type: 2,
				  title:'新增',
				  area: ['600px', '450px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>myapp/goEdit.do?XH='+Id
			 });
		}
		
		//批量操作
		function makeAll(msg){
			var layindex = top.layer.confirm(msg,function(){
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						top.layer.close(layindex);
						top.layer.msg("您没有选择任何内容！",{time:1500});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							$.ajax({
								type: "POST",
								url: '<%=basePath%>myapp/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
										tosearch();
									 });
								}
							});
						}
					}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>myapp/excel.do';
		}
	</script>


</body>
</html>