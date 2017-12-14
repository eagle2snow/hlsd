//寄货人对象
var orderObjfrom = {}
    //收货人对象
var orderto1 = {}
var orderto2 = {}
    //用户对象
var loginObj = {}
    //添加订单html  
var orderhtml = ''
    //
var addtoinfoflag = 1
//表单验证
$('.tc-order .require').on('blur', function() {
    if ($(this).val() == '') {
        $(this).addClass('input-warn')
    } else {
        $(this).removeClass('input-warn')
    }
})
//点击选择框
radio('.select1 a')
radio('.select2 a')
radio('.select3 a')
radio('.select4 a')
radio('.select5 a')
radio('.select6 a')
radio('.select7 a')
function radio(radiodom) {
    $(radiodom).on('click', function() {
        if (radiodom == '.select5 a') {
            $('.other-text').hide()
        }
        if (radiodom == '.select2 a') {
            $('.other-time-text').hide()
        }
        $(radiodom).removeClass('type-active')
        $(this).addClass('type-active')
    })
}
//其它表单框
$('#other').on('click', function() {
        $('.other-text').show()
    })
    //其它表单框othet-time
$('#other-time').on('click', function() {

        $('.other-time-text').show()
    })
    //常用按钮
$('.address-btn').on('click', function() {
        $(this).parent().next().toggle();
    })

    /**
     *提交订单
     */

//判断是否登录
function checklogin() {
    var userName = sessionStorage.getItem("userName");
    var validToken = sessionStorage.getItem("validToken");
    if (userName) {
        $('#loginuser').html(userName)
        loginObj.validToken = validToken
        loginObj.userId = userName
    } else {
        openlogin()
    }
}
//计算价格
function sumprice() {
    priceObj = $.extend({},pircedata1, pircedata2, md5KeyObj, loginObj);
    console.log(JSON.stringify(priceObj))
    $.ajax({
        url: urlprice,
        method: 'POST',
        data: priceObj,
        dataType: 'json',
        success: function(res) {
            if (res.result) {
                $('#total').html(res.fee)
                $('#distance').html('里程数:' + res.distance '公里')
                $('#serviceCharge').html('服务费:' + res.serviceCharge + '元')
                $('#startPrice').html('起步价:' + res.startPrice + '元')
                sessionStorage.setItem("random6Num", res.random6Num);
                swal("", res.resp_msg, "success")
            } else {
                swal("", res.resp_msg, "error")
            }
        }
    })
}

//添加多个订单
$('#add-order').on('click', function() {

    if (addtoinfoflag == 1) {
        addtoinfo(1)
        addtoinfoflag = 2
    } else if (addtoinfoflag == 2) {
        addtoinfo(2)
        addtoinfoflag = 3
    } else {
        swal("你已经提交两单", "不要再提交了！", "warning")
    }

})


//判断对象是否为空
function checkobj(obj) {
    for (var key in obj) {
        if (!obj[key]) {
            return key;
        }
    }
}


var pircedata1 = {}
var pircedata2 = {}
    //收货人信息
