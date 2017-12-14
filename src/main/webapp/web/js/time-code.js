////登录弹窗
$(document).ready(function() {
    onload()
})
var loginmodel;
$('.login a').on('click', function() {
    var loginStorage = sessionStorage.getItem("userName");
    if (!loginStorage) {
        openlogin()
    }else{
        swal({ 
              title: "确定要退出登录吗？", 
              type: "warning",
              showCancelButton: true,
              cancelButtonText:'取消', 
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "确定退出", 
              closeOnConfirm: false
            },
            function(){
                sessionStorage.clear()
                $('#loginuser').html('登录')
                 window.location.reload();
            });
    }

})
//弹出登录框
function openlogin() {
    // $('#loginuser').html('登录')
    loginmodel = layer.open({
        title: ['登录', 'background:#44c2f1;color:#fff'],
        area: ['600px', '400px'],
        content: $('#login-box'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
        type: 1
    });

}

function validatemobile(mobile,cb) {
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if (mobile.length == 0) {
        $('.prompt').slideDown();
        $('.prompt').html('请输入手机号码！')
        return false;
    } else if (mobile.length != 11) {
        $('.prompt').slideDown();
        $('.prompt').html('请输入有效的手机号码！')
        return false;
    } else if (!myreg.test(mobile)) {
        $('.prompt').slideDown();
        $('.prompt').html('请输入有效的手机号码！')
        return false;
    } else if ($('#vcode').val().length != 6) {
        $('.prompt').slideDown();
        $('.prompt').html('请输入6位验证码！')
        return false;
    } else if (!$('#loginraw').is(':checked')) {
        $('.prompt').slideDown();
        $('.prompt').html('请确认法律法规！')
        return false;
    }
    else {
        $('.prompt').slideUp();
    }
    cb()
}
//点击获取验证码，开始倒计时
var wait = 60;

function time(o) {

    if (wait == 0) {
        o.removeAttribute("disabled");
        o.style.background = "#44C2F1"
        o.value = "获取验证码";
        wait = 60;

    } else {
        o.setAttribute("disabled", true);
        o.style.background = "#ccc"
        o.value = "重新发送(" + wait + ")";
        wait--;
        setTimeout(function() {
                time(o)
            },
            1000)
    }
}
//点击获取验证码
document.getElementById("countdown").onclick = function() {
    validatemobile(filterXSS($('#phone').val()))
    vcode()
    time(this);

}
//获取验证码
function vcode() {
    console.log(0)
    $.ajax({
        url: url,
        method: 'POST',
        dataType: 'json',
        data: {
            mobileNo: filterXSS($('#phone').val())
        },
        success: function(res) {
            console.log(res)
        }
    })
}

//通过手机号和密码登录
$('#loginbtn').on('click', function() {
    console.log(0)
    login();
})
$('#login-box input').blur(function() {
    $('.prompt').slideUp();
})

function login() {
    validatemobile($('#phone').val(),function(){
        $('.prompt').slideUp();
        $('#loginbtn').val('正在登录中...')
        $('#loginbtn').attr("disabled", "disabled");
        $.ajax({
            url: urllogin,
            method: 'POST',
            dataType: 'json',
            data: {
                mobileNo: $('#phone').val().toString(),
                valid6Code: $('#vcode').val().toString()
            },
            success: function(res) {
                console.log(res)
                $('#loginbtn').val('登录')
                $('#loginbtn').removeAttr("disabled");
                if (res.result) {
                    $('.prompt').slideUp();
                    layer.close(loginmodel);
                    sessionStorage.setItem("validToken", res.validToken);
                    sessionStorage.setItem("userName", res.userName);
                    sessionStorage.setItem("userXh", res.userXh);


                    onload()
                    var myorderdataflag = sessionStorage.getItem('myorderdataflag')
                    if(myorderdataflag){
                          sessionStorage.removeItem("myorderdataflag");  
                          window.location.reload();
                    }
                } else {
                    $('.prompt').slideDown();
                    $('.prompt').html(res.resp_msg)
                }
            }
        });
     
    })

        

}
//登录状态
function onload() {
    var loginStorage = sessionStorage.getItem("userName");
    
    console.log(loginStorage)

    if (loginStorage) {
        try {
            if (typeof(eval(defaultfn)) == "function" && $('#fromphone').val() == '') {
                defaultfn();
            }
        } catch (e) {

        }

        $('#loginuser').html(loginStorage)
    }
    

}