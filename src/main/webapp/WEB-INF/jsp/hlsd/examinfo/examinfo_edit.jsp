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
					
					<form action="examinfo/${msg }.do" name="Form" id="Form" class="MyForm" method="post">
						<input type="hidden" name="QUESTION_ID" id="QUESTION_ID" value="${pd.QUESTION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题型:</td>
								<td>
									<input type="hidden" name="QUESTION_TYPE" id="QUESTION_TYPE" value="${pd.QUESTION_TYPE}"/>
									<input name="QUESTION_TYPE1" type="radio" onclick="javascript:$('.optiontr').remove();$('#QUESTION_TYPE').val('1');" class="ace" value="radio" id="QUESTION_TYPE1"><span class="lbl">单选</span>
									&nbsp;&nbsp;&nbsp;
									<input name="QUESTION_TYPE1" type="radio" onclick="javascript:$('.optiontr').remove();$('#QUESTION_TYPE').val('2');" class="ace" value="checkbox" id="QUESTION_TYPE2"><span class="lbl">多选</span>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">题目描述:</td>
								<td>
									 <textarea rows="3" cols="30" name="QUESTION_NAME" id="QUESTION_NAME" datatype="*" nullmsg="请输入题目描述!" 
									 style="width:98%;">${pd.QUESTION_NAME}</textarea>
								 </td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<a class="btn btn-mini btn-primary" onclick="addOption();">添加选项</a>
								</td>
							</tr>
							<tr id="optionTr">
								<td style="width:75px;text-align: right;padding-top: 13px;">正确答案:</td>
								<td><input type="text" name="RIGHT_ANSWERS" readonly="readonly" id="RIGHT_ANSWERS" datatype="*" nullmsg="请输入正确答案!" value="${pd.RIGHT_ANSWERS}" maxlength="50" placeholder="这里输入正确答案" title="正确答案" style="width:50%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="2">
									<input type="hidden" id="opt_code" name="opt_code"/>
									<input type="hidden" id="opt_content" name="opt_content"/>
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.layer.closeAll();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<!--验证框架-->
	<script type="text/javascript" src="static/js/validation/Validform_v5.3.2_min.js"></script>
		<script type="text/javascript">
		$(function(){//初始化表单验证框架
			$.Tipmsg.r=null;
			var showValidatemsg=function(msg,o){
				var id = $(o.obj.parents("td").next().find("id").context).attr("id");
				$("#"+id).tips({
					side:3,
		            msg:msg,
		            bg:'#AE81FF',
		            time:2
		        });
				$("#"+id).focus();
			}
			$(".MyForm").Validform({
				tiptype:function(msg,o){
					showValidatemsg(msg,o);
				},
				tipSweep:true
			});
			
			//设置题型的值，默认选中单选
			var tixing = $("#QUESTION_TYPE").val();
			if(tixing=='2'){
				$("#QUESTION_TYPE2").attr("checked",true);
			}else{
				$("#QUESTION_TYPE1").attr("checked",true);
				$("#QUESTION_TYPE").val('1');
			}
		});
		
		//保存提交
		function save(){
			var opt_code = new Array();
			var opt_content = new Array();
			var bianma = $("input[type='"+$("input[name='QUESTION_TYPE1']:checked").val()+"'][name!='QUESTION_TYPE1']");
			var isSubmit = true;
			$("input[class='optionvalue']").each(function(index){
				if(this.value.trim()!='' && this.value!=undefined && $("#RIGHT_ANSWERS").val()!=''){
					opt_code.push($(bianma[index]).val());
					opt_content.push(this.value);
				}else{
					isSubmit = false;
				}
			});
			if(isSubmit){
				$("#opt_code").val(opt_code);
				$("#opt_content").val(opt_content);
				$("#Form").submit();
			}else{
				top.layer.msg("选项内容不能为空!",{time:1500});
			}
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		//添加选项
		var bianma = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'];
		var index = 0;
		function addOption(){
			var ckType = $("input[name='QUESTION_TYPE1']:checked").val();
			var trId = ckType+bianma[index];
			if($(".optiontr").html()==undefined)index=0;
			var trHtml = '<tr id="'+trId+'" class="optiontr">'+
							'<td style="text-align: center;">'+
							'<input type="text" value="'+bianma[index]+'" style="width:35px;text-align:center"/>'+
							'</td>'+
							'<td style="text-align: left;">'+
							'<input type="text" class="optionvalue" style="width:80%" placeholder="这里输入 '+bianma[index]+' 选项内容"/> &nbsp;&nbsp;&nbsp;'+
							'<input type="'+ckType+'" value="'+bianma[index]+'" onclick="setTrueVal(this);" class="ace" name="'+ckType+'"><span class="lbl"></span>&nbsp;&nbsp;'+
							'<span class="red" onclick="delOption(\''+trId+'\');" style="float:right;padding-top:7px;cursor:pointer;">&nbsp;&nbsp;<i class="ace-icon fa fa-trash-o bigger-130"></i></span>'+
							'</td>'+
						'</tr>';
			$("#optionTr").before(trHtml);
			index++;
		}
		//删除选项
		function delOption(obj){
			$("#"+obj).remove();
		}
		//设置正确值
		function setTrueVal(obj){
			var ckType = $(obj).attr("type");
			if(ckType=='radio'){
				$("#RIGHT_ANSWERS").val($(obj).val());
			}else{
				var trueVal = '';
				$("input[type='checkbox']:checked").each(function(){
					trueVal+=this.value;
				});
				$("#RIGHT_ANSWERS").val(trueVal);
			}
		}
	</script>
</body>
</html>