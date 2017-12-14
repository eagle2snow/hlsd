<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="static/login/login.css"/>
<title>${pd.SYSNAME}</title>
</head>
<body>
<form action="" method="post" name="loginForm" id="loginForm">
	<div class="hlsd_container">
		<div class="hlsd_login">
			<div class="hlsd_title">
				<div class="title_img">
					<img src="static/login/img/logo.png" style="width:45px;height:45px;"/>
				</div>
				<div class="title_text">
					<p>${pd.SYSNAME}</p>
					<p>HU LIAN SU DI</p>
				</div>
			</div>
			<ul>
				<li>
					<div class="input_box">
						<label for=""><img src="static/login/img/User.png" alt=""></label>
						<input class="large_input" type="text" name="loginname" id="loginname" placeholder="请输入用户名">
					</div>
				</li>
				<li>
					<div class="input_box">
						<label for=""><img src="static/login/img/Lock.png" alt=""></label> <input
							class="large_input" type="password" name="password" id="password" placeholder="请输入密码">
					</div>
				</li>
				<li>
					<div class="input_box_code">
						<label for=""><img src="static/login/img/yanz.png" alt=""></label>
						<input class="small_input" name="code" id="code" type="text" placeholder="验证码">
					</div>
					
					<div class="input_box_code_img"><img id="codeImg" alt="" title="点击更换" src=""></div>
					
					<div class="rememberPwd">
						<font color="white">记住密码</font>
						<input name="form-field-checkbox" id="saveid" type="checkbox" onclick="savePaw();" style="position: relative;top:2px;cursor: pointer;"/>
					</div>
				</li>
				<li style="margin-top: 5px;">
					<div class="input_box_submit">
						<input class="submit_input" id="submit_btn" type="button" onclick="severCheck();" value="登录"/>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>	
</body>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="static/login/login.js"></script> 
	
	<script type="text/javascript">
		//初始化验证码和绑定刷新验证码事件
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
			//判断是不是火狐浏览器
			if (navigator.userAgent.indexOf('Firefox') >= 0) {
		       $(".rememberPwd").css("position","static");//兼容火狐记住密码样式
		    }
		});
		
		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + new Date().getTime());
		}
		//登录超时后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
</html>