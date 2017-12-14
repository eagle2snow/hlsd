var loginObj = {}
var orderflag = 1
var orderObjfrom = {}

//点击确认收货信息
$('.add-order').on('click', function() {
    addtoinfo(function() {
        checklogin(function() {
              adddiscount(function() {
                $('.add-order a').html('正在计算价格...')
                $('.add-order a').attr("disabled", "disabled");
                frominfo(function(){
                   if (orderflag == 1) {
                    onesingleorder()
                } else {
                    twosingleorder()
                    orderflag = 0
                }
  
                })
               
            })

        })

    })


})

function addtoinfo(callback) {
    var fromaddress=sessionStorage.getItem('fromaddress').substring(0,4)
    var toaddress=sessionStorage.getItem('toaddress').substring(0,4)
    console.log(fromaddress.substring(0,4))
    console.log(toaddress)
    if(fromaddress!=toaddress){
        swal("", "寄货地址与收货地址不在同一城市，请重新填写", "warning")
        return false;
    }
    var myreg = /^1[0-9]{10}$/;
    //寄货人验证
    if ($('#from-address').val() == '' || $('#from-address').attr("data-lng") == '' || $('#from-address').attr("data-lat") == '' || $('#fromnum').val() == '') {
        swal("", "请正确填写寄货人货人地址", "warning")
        return false;
    }
    if ($('#fromname').val() == '') {
        swal("", "请正确填写寄货人货人姓名", "warning")
        return false;
    }
    console.log(!myreg.test($('#fromphone').val()))
    if ($('#fromphone').val() == '' || !myreg.test($('#fromphone').val())) {
        swal("", "请正确填写寄货人电话号码", "warning")
        return false;
    }

    if ($('.select1').children(".type-active").length == 0) {
        swal("", "请选择配送方式", "warning")
        return false;
    }


    if ($('.select2').children(".type-active").length == 0) {
        swal("", "请选择取货时间", "warning")
        return false;
    }
    if ($('.select3').children(".type-active").length == 0) {
        swal("", "请选择是否上门取货", "warning")
        return false;
    }
    if ($('.select4').children(".type-active").length == 0) {
        swal("", "请选择付款方式", "warning")
        return false;
    }


    //收货人验证   
    if ($('#to-address').val() == '' || $('#to-address').attr("data-lng") == '' || $('#to-address').attr("data-lat") == '' || $('#tonum').val() == '') {
        swal("", "请正确填写收货人地址", "warning")
        return false;
    }
    if ($('#toname').val() == '') {
        swal("", "请正确填写收货人姓名", "warning")
        return false;
    }
    if ($('#tophone').val() == '' || !myreg.test($('#tophone').val())) {
        swal("", "请正确填写收货人电话号码", "warning")
        return false;
    }
    if ($('.select5').children(".type-active").length == 0) {
        swal("", "请选择填写物品类型", "warning")
        return false;
    }


    if ($('.select6').children(".type-active").length == 0) {
        swal("", "请选择填写物品重量", "warning")
        return false;
    }
    if ($('.select7').children(".type-active").length == 0) {
        swal("", "请选择物品体积", "warning")
        return false;
    }
    //异步回调
    callback()
}
//点击提交订单
$('#pay').on('click', function() {
    checklogin(function() {
        addtoinfo(function() {
            frominfo(function() {
                if (orderflag == 1) {
                    //一单
                    addorder(orderpayObj)
                    orderflag = 2
                } else {
                    //两单
                    addorder(orderpayObj)
                    orderflag = 0
                }
            })
        })


    })

})



//判断是否登录
function checklogin(cb) {
    var userName = sessionStorage.getItem("userName");
    var validToken = sessionStorage.getItem("validToken");
    var userXh = sessionStorage.getItem('userXh');
    if (userName && validToken) {
        $('#loginuser').html(userName)
        loginObj.userXh = userXh
        loginObj.validToken = validToken
        loginObj.userId = userName
        cb()
    } else {
        openlogin()
        return false;
    }

}



//寄货人信息
function frominfo(cb) {
    
    orderObjfrom.sendDetailAddress = $('#from-address').val() + filterXSS($('#fromnum').val())
    orderObjfrom.senderPhone = filterXSS($('#fromphone').val())
    orderObjfrom.senderName = filterXSS($('#fromname').val())
    orderObjfrom.lng = $('#from-address').attr("data-lng")
    orderObjfrom.lat = $('#from-address').attr("data-lat")
    orderObjfrom.expressType = $('.select1 .type-active').attr("data_id")
    orderObjfrom.orderType = $('.select2 .type-active').attr("data_id")
    orderObjfrom.appointmentTime = $('#hello3').html()
    orderObjfrom.pickUp = $('.select3 .type-active').attr("data_id")
    orderObjfrom.donationType = $('.select4 .type-active').html()
    orderObjfrom.orderCityType = '1'
    orderObjfrom.couponXh = $('.youhui').children('option:selected').val()
    cb()

}

