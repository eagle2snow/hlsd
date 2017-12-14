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
						<form action="hourseman/horsemanList.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 90%;">
							    	<table>
										<tr>
											<td>
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" placeholder="这里输入骑手姓名/手机" class="nav-search-input" id="nav-search-input" 
														autocomplete="off" name="keywords" value="${pd.keywords }" style="width: 300px"/>
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
											<td style="vertical-align:top;padding-left:5px;">
											 	<select class="chosen-select form-control" name="userstatus" id="userstatus" data-placeholder="用户状态" style="vertical-align:top;width: 150px;">
												<option value=""></option>
												<option value="">全部</option>
												<option value="1" <c:if test="${pd.userstatus eq '1'}">selected="selected"</c:if>>注册用户</option>
												<option value="2" <c:if test="${pd.userstatus eq '2'}">selected="selected"</c:if>>实名认证中</option>
												<option value="3" <c:if test="${pd.userstatus eq '3'}">selected="selected"</c:if>>实名认证通过</option>
												<option value="4" <c:if test="${pd.userstatus eq '4'}">selected="selected"</c:if>>实名认证不通过</option>
												<option value="5" <c:if test="${pd.userstatus eq '5'}">selected="selected"</c:if>>考试通过</option>
												<option value="6" <c:if test="${pd.userstatus eq '6'}">selected="selected"</c:if>>考试不通过</option>
												<option value="7" <c:if test="${pd.userstatus eq '7'}">selected="selected"</c:if>>实地培训通过</option>
												<option value="8" <c:if test="${pd.userstatus eq '8'}">selected="selected"</c:if>>实地培训不通过</option>
												<%-- <option value="9" <c:if test="${pd.userstatus eq '9'}">selected="selected"</c:if>>已交押金</option> --%>
											  	</select>
											</td>
											
											<td style="vertical-align:top;padding-left:10px">
											 	<select id="level2" name="province" onchange="change2();">
											 		<option>所属省份</option>                       
			                      				</select>
											</td>
											<td style="vertical-align:top;padding-left:5px" onchange="change3();">
											 	<select id="level3" name="city">
											 		<option value="">所属地市</option>                       
			                      				</select>
											</td>
											<td style="vertical-align:top;padding-left:5px" onchange="change4();">
											 	<select id="level4" name="area">
											 		<option value="">所属区县</option>                       
			                      				</select>
											</td>
											<td style="vertical-align:top;padding-left:5px">
											 	<select id="level5" name="stand">
											 		<option value="">所属站点</option>                    
			                      				</select>
											</td>
										</tr>
									</table>
							    </td>
								<td style="vertical-align:top;width: 10%;">
									<c:if test="${QX.cha == 1 }">
										 <a class="btn btn-info btn-xs" onclick="tosearch();" title="查询">
										 <i id="nav-search-icon" class="ace-icon fa fa-search bigger-110"></i>查询</a>
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
									<th class="center">骑手ID</th>
									<th class="center">骑手姓名</th>
									<th class="center">骑手手机</th>
									<th class="center">加入/注册时间</th>
									<th class="center">所属省市</th>
									<th class="center">所在站点</th>
									<th class="center">状态</th>
									<th class="center">审核/编辑</th>
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.userId}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.userId}</td>
											<td class='center'>${var.userName}</td>
											<td class='center'>${var.userMobileNo}</td>
											<td class='center'>${var.createTime}</td>
											<td class='center'>${var.province} ${var.city} ${var.area}</td>
											<td class='center'>${var.stand}</td>
											<td class='center'>
												<c:if test="${var.status eq '1'}">注册用户</c:if>
												<c:if test="${var.status eq '2'}">实名认证中</c:if>
												<c:if test="${var.status eq '3'}">实名认证通过</c:if>
												<c:if test="${var.status eq '4'}">实名认证不通过</c:if>
												<c:if test="${var.status eq '5'}">考试通过</c:if>
												<c:if test="${var.status eq '6'}">考试不通过</c:if>
												<c:if test="${var.status eq '7'}">实地培训通过</c:if>
												<c:if test="${var.status eq '8'}">实地培训不通过</c:if>
												<%-- <c:if test="${var.status eq '9'}">已交押金</c:if> --%>
											</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-success" title="审核" onclick="goThrough('${var.userId}');">
															<i class="ace-icon fa fa-drivers-license-o bigger-110" title="审核"></i>
														</a>
														&nbsp;
														<a class="btn btn-xs btn-success" title="修改" onclick="editHorse('${var.userId}');">
															<i class="ace-icon fa fa-pencil-square-o bigger-110" title="修改骑手信息"></i>
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
			
			
			//初始多级级联第一级
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
				data: {DICTIONARIES_ID:'1'},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#level2").html('<option value="">所属省份</option>');
					 $.each(data.list, function(i, dvar){
					 	if('${pd.province}' == dvar.BIANMA){
					 		$("#level2").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 	}else{
					 		$("#level2").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 	}
					 });
					 
					 if('${pd.province}'!=''){
						change2();
					 }
				}
			});
		});
		
		//编辑修改骑手信息
		function editHorse(userId){
			top.layer.open({
				  type: 2,
				  title:'编辑',
				  area: ['900px', '650px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '${ctx}/hourseman/goEdit.do?userId='+userId
			 });
		}
		
		//修改
		function goThrough(Id){
			 top.layer.open({
				  type: 2,
				  title:'审核',
				  area: ['900px', '600px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>hourseman/goThrough.do?userId='+Id
			 });
		}
		
		
		//第二级值改变事件(初始第三级)
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
						 if('${pd.city}' == dvar.BIANMA){
						 		$("#level3").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}else{
						 		$("#level3").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}
					 });
					 if('${pd.city}'!=''){
						change3();
					 }
				}
			});
		}
		
		//第三级值改变事件(初始第四级)
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
						 if('${pd.area}' == dvar.BIANMA){
					 		$("#level4").append("<option value="+dvar.BIANMA+" selected='selected' id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 	 }else{
					 		$("#level4").append("<option value="+dvar.BIANMA+" id="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
					 	 }
					 });
					 if('${pd.stand}'!=''){
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
							 if('${pd.stand}' == dvar.BIANMA){
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