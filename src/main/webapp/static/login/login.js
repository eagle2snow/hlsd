	
	//服务器校验
	function severCheck(){
		if(check()){
			var loginname = $("#loginname").val();
			var password = $("#password").val();
			var code = loginname+",fh,"+password+",fh,"+$("#code").val();
			$.ajax({
				type: "POST",
				url: 'login_login',
		    	data: {KEYDATA:code,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
						saveCookie();
						window.location.href="main/index";
					}else{
						if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF6633',
								time : 5
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF6633',
								time : 5
							});
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								color:'#FF6633',
								bg : '#E0AF46',
								time : 5
							});
							$("#loginname").focus();
						}
						setTimeout("javascript:setBtnAvailible();",1000) //1.5秒后登录按钮恢复可用状态
					}
				}
			});
		}else{
			setTimeout("javascript:setBtnAvailible();",1000) //1.5秒后登录按钮恢复可用状态
		}
		
		//客户端校验
		function check() {
			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#FF6633',
					time : 3
				});
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#FF6633',
					time : 3
				});
				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#FF6633',
					time : 3
				});
				$("#code").focus();
				return false;
			}
			$("#submit_btn").val("正在登录 , 请稍后 ...").css("background","#c4983b").attr("disabled",true);
			return true;
		}
	}
	
	function setBtnAvailible(){
		$("#submit_btn").val("登录").css("background","#e0af46").attr("disabled",false);
	}
	
	function savePaw() {
		if (!$("#saveid").attr("checked")) {
			$.cookie('loginname', '', {
				expires : -1
			});
			$.cookie('password', '', {
				expires : -1
			});
			$("#loginname").val('');
			$("#password").val('');
		}
	}

	function saveCookie() {
		if ($("#saveid").attr("checked")) {
			$.cookie('loginname', $("#loginname").val(), {
				expires : 7
			});
			$.cookie('password', $("#password").val(), {
				expires : 7
			});
		}
	}
	
	document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
        	severCheck();
        }
    }; 