function addtoinfo(temp) {

    //寄货人验证
    if ($('#from-address').val() == '' || $('#from-address').attr("data-lng") == '' || $('#from-address').attr("data-lat") == '' || $('#fromnum').val() == '') {
        swal("", "请正确填写寄货人货人地址", "warning")
        return false;
    }
    if ($('#fromname').val() == '') {
        swal("", "请正确填写寄货人货人姓名", "warning")
        return false;
    }

    if ($('#fromphone').val() == '') {
        swal("", "请正确填写寄货人货人电话号码", "warning")
        return false;
    }
    // var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    // if (!myreg.test($('#fromphone').val()) || !myreg.test($('#tophone').val())) {
    //     swal("", "请正确填写实名认证的11位电话号码", "warning");
    //     return false;
    // }
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
    if ($('#tophone').val() == '') {
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
    discountsum()

    if (temp == 1) {
        orderto1 = {
            'orderDetailList[0].consigneeName': $('#toname').val(),
            'orderDetailList[0].consigneePhone': $('#tophone').val(),
            'orderDetailList[0].goodsName': $('.select5 .type-active').html(),
            'orderDetailList[0].goodsWeight': $('.select6 .type-active').attr("data-id"),
            'orderDetailList[0].goodsVolume': $('.select7 .type-active').attr("data-id"),
            'orderDetailList[0].lng': $('#to-address').attr("data-lng"),
            'orderDetailList[0].lat': $('#to-address').attr("data-lat"),
            'orderDetailList[0].consigneeDetailAddress': $('#to-address').val() + $('#tonum').val()
        }
        pircedata1 = {
            'priceList[0].pickUp': $('.select3 .type-active').attr("data_id"),
            'priceList[0].expressType': $('.select1 .type-active').attr("data_id"),
            'priceList[0].from_lng': $('#from-address').attr("data-lng"),
            'priceList[0].from_lat': $('#from-address').attr("data-lat"),
            'priceList[0].to_lng': $('#to-address').attr("data-lng"),
            'priceList[0].to_lat': $('#to-address').attr("data-lat"),
            'priceList[0].weight': $('.select6 .type-active').attr("data-id"),
            'priceList[0].goodsVolume': $('.select7 .type-active').attr("data-id"),
        }

    } else {
        orderto2 = {
            'orderDetailList[1].consigneeName': $('#toname').val(),
            'orderDetailList[1].consigneePhone': $('#tophone').val(),
            'orderDetailList[1].goodsName': $('.select5 .type-active').html(),
            'orderDetailList[1].goodsWeight': $('.select6 .type-active').attr("data-id"),
            'orderDetailList[1].goodsVolume': $('.select7 .type-active').attr("data-id"),
            'orderDetailList[1].lng': $('#to-address').attr("data-lng"),
            'orderDetailList[1].lat': $('#to-address').attr("data-lat"),
            'orderDetailList[1].consigneeDetailAddress': $('#to-address').val() + $('#tonum').val()
        }
        pircedata2 = {
            'priceList[1].pickUp': $('.select3 .type-active').attr("data_id"),
            'priceList[1].expressType': $('.select1 .type-active').attr("data_id"),
            'priceList[1].from_lng': $('#from-address').attr("data-lng"),
            'priceList[1].from_lat': $('#from-address').attr("data-lat"),
            'priceList[1].to_lng': $('#to-address').attr("data-lng"),
            'priceList[1].to_lat': $('#to-address').attr("data-lat"),
            'priceList[0].weight': $('.select6 .type-active').attr("data-id"),
            'priceList[1].goodsVolume': $('.select7 .type-active').attr("data-id"),
        }
    }
    sumprice()
    orderhtml = ''
    orderhtml += '<div class="order-detail tc-hover" style="padding-left: 0;width: 1200px;"><div class="order-title">'
    orderhtml += '<label for="" style="padding-left: 60px;">订单详细</label><div class="del-edit-btn"></div></div>'
    orderhtml += '<div class="order-content">'
    orderhtml += "<p>收货地址：" + $('#to-address').val() + $('#tonum').val() + "</p>"
    orderhtml += "<p><span>收货人：" + $('#toname').val() + "</span> <span>电话：" + $('#tophone').val() + "</span> </p>"
    orderhtml += "<p><span>物品类型：" + $('.select5 .type-active').html() + "</span> <span>物品重量：" + $('.select6 .type-active').html() + "</span> </p>"
    orderhtml += "<p><span>物品体积：" + $('.select7 .type-active').html() + "</span> </p></div></div>"
    $('.order-all-box').append(orderhtml)
    // $('#toname').val('')
    // $('#tophone').val('')
    // $('.select5 .type-active').removeClass('type-active')
    // $('.select6 .type-active').removeClass('type-active')
    // $('.select7 .type-active').removeClass('type-active')
    // $('#to-address').attr("data-lng", "")
    // $('#to-address').attr("data-lat", "")
    // $('#to-address').val('')
    // $('#tonum').val('')
}



//提交订单
$('#pay').on('click', function() {
    checklogin()
    orderObjfrom.sendDetailAddress = $('#from-address').val() + $('#fromnum').val()
    orderObjfrom.senderPhone = $('#fromphone').val()
    orderObjfrom.senderName = $('#fromname').val()
    orderObjfrom.lng = $('#from-address').attr("data-lng"),
    orderObjfrom.lat = $('#from-address').attr("data-lat"),
    orderObjfrom.expressType = $('.select1 .type-active').attr("data_id")
    orderObjfrom.orderType = $('.select2 .type-active').attr("data_id")
    orderObjfrom.appointmentTime = $('#hello3').html()
    orderObjfrom.pickUp = $('.select3 .type-active').attr("data_id")
    orderObjfrom.donationType = $('.select4 .type-active').html()
    orderObjfrom.orderCityType = '1'
    orderObj = $.extend({},orderto1, orderto2, orderObjfrom, md5KeyObj, loginObj);
   
    if (addtoinfoflag == 1) {
        addtoinfo(1)
        sumprice()
        addorder()
    } else {
        sumprice()
        addorder()
    }

})

//提交订单到服务器
function addorder() {
    console.log(JSON.stringify(orderObj))
    $.ajax({
        url: urlorder,
        method: 'POST',
        data: orderObj,
        dataType: 'json',
        success: function(res) {
            if (res.result) {
                sessionStorage.setItem("orderId", res.orderId);
                addpay(res.orderId)
                
            } else {
                swal("", res.resp_msg, "error")
            }
        }
    })
}
//支付
function addpay(orderId) {
    var random6Num = sessionStorage.getItem("random6Num");
    var userId = sessionStorage.getItem("userName");
    swal({
        title: "请使用微信扫码支付",
        text: '<img src="" id="Payewm" />',
        html: true
    });
    var url = urlpay + '?userId=' + userId + '&random6Num=' + random6Num + '&orderId=' + orderId;
    $("#Payewm").attr("src", url);
}