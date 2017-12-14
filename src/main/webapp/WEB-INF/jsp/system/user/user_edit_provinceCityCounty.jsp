<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全国城市三级联动</title>
<style type="text/css">
body{ background:#EEEEEE;margin:0; padding:0; font-family:"微软雅黑", Arial, Helvetica, sans-serif; }
a{ color:#006600; text-decoration:none;}
a:hover{color:#990000;}
.top{ margin:5px auto; color:#990000; text-align:center;}
.info select{ border:1px #993300 solid; background:#FFFFFF;}
.info{ margin:5px; text-align:center;}
.info #show{ color:#3399FF; }
.bottom{ text-align:right; font-size:12px; color:#CCCCCC; width:1000px;}
</style>
</head>
<body>

<div class="top">
	<h1>全国城市三级联动</h1>
</div>

<div class="info">
	<div>
	<select id="s_province" name="s_province"></select>  
    <select id="s_city" name="s_city" ></select>  
    <select id="s_county" name="s_county"></select>
    <script class="resources library" src="http://sandbox.runjs.cn/uploads/rs/267/g3ugugjp/area.js" type="text/javascript"></script>
    
    <script type="text/javascript">_init_area();</script>
    </div>
    <div id="show"></div>
</div>
<script type="text/javascript">
var Gid  = document.getElementById ;
var showArea = function(){
	Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
	Gid('s_city').value + " - 县/区" + 
	Gid('s_county').value + "</h3>"
							}
Gid('s_county').setAttribute('onchange','showArea()');
</script>
</body>
</html>