<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
<title>微信绑定</title>
<style type="text/css">
	.hotline24{  border-radius: 5px; background:#04BE02; 
	line-height:40px; text-align:center; color:#fff;font-size:14px;border: none;
		width: 90%;
	}
</style>
</head>
<body>
	<center>
		<br/><br/>
		<div><img alt="" src="../uploadFiles/upload/weixin/error.jpg" width="100px;" height="100px;"/></div>
		<h3>${message }</h3>
		<%-- <h5>昵称:${snsUserInfo.nickname}</h5>
		<div>
			<img src="${snsUserInfo.headimgurl}" width="35%;" height="35%;">
		</div> --%>
		<h6 style="color: #808080">您可以返回重新进行绑定或重试</h6>
		<button class="hotline24" onclick="allclose()">取消</button>
	</center>
</body>

<script type="text/javascript">
	function allclose(){
		
		WeixinJSBridge.invoke('closeWindow',{},function(res){

		    //alert(res.err_msg);

		});
	}
</script>
</html>