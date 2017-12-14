<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!--登录-->
		<div id="login-box"  style="display: none;" >
			<p class="prompt"></p>
			<ul>
				<li><label for="">手机号</label><input style="width: 320px;" type="text" name="" id="phone" value="" /></li>

				<li><label for="">验证码</label><input style="width: 200px;" type="text" name="" id="vcode" value="" />
					<input style="width: 100px;" class="countdown" type="button" name="" id="countdown" value="获取验证码" /></li>
				<li><label for=""></label><input style="width: 320px;" type="button" name="" id="loginbtn" value="登录" /></li>
				<li style="display: flex;justify-content: center; align-items: center;">
					<input style="float: left;" type="checkbox" checked="checked" name="phone" id="loginraw" value="" />
					<span >
						同意 <a href="law.jsp" style="color: #0042ff">《互联速递相关法律规定》</a>
					</span></li>
				
			</ul>
		</div>