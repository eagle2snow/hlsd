<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="cn">
	<head>
	<title>菜单树选择</title>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<script type="text/javascript" src="<%=basePath%>plugins/zTree/3.5/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/zTree/3.5/jquery.ztree.all.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/zTree/3.5/zTreeStyle.css" />
	<style type="text/css">
		input{transform: scale(5,5);}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		  var setting = {
			    check: {
					enable: true,
					chkStyle: "radio"
				},
				data: {
					simpleData: {
						enable: true
					}
				},
				callback: {
					beforeCheck: zTreeBeforeCheck,
					onClick: onClick
				}
			};
		  
		var zTreeNodes = eval('${zTreeNodes}');
		$.fn.zTree.init($("#menuTree"), setting, zTreeNodes);
	});
	
	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("menuTree");
		zTree.checkNode(treeNode, !treeNode.checked, null, true);
		return false;
	}
	
	function zTreeBeforeCheck(treeId, treeNode) {
		parent.$('#PARENT_ID').val(treeNode.id);
		parent.$('#parentMenuName').val(treeNode.name);
		if(treeNode.pId==null){
			parent.$('#menuUrl').attr("readonly","readonly");
			parent.$('#menuUrl').attr("placeholder","顶级菜单禁止输入");
		}else{
			parent.$('#menuUrl').removeAttr("readonly");
			parent.$('#menuUrl').attr("placeholder","例如: user/listUsers.do");
		}
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);//关闭父窗口
	};
</script>
	</head>
<body>
	
	<div style="width:50%;padding-left: 10%;">
		<ul id="menuTree" class="ztree"></ul>
	</div>
</body>
</html>

