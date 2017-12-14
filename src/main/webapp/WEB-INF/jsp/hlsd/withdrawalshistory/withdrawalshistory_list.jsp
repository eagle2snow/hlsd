﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
						<form action="withdrawalshistory/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;width: 100%;">
							<tr>
							    <td style="width: 78%;">
							    	<table>
										<tr>
											<td>
												<div class="nav-search">
													<span class="input-icon">
														<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" />
														<i class="ace-icon fa fa-search nav-search-icon"></i>
													</span>
												</div>
											</td>
											<td style="padding-left:2px;"><input class="span10 date-picker" name="CREATETIME_MIN" id="CREATETIME_MIN"  value="${pd.CREATETIME_MIN}" type="text" data-date-format="yyyy-mm-dd 00:00:00" readonly="readonly" style="width:145px;" placeholder="开始日期" title="开始日期"/></td>
											<td style="padding-left:2px;"><input class="span10 date-picker" name="CREATETIME_MAX" id="CREATETIME_MAX"  value="${pd.CREATETIME_MAX}" type="text" data-date-format="yyyy-mm-dd 23:59:59" readonly="readonly" style="width:145px;" placeholder="结束日期" title="结束日期"/></td>
											<td style="vertical-align:top;padding-left:2px;">
											 	<select class="chosen-select form-control" name="TRANSACTIONTYPE" id="TRANSACTIONTYPE" data-placeholder="请选择类型" style="vertical-align:top;width: 120px;">
												<option value="">--流水类型--</option>
												<option value="0" <c:if test="${pd.TRANSACTIONTYPE == '0'}">selected="selected"</c:if>>充值</option>
												<option value="1" <c:if test="${pd.TRANSACTIONTYPE == '1'}">selected="selected"</c:if>>提现</option>
												<option value="2" <c:if test="${pd.TRANSACTIONTYPE == '2'}">selected="selected"</c:if>>订单消费</option>
												<option value="3" <c:if test="${pd.TRANSACTIONTYPE == '3'}">selected="selected"</c:if>>提现失败反额</option>
												<option value="4" <c:if test="${pd.TRANSACTIONTYPE == '4'}">selected="selected"</c:if>>配送员收入</option>
												<option value="5" <c:if test="${pd.TRANSACTIONTYPE == '5'}">selected="selected"</c:if>>平台收入</option>
												<option value="6" <c:if test="${pd.TRANSACTIONTYPE == '6'}">selected="selected"</c:if>>财务结算</option>
												<option value="7" <c:if test="${pd.TRANSACTIONTYPE == '7'}">selected="selected"</c:if>>支付押金</option>
												<option value="8" <c:if test="${pd.TRANSACTIONTYPE == '8'}">selected="selected"</c:if>>邀请奖励</option>
												<option value="9" <c:if test="${pd.TRANSACTIONTYPE == '9'}">selected="selected"</c:if>>负责人抽成</option>
											  	</select>
											</td>
											<td style="vertical-align:top;padding-left:2px;">
											 	<select class="chosen-select form-control" name="STATUS" id="STATUS" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;">
												<option value="">--流水状态--</option>
												<option value="0" <c:if test="${pd.STATUS == '0'}">selected="selected"</c:if>>进行中</option>
												<option value="1" <c:if test="${pd.STATUS == '1'}">selected="selected"</c:if>>成功</option>
												<option value="2" <c:if test="${pd.STATUS == '2'}">selected="selected"</c:if>>失败</option>
											  	</select>
											</td>
											<td style="vertical-align:top;padding-left:2px;">
											 	<select class="chosen-select form-control" name="USERTYPE" id="USERTYPE" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;">
												<option value="">--用户类型--</option>
												<option value="5" <c:if test="${pd.USERTYPE == '5'}">selected="selected"</c:if>>骑手</option>
												<option value="2" <c:if test="${pd.USERTYPE == '2'}">selected="selected"</c:if>>司机</option>
												<option value="1" <c:if test="${pd.USERTYPE == '1'}">selected="selected"</c:if>>用户</option>
											  	</select>
											</td>
											<td style="vertical-align:top;padding-left:2px;">
											 	<select class="chosen-select form-control" name="PAYWAY" id="PAYWAY" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;">
												<option value="">--支付类型--</option>
												<option value="支付宝" <c:if test="${pd.PAYWAY == '支付宝'}">selected="selected"</c:if>>支付宝</option>
												<option value="微信" <c:if test="${pd.PAYWAY == '微信'}">selected="selected"</c:if>>微信</option>
												<option value="余额" <c:if test="${pd.PAYWAY == '余额'}">selected="selected"</c:if>>余额</option>
											  	</select>
											</td>
										</tr>
									</table>
							    </td>
								<td style="vertical-align:top;width: 22%;">
									<c:if test="${QX.cha == 1 }">
										 <a class="btn btn-info btn-xs" onclick="tosearch();" title="查询">
										 <i id="nav-search-icon" class="ace-icon fa fa-search bigger-110"></i>查询</a>
									</c:if>
									<%-- <c:if test="${QX.add == 1 }">
										<a class="btn btn-info btn-xs" onclick="add();">
										<i id="nav-search-icon" class="ace-icon fa fa-plus bigger-110"></i>新增</a>
									</c:if> --%>
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
									<th class="center">编号</th>
									<!-- <th class="center">用户ID</th> -->
									<th class="center">用户手机号</th>
									<th class="center">用户类型</th>
									<!-- ( 0 : 充值1: 提现 2 : 消费 3:提现失败反额 4:配送员收入 5:平台收入 6: 7 :支付押金 8 :邀请 9 :抽成) -->
									<th class="center">记录类型</th>
									<th class="center">金额</th>
									<th class="center">支付方式</th>
									<!-- <th class="center">支付宝账号</th> -->
									<!-- (0 : 进行中 1 :成功 2:失败) -->
									<th class="center">状态</th>
									<th class="center">订单id</th>
									<th class="center">备注</th>
									<!-- <th class="center">是否返现</th> -->
									<th class="center">流水编号</th>
									<th class="center">创建时间</th>
									
									<!-- <th class="center">优惠券金额</th> -->
									<!-- <th class="center">优惠券id</th> -->
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.ID}</td>
											<td class='center'>${var.USERMOBILENO}</td>
											<td class='center'>
												<c:if test="${var.USERTYPE == '1'}">用户</c:if>
												<c:if test="${var.USERTYPE == '2'}">司机</c:if>
												<c:if test="${var.USERTYPE == '5'}">骑手</c:if>
											</td>
											<td class='center'>
												<c:if test="${var.TRANSACTIONTYPE == '0'}">充值</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '1'}">提现</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '2'}">订单消费</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '3'}">提现失败反额</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '4'}">配送员收入</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '5'}">平台收入</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '6'}">财务结算</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '7'}">支付押金</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '8'}">邀请奖励</c:if>
												<c:if test="${var.TRANSACTIONTYPE == '9'}">负责人抽成</c:if>
											</td>
											<td class='center'>${var.TRANSACTIONAMOUNT}</td>
											<td class='center'>${var.PAYWAY}</td>
											<%-- <td class='center'>${var.ACCOUNT}</td> --%>
											<td class='center'>
												<c:if test="${var.STATUS == '0'}">进行中</c:if>
												<c:if test="${var.STATUS == '1'}">成功</c:if>
												<c:if test="${var.STATUS == '2'}">失败</c:if>
											</td>
											<td class='center'>${var.ORDERID}</td>
											<td class='center'>${var.REMARK}</td>
											<%-- <td class='center'>${var.FAILBACK}</td> --%>
											<td class='center'>${var.HISTORYID}</td>
											<td class='center'>${var.CREATETIME}</td>
											<%-- <td class='center'>${var.AMOUNT}</td> --%>
											<%-- <td class='center'>${var.COUPONID}</td> --%>
											<td class="center">
												<c:if test="${QX.cha != 1}">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if><!-- && var.STATUS == '0' -->
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.cha == 1 && ((var.TRANSACTIONTYPE == '0' || var.TRANSACTIONTYPE == '1'|| var.TRANSACTIONTYPE == '2' || var.TRANSACTIONTYPE == '7')&& var.STATUS == '0')}">
													<a class="btn btn-xs btn-success" title="检验" onclick="check('${var.ID}','${var.PAYWAY}');">
														<i class="ace-icon fa fa-search-plus bigger-120" title="检验"></i>
													</a>
													</c:if>
													<%-- <c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.ID}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if> --%>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.cha == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="check('${var.ID}','${var.PAYWAY}');" class="tooltip-success" data-rel="tooltip" title="检验">
																	<span class="green">
																		<i class="ace-icon fa fa-search-plus bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<%-- <c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if> --%>
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
		
		//检验流水记录
		function check(Id,payway){
			 top.layer.open({
				  type: 2,
				  title:'检验流水',
				  area: ['500px', '400px'],
				  fixed: false, //不固定
				  shade: 0.1,
				  maxmin: false,
				  content: '<%=basePath%>withdrawalshistory/goCheck.do?ID='+Id+'&PAYWAY='+payway
			 });
		}
		
		//批量删除操作
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
								url: '<%=basePath%>withdrawalshistory/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>withdrawalshistory/excel.do';
		}
	</script>


</body>
</html>