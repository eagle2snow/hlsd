<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<form action="hlsdorders/horseListPage.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 92%;">
							    	<table>
										<tr>
											<td style="vertical-align:top;padding-left:3px">
											 	<select id="level2" name="province" onchange="change2()">
											 		<option>所属省份</option>                       
			                      				</select>
											</td>
											<td style="vertical-align:top;padding-left:5px">
											 	<select id="level3" name="city">
											 		<option value="">所属地市</option>                       
			                      				</select>
											</td>
											<td style="padding-left:10px;">
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" placeholder="配送员姓名/手机" class="nav-search-input" id="nav-search-input" 
														autocomplete="off" name="keywords" value="${pd.keywords}" style="width: 220px;"/>
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
										</tr>
									</table>
							    </td>
								<td style="vertical-align:top;width: 8%;">
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
									<th class="center" style="width:3%;">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:2%;">序号</th>
									<th class="center" style="width:8%">骑手姓名</th>
									<th class="center" style="width:10%">骑手手机</th>
									<th class="center" style="width:8%" nowrap>账户金额</th>
									<th class="center" style="width:5%">评分</th>
									<th class="center" style="width:6%">加入时间</th>
									<th class="center" style="width:5%">订单总量</th>
									<th class="center" style="width:12%">所属省市</th>
									<th class="center" style="width:10%">最近结算时间/金额</th>
									<th class="center" style="width:4%">结算</th>
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
											<td class='center'>${var.userName}</td>
											<td class='center'>${var.userMobileNo}</td>
											<td class='center'>${empty var.money ? 0 : var.money}</td>
											<td class='center'>${var.commentScore}</td>
											<td class='center'>
												<fmt:formatDate value="${var.createTime}" pattern="yyyy-MM-dd"/>
											</td>
											<td class='center'>${var.orderNumberStatus}</td>
											<td class='center'>${var.province} ${var.city}</td>
											<td class='center'>${var.settleAccountTime}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-info" title="结算" onclick="viewDetail('${var.userId}',${var.money});">
															<i class="ace-icon fa fa-hand-o-up bigger-120" title="结算"></i>
														</a>
													</c:if>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="10" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center" >没有相关数据</td>
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
		function viewDetail(userId,money){
			if(money==undefined)money=0;
			top.layer.open({
				  type: 2,
				  title:'结算管理',
				  area: ['750px', '450px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>hlsdorders/goSettleAccount.do?money='+money+'&userId='+userId
			});
		}
		
	</script>

</body>
</html>