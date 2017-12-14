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
						<form action="examinfo/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 80%;">
							    	<table>
										<tr>
											<td>
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" placeholder="这里输入题目描述" class="nav-search-input" id="nav-search-input" 
														autocomplete="off" name="keywords" value="${pd.keywords }" style="width: 300px"/>
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
											<td style="vertical-align:top;padding-left:5px;">
											 	<select class="chosen-select form-control" name="tixing" id="tixing" data-placeholder="题型" style="vertical-align:top;width: 120px;">
												<option value=""></option>
												<option value="">全部</option>
												<option value="1" <c:if test="${pd.tixing eq '1'}">selected="selected"</c:if>>单选</option>
												<option value="2" <c:if test="${pd.tixing eq '2'}">selected="selected"</c:if>>多选</option>
											  	</select>
											</td>
											<td style="vertical-align:top;padding-left:5px;">
											 	<select class="chosen-select form-control" name="joinexam" id="joinexam" data-placeholder="是否加入考试" style="vertical-align:top;width: 120px;">
												<option value=""></option>
												<option value="">全部</option>
												<option value="1" <c:if test="${pd.joinexam eq '1'}">selected="selected"</c:if>>加入</option>
												<option value="0" <c:if test="${pd.joinexam eq '0'}">selected="selected"</c:if>>不加入</option>
											  	</select>
											</td>
										</tr>
									</table>
							    </td>
								<td style="vertical-align:top;width: 20%;">
									<c:if test="${QX.cha == 1 }">
										 <a class="btn btn-info btn-xs" onclick="tosearch();" title="查询">
										 <i id="nav-search-icon" class="ace-icon fa fa-search bigger-110"></i>查询</a>
									</c:if>
									<c:if test="${QX.add == 1 }">
										<a class="btn btn-info btn-xs" onclick="add();">
										<i id="nav-search-icon" class="ace-icon fa fa-plus bigger-110"></i>新增</a>
									</c:if>
									<c:if test="${QX.edit == 1 }">
										<a class="btn btn-info btn-xs" onclick="makeAll('确定要将选中的数据加入考试题库吗?','1');" title="批量加入" >
										<i id="nav-search-icon" class="ace-icon fa fa-arrow-circle-down bigger-110"></i>批量加入</a>
										<a class="btn btn-info btn-xs" onclick="makeAll('确定要将选中的数据移除考试题库吗?','0');" title="批量移除" >
										<i id="nav-search-icon" class="ace-icon fa fa-arrow-circle-up bigger-110"></i>批量移除</a>
									</c:if>
									
									<%-- <c:if test="${QX.toExcel == 1 }">
										<a class="btn btn-info btn-xs" onclick="toExcel();" title="导出到Excel">
										<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110"></i>导出</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
										<a class="btn btn-xs btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >
										<i id="nav-search-icon" class="ace-icon fa fa-trash bigger-110"></i>删除</a>
									</c:if> --%>
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
									<th class="center">题型</th>
									<th class="center">题目描述</th>
									<th class="center">正确答案</th>
									<th class="center">加入考试</th>
									<th class="center">创建时间</th>
									<th class="center">创建人</th>
									<th class="center">操作</th>
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.QUESTION_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.QUESTION_TYPE eq '1' ? '单选' : '多选'}</td>
											<td class='center'>${var.QUESTION_NAME}</td>
											<td class='center'>${var.RIGHT_ANSWERS}</td>
											<td class='center'>${var.JOIN_EXAM eq '1' ? '加入' : '不加入'}</td>
											<td class='center'>${var.CREATETIME}</td>
											<td class='center'>${var.CREATEUSER}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="详情" onclick="goView('${var.QUESTION_ID}');">
														<i class="ace-icon fa fa-eye bigger-120" title="详情"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.QUESTION_ID}',this);">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
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
				  area: ['800px', '550px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>examinfo/goAdd.do',
				  cancel:function(){
					  tosearch();
				  }
			 });
		}
		
		//删除
		function del(Id,obj){
			 var layindex = top.layer.confirm('确定要删除吗?',function(){
				$.ajax({
					type: "POST",
					url: "<%=basePath%>examinfo/delete.do?QUESTION_ID="+Id+"&tm="+new Date().getTime(),
					cache: false,
					success: function(data){
						top.layer.close(layindex);
						$(obj).parents('tr').remove();
					}
				});
			});
		}
		
		//修改
		function goView(Id){
			 top.layer.open({
				  type: 2,
				  title:'详情',
				  area: ['600px', '400px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>examinfo/goView.do?QUESTION_ID='+Id
			 });
		}
		
		//批量操作
		function makeAll(msg,opStatu){
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
						$.ajax({
							type: "POST",
							url: '<%=basePath%>examinfo/updateJoinExam.do?tm='+new Date().getTime(),
					    	data: {DATA_IDS:str,joinStatu:opStatu},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								top.layer.close(layindex);
							}
						});
					}
			});
		};
		
	</script>
</body>
</html>