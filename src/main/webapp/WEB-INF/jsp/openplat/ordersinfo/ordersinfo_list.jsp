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
						<form action="ordersinfo/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 88%;">
							    	<table>
										<tr>
											<td>
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" placeholder="订单号/发货人" class="nav-search-input" id="nav-search-input" 
														autocomplete="off" name="keywords" value="${pd.keywords }" style="width: 250px;"/>
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
											<td style="padding-left:2px;"><input class="span10 date-picker" name="lastStart" id="lastStart"  value="${pd.lastStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="下单开始日期" title="下单开始日期"/></td>
											<td style="padding-left:2px;"><input class="span10 date-picker" name="lastEnd" id="lastEnd"  value="${pd.lastEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="下单结束日期" title="下单结束日期"/></td>
											<td style="vertical-align:top;padding-left:2px;">
											 	<select class="chosen-select form-control" name="STATUS" id="STATUS" 
											 	data-placeholder="订单状态" style="vertical-align:top;width: 120px;">
													<option value=""></option>
													<option value="">全部</option>
												 	<c:forEach var="statItem" items="${statusList}">
												 		<option value="${statItem.STATUCODE}">${statItem.STATUNAME}</option>
												 	</c:forEach>
											  	</select>
											</td>
										</tr>
									</table>
							    </td>
								<td style="vertical-align:top;width: 12%;">
									<c:if test="${QX.cha == 1 }">
										 <a class="btn btn-info btn-xs" onclick="tosearch();" title="查询">
										 <i id="nav-search-icon" class="ace-icon fa fa-search bigger-110"></i>查询</a>
									</c:if>
									<c:if test="${QX.toExcel == 1 }">
										<a class="btn btn-info btn-xs" onclick="toExcel();" title="导出到Excel">
										<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110"></i>导出</a>
									</c:if>
									<%-- <c:if test="${QX.del == 1 }">
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
									<th class="center">订单号</th>
									<th class="center">下单用户</th>
									<th class="center" style="width:150px;">下单时间</th>
									<th class="center" nowrap>发货人</th>
									<th class="center">发货人电话</th>
									<th class="center">承运司机</th>
									<th class="center">速运类型</th>
									<th class="center">订单状态</th>
									<th class="center">订单总价</th>
									<th class="center">总里程</th>
									<th class="center">支付状态</th>
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.XH}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.ORDERID}</td>
											<td class='center'>${var.USERID}</td>
											<td class='center'>${var.ORDERTIME}</td>
											<td class='center'>${var.SENDERNAME}</td>
											<td class='center'>${var.SENDERPHONE}</td>
											<td class='center'>${var.REALNAME}</td>
											<td class='center'>
												<c:if test="${var.EXPRESSTYPE eq '1'}">小汽车</c:if>
												<c:if test="${var.EXPRESSTYPE eq '2'}">骑手</c:if>
											</td>
											<td class='center'>${var.STATUNAME}</td>
											<td class='center'>${var.ORDERPRICE}</td>
											<td class='center'>${var.ORDERMILEAGE}</td>
											<td class='center'>
												<c:if test="${var.PAYSTATUS eq '0'}">未支付</c:if>
												<c:if test="${var.PAYSTATUS eq '1'}">已支付</c:if>
											</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-info" title="详情" onclick="viewDetail('${var.XH}','${var.ORDERID}');">
															<i class="ace-icon fa fa-hand-o-up bigger-120" title="详情"></i>
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
		
		
		//查看详情
		function viewDetail(xh,orderId){
			top.layer.open({
				  type: 2,
				  title:'订单信息',
				  area: ['850px', '560px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>ordersinfo/goView.do?orderId='+orderId+'&XH='+xh
			});
		}
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>ordersinfo/excel.do';
		}
	</script>

</body>
</html>