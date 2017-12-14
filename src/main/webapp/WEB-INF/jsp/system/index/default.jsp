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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts-all.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
<style type="text/css">
	.alert{padding: 3px;}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
								<i class="ace-icon fa fa-check green"></i>
								欢迎使用互联速递管理平台&nbsp;&nbsp;
								<strong class="green">
									&nbsp;
									<a href="#" target="_blank"></a>
								</strong>
							</div>
							
							
							<div id="main" style="width: 1024px;height:650px;"></div>
							
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
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
<script type="text/javascript" src="plugins/echarts/jquery.min.js"></script>
<script type="text/javascript">
	var all = [];
	var today = [];
	var tomm = [];
	$().ready(function(){
		$.ajax({
			url:'<%=basePath%>hlsdorders/findOrderAllCountAndMoney.do',
			type:"post",
			dataType:"json",
			async:false,
			success:function(data){
				all =  data.all;
				today = data.today;
				tomm = data.tomm;
				// 指定图表的配置项和数据
				 var option = {
					    title : {
					        text: '全国订单总量',
					        subtext: '黄色块表示已开通城市',
					        x:'center'
					    },
					    tooltip: {  
				            trigger: 'item',  
				            formatter: function(params) {  
				                var res = params.name+'<br/>';  
				                var myseries = option.series;  
				                for (var i = 0; i < myseries.length; i++) {  
				                    for(var j=0;j<myseries[i].data.length;j++){  
				                        if(myseries[i].data[j].name==params.name){  
				                            res+=myseries[i].name +' : '+myseries[i].data[j].value+'</br>';  
				                        }  
				                    }  
				                }  
				                return res;  
				            }  
				        },
					    legend: {
					        orient: 'vertical',
					        x:'left',
					        data:['今日订单','昨日订单','总订单']
					    },
					    dataRange: {
					        min: 0,
					        max: 2500,
					        x: 'left',
					        y: 'bottom',
					        text:[],           // 文本，默认为数值文本
					        calculable : false,
					        splitList: [
					           {start: 1, end: 10000000, color: '#7EC0F0'}
					        ]
					    },
					    toolbox: {
					        show: true,
					        orient : 'vertical',
					        x: 'right',
					        y: 'center',
					        feature : {
					            mark : {show: false},
					            dataView : {show: true, readOnly: false},
					            restore : {show: false},
					            saveAsImage : {show: false}
					        }
					    },
					    roamController: {
					        show: false,
					        x: 'right',
					        mapTypeControl: {
					            'china': false
					        }
					    },
					    series : [
					        {
					            name: '今日订单',
					            type: 'map',
					            mapType: 'china',
					            roam: false,
					            itemStyle:{
					                normal:{label:{show:true}},
					                emphasis:{label:{show:true}}
					            },
					            data:today
					        },
					        {
					            name: '昨日订单',
					            type: 'map',
					            mapType: 'china',
					            itemStyle:{
					                normal:{label:{show:true}},
					                emphasis:{label:{show:true}}
					            },
					            data:tomm
					        },
					        {
					            name: '总订单',
					            type: 'map',
					            mapType: 'china',
					            itemStyle:{
					                normal:{label:{show:true}},
					                emphasis:{label:{show:true}}
					            },
					            data:all
					        }
					    ]
					};
				   // 基于准备好的dom，初始化echarts实例
			      var myChart = echarts.init(document.getElementById('main'));
				  // 使用刚指定的配置项和数据显示图表。
			      myChart.setOption(option);
			     }
		    });
	    });
  </script>
</body>
</html>