//提交订单到服务器
function addorder(orderObj) {
    $('#pay').val('正在提交订单...')
    $('#pay').attr("disabled", "disabled");
    $.ajax({
        url: urlorder,
        method: 'POST',
        data: orderObj,
        dataType: 'json',
        success: function(res) {
            $('#pay').val('确认支付')
            $('#pay').removeAttr("disabled");
            if (res.result) {
                sessionStorage.setItem("orderId", res.orderId);
                // addpay(res.orderId)
                addressData()
                addressDatato()
                swal({
                        title: "互联速递",
                        text: res.resp_msg,
                        html: true
                    },
                    function() {
                        window.location = "myorder.jsp"
                    });
            } else {
                swal("", res.resp_msg, "error")
            }
        }
    })
}
//发货人保存常用地址
var cyObjArrset=[]
var cyObjArr=JSON.parse(localStorage.getItem('cyObjArrset'))
var cyhtml=''
if (cyObjArr) {
    cyObjArrset=cyObjArr
    for (var i =cyObjArr.length- 1; i >= 0; i--) {
         cyhtml+='<p data-id="'+i+'"><a href="###">'+cyObjArr[i].sendDetailAddress+'</a> <span>使用该地址</span></p>'      
    }
    $('.common-box-list').append(cyhtml)
}


$('.common-box-list p').on('click',function(){
    var obj=cyObjArr[$(this).attr('data-id')]
    console.log(obj)
    $('#from-address').val(obj.fromaddress)
    $('#fromnum').val(obj.fromnum)
    $('#fromphone').val(obj.senderPhone)
    $('#fromname').val(obj.senderName)
    $('#from-address').attr("data-lng",obj.lng)
    $('#from-address').attr("data-lat",obj.lat)
    $(this).parent().parent().toggle();

})
function addressData(){
    frominfo(function(){
    if ($('#cybox').is(':checked')) {
        if (cyObjArrset.length==5) {
            cyObjArrset.shift()
        }
        var cyobj=orderObjfrom
        cyobj.fromaddress=$('#from-address').val()
        cyobj.fromnum=$('#fromnum').val()
        cyObjArrset.push(cyobj)
       localStorage.setItem("cyObjArrset",JSON.stringify(cyObjArrset));
    } 
    })
    
}
//收货人保存常用地址
var cyObjArrsetto=[]
var cyObjArrto=JSON.parse(localStorage.getItem('cyObjArrsetto'))
var cyhtml=''
if (cyObjArrto) {
    cyObjArrsetto=cyObjArrto

    for (var i =cyObjArrto.length- 1; i >= 0; i--) {
        console.log(cyObjArrto[i].toaddress)
         cyhtml+='<p data-id="'+i+'"><a href="###">'+cyObjArrto[i].toaddress+cyObjArrto[i].tonum+'</a> <span>使用该地址</span></p>'      
    }
    $('.common-box-list-to').append(cyhtml)
}


$('.common-box-list-to p').on('click',function(){
    var obj=cyObjArrto[$(this).attr('data-id')]
    console.log(obj)
    $('#to-address').val(obj.toaddress)
    $('#tonum').val(obj.tonum)
    $('#tophone').val(obj.tophone)
    $('#toname').val(obj.toname)
    $('#to-address').attr("data-lng",obj.lng)
    $('#to-address').attr("data-lat",obj.lat)
    $(this).parent().parent().toggle();

})
function addressDatato(){
    console.log($('#cyboxto').is(':checked'))
    if ($('#cyboxto').is(':checked')) {
        if (cyObjArrsetto.length==5) {
            cyObjArrsetto.shift()
        }
        var cyobj={}
        cyobj.toaddress=$('#to-address').val()
        cyobj.tonum=$('#tonum').val()
        cyobj.toname=$('#toname').val()
        cyobj.tophone=$('#tophone').val()
        cyobj.lng=$('#to-address').attr("data-lng")
        cyobj.lat=$('#to-address').attr("data-lat")
        cyObjArrsetto.push(cyobj)
       localStorage.setItem("cyObjArrsetto",JSON.stringify(cyObjArrsetto));
    } 
}
//支付
function addpay(orderId) {
    var userId = sessionStorage.getItem("userName");
    swal({
            title: "请使用微信扫码支付",
            text: '<img src="" id="Payewm" />',
            html: true
        },
        function() {
            window.location = "myorder.jsp"
        });
    var url = urlpay + '?userId=' + userId + '&orderId=' + orderId;
    $("#Payewm").attr("src", url);
}