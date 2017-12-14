	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%
			String pathf = request.getContextPath();
			String basePathf = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ pathf + "/";
		%>
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePathf%>static/ace/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='<%=basePathf%>static/ace/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=basePathf%>static/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
			try{
				//添加回车按钮事件
				document.onkeydown = function (event) {
					event = event || window.event;
					if (event.keyCode === 13 && "function" === typeof tosearch) {
						tosearch();
					}   
				}
			}catch(exception){}
		</script>
		<script src="static/ace/js/bootstrap.js"></script>