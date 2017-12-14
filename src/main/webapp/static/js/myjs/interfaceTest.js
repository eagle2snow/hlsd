var locat = (window.location+'').split('/'); 
$(function(){if('tool'== locat[3]){locat =  locat[0]+'//'+locat[2];}else{locat =  locat[0]+'//'+locat[2]+'/'+locat[3];};});

$(top.hangge());

//重置
function gReload(){
	top.jzts();
	$("#serverUrl").val('');
	$("#json-field").val('');
	$("#S_TYPE_S").val('');
	self.location.reload();
}

//请求类型
function setType(value){
	$("#S_TYPE").val(value);
}

function sendSever(){
	
	if($("#serverUrl").val()==""){
		$("#serverUrl").tips({
			side:3,
            msg:'输入请求地址',
            bg:'#AE81FF',
            time:2
        });
		$("#serverUrl").focus();
		return false;
	}
	
	//加密方式  (取其中一个参数名+当前日期[格式 20150405]+混淆码",fh," 然后md5加密 的值作为 参数FKEY的值提交)
	var paraname = $("#S_TYPE_S").val();	//要加密的参数
	var nowtime = date2str(new Date(),"yyyyMMdd");
	//alert($.md5(paraname+nowtime+',fh,'));
	
	var startTime = new Date().getTime(); //请求开始时间  毫秒
	top.jzts();
	console.log($.md5(paraname+nowtime+',fh,'));
	$.ajax({
		type: "POST",
		url: locat+'/tool/severTest.do',
    	data: {serverUrl:$("#serverUrl").val()+"&FKEY="+$.md5(paraname+nowtime+',fh,'),requestMethod:$("#S_TYPE").val(),tm:new Date().getTime()},
		dataType:'json',
		cache: false,
		success: function(data){
			 $(top.hangge());
			 if("success" == data.errInfo){
				 $("#serverUrl").tips({
						side:1,
			            msg:'服务器请求成功',
			            bg:'#75C117',
			            time:3
			     });
				 var endTime = new Date().getTime();  //请求结束时间  毫秒 
				 $("#ctime").text(endTime-startTime);
				 
			 }else{
				 $("#serverUrl").tips({
						side:3,
			            msg:'请求失败,检查URL正误',
			            bg:'#FF5080',
			            time:3
			     });
				 return;
			 }
			 $("#json-field").val(data.result);
			 $("#json-field").tips({
					side:2,
		            msg:'返回结果',
		            bg:'#75C117',
		            time:3
		     });
			 $("#stime").text(data.rTime);
		}
	});
}

function intfBox(){
	var intfB = document.getElementById("json-field");
	var intfBt = document.documentElement.clientHeight;
	intfB .style.height = (intfBt  - 320) + 'px';
}
intfBox();
window.onresize=function(){  
	intfBox();
};

//js  日期格式
function date2str(x,y) {
     var z ={y:x.getFullYear(),M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
     return y.replace(/(y+|M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-(v.length>2?v.length:2))});
};

//获取Token
function getToken(){
	$.ajax({
		type: ""+$("#S_TYPE").val()+"",
		url: $("#indexReqUrl").val()+"login/auth",
    	data: {
    		userId:$("#userId").val(),
    		userPwd:$.md5($("#userPwd").val()),
    		serviceNo:$("#serviceNo").val()
    		},
		dataType:'json',
		cache: false,
		success: function(data){
			if(data.result==true){
				$("#Token").val(data.Token);
				$("#userId_qs").val(data.userInfo.userId);
				$("#Token").tips({
					side:1,
		            msg:'认证获取成功!',
		            bg:'#75C117',
		            time:1
		     	});
			}else{
				$("#Token").val(data.resp_msg);
				$("#Token").tips({
					side:1,
		            msg:'认证失败!',
		            bg:'#EF8F44',
		            time:3
		     	});
			}
		}
	});
}

//发送请求
function sendTokenSever(){
	$.ajax({
		type: ""+$("#S_TYPE").val()+"",
		url: $("#indexReqUrl").val()+$("#reqService").val()+"/"+$("#reqMethod").val()+"?"+$("#params-json-field").val(),
    	data: {
    		userId:$("#userId_qs").val(),
    		Token:$("#Token").val(),
    		serviceNo:$("#serviceNo").val()
    	},
		dataType:'json',
		cache: false,
		success: function(data){
			$("#result-json-field").val(JSON.stringify(data));
		}
	})
}


//获取Token(网站系统)
function getTokenByWebSite(){
	$.ajax({
		type: ""+$("#S_TYPE").val()+"",
		url: $("#indexReqUrl_website").val()+"loginByMobile",
		data: {
			mobileNo:$("#mobileNo").val(),
			valid6Code:$("#valid6Code").val()
		},
		dataType:'json',
		cache: false,
		success: function(data){
			if(data.result==true){
				$("#validToken").val(data.validToken);
				$("#validToken").tips({
					side:1,
					msg:'认证获取成功!',
					bg:'#75C117',
					time:1
				});
			}else{
				$("#validToken").val(data.resp_msg);
				$("#validToken").tips({
					side:1,
					msg:'认证失败!',
					bg:'#EF8F44',
					time:2
				});
			}
		}
	});
}

//发送请求
function sendTokenSever_website(){
	$("#result-json-field_website").val("已清空");
	$.ajax({
		type: ""+$("#S_TYPE").val()+"",
		url: $("#indexReqUrl_website").val()+$("#reqMethod_website").val()+"?"+$("#params-json-field_website").val(),
		data: {
			validToken:$("#validToken").val(),
			userId:$("#mobileNo").val(),
			md5Key:$.md5("openplat201707!~_")
		},
		dataType:'json',
		async:false,
		cache: false,
		success: function(data){
			$("#result-json-field_website").val(JSON.stringify(data, null, "\t"));
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			 if(XMLHttpRequest.status==404){
				 $("#reqMethod_website").tips({
					side:1,
					msg:'没有找到 '+ $("#reqMethod_website").val()+' 接口 !',
					bg:'#EF8F44',
					time:3
				});
			 }else if(XMLHttpRequest.status==500){
				 $("#reqMethod_website").tips({
						side:1,
						msg:$("#reqMethod_website").val()+' 接口请求出错 !',
						bg:'#EF8F44',
						time:2
					});
				 }
	    }
	})
}