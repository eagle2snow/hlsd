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
						<form action="hlsdorders/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 88%;">
							    	<table>
										<tr>
											<td>
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" placeholder="配送员姓名/手机" class="nav-search-input" id="nav-search-input" 
														autocomplete="off" name="keywords" value="${pd.keywords}" style="width: 250px;"/>
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
											<td style="padding-left:10px;"><input class="span10 date-picker" name="lastStart" id="lastStart"  value="${pd.lastStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="下单开始日期" title="下单开始日期"/></td>
											<td style="padding-left:5px;"><input class="span10 date-picker" name="lastEnd" id="lastEnd"  value="${pd.lastEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="下单结束日期" title="下单结束日期"/></td>
										 	<td style="vertical-align:top;padding-left:10px">
											 	<select id="level2" name="province" onchange="change2()">
											 		<option>所属省份</option>                       
			                      				</select>
											</td>
											<td style="vertical-align:top;padding-left:5px">
											 	<select id="level3" name="city">
											 		<option value="">所属地市</option>                       
			                      				</select>
											</td>
											<td style="vertical-align:top;padding-left:5px">
											 	<select id="orderStatus" name="orderStatus">
											 		<option value="">订单状态</option>
											 		<option value="000" <c:if test="${pd.orderStatus eq '000'}">selected="selected"</c:if>>取消订单</option>
											 		<option value="999" <c:if test="${pd.orderStatus eq '999'}">selected="selected"</c:if>>超时3分钟及以上</option>
											 		<option value="11" <c:if test="${pd.orderStatus eq '11'}">selected="selected"</c:if>>过期订单</option>   
			                      				</select>
											</td>
											<td>&nbsp;&nbsp;</td>
											<td>&nbsp;&nbsp;</td>
											<td>
												 &nbsp;&nbsp;订单总量：<font color="blue">${orderCnt}</font> 单, 总金额：<font color="blue">${allMoney}</font> ￥
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
									<th class="center" style="width:3%;">序号</th>
									<th class="center" style="width:12%">订单号</th>
									<th class="center" style="width:10%">下单时间</th>
									<th class="center" style="width:8%" nowrap>配送员姓名</th>
									<th class="center" style="width:8%">配送员手机</th>
									<th class="center" style="width:6%">订单状态</th>
									<th class="center" style="width:6%">订单总价</th>
									<th class="center" style="width:8%">订单里程(km)</th>
									<th class="center" style="width:8%">下单用户</th>
									<th class="center" style="width:14%">发货地</th>
									<th class="center" style="width:14%">收货地</th>
									<th class="center" style="width:4%">操作</th>
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.orderId}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.orderId}</td>
											<td class='center'>${var.createTime}</td>
											<td class='center'>${var.username}</td>
											<td class='center'>${var.driverMobileNo}</td>
											<td class='center'>
												<c:if test="${var.orderStatus eq '8'}">已签收</c:if>
												<c:if test="${var.orderStatus eq '9'}">已评价</c:if>
												<c:if test="${var.orderStatus eq '13'}">已完成</c:if>
												<c:if test="${var.orderStatus eq '0'}">已取消</c:if>
												<c:if test="${var.orderStatus eq '11'}">已过期</c:if>
												<c:if test="${var.orderStatus eq '1'}">已下单</c:if>
											</td>
											<td class='center'>${var.allPrice}</td>
											<td class='center'>${var.mileage}</td>
											<td class='center'>${var.nickName}</td>
											<td class='center'>${var.sendAddress}</td>
											<td class='center'>${var.receiverAddress}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-info" title="详情" onclick="viewDetail('${var.orderId}');">
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
			
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
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
				}
			});
		}
		
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
			var var1 = $("#nav-search-input").val();
			var var2 = $("#lastStart").val();
			var var3 = $("#lastEnd").val();
			var var4 = $("#level2 option:selected").val();
			document.getElementById('Form').action="<%=basePath%>hlsdorders/excel.do";
			if(var1=='' && var2=='' && var3=='' && var4==''){
				var cindex = top.layer.confirm("没有任何筛选条件，这样会很缓慢,确定要导出历史以来所有的订单吗？",function(){
					top.layer.close(cindex);
					top.layer.msg("订单导出中,请稍后...",{time:2000});
					document.getElementById('Form').submit();
				});
			}else{
				top.layer.msg("订单导出中,请稍后...",{time:2000});
				document.getElementById('Form').submit();
			}
		}
	</script>

</body>
</html>