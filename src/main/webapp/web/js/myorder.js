//判断是否登录



function checklogin(cb) {
    var userName = sessionStorage.getItem("userName");
    var validToken = sessionStorage.getItem("validToken");
    if (userName) {
        $('#loginuser').html(userName)
        myorderObj.validToken = validToken
        myorderObj.userId = userName
        cb()
    } else {
        sessionStorage.setItem("myorderdataflag", '1');
        openlogin()
    }

}
var resmyorder = {}
var pagefalg = 1
//我的订单
myorder(currentPage, tabDom, apiStatus)

function myorder(currentPage, tabDom, apiStatus) {
    checklogin(function() {
        myorderObj.currentPage = currentPage
        myorderObj.showCount = '3'
        myorderObj.apiStatus = apiStatus
        var  pageCount=1
        $.ajax({
            url: urlObj.myorder,
            method: 'POST',
            data: myorderObj,
            dataType: 'json',
            success: function(res) {
                console.log(res)
                resmyorder = res
                if (res.result) {
                    pageCount=res.totalPage
                    console.log(res)
                    if (tabDom == 'tab1') {
                        $('#sumordertab1').html('[' + res.totalResult + ']')
                    }
                    // $('#sumordertab6').html('[' + res.orderTypeCount.DFH_COUNT+ ']')
                    $('#sumordertab2').html('[' + res.orderTypeCount.DQH_COUNT + ']')
                    $('#sumordertab3').html('[' + res.orderTypeCount.JXZ_COUNT + ']')
                    $('#sumordertab4').html('[' + res.orderTypeCount.YGQ_COUNT + ']')
                    $('#sumordertab5').html('[' + res.orderTypeCount.DPJ_COUNT + ']')
                    myorderdata(res, tabDom)
                } else {
                    // sessionStorage.setItem("myorderdataflag", '1');
                    openlogin()
                }
                pagefn(currentPage,pageCount)
            }
        })
    })
}

function pagefn(currentPage,pageCount) {
    if (pageCount==0) {
        pageCount=1
    }
    $('.M-box3').pagination({
        pageCount: pageCount,
        jump: true,
        current: currentPage,
        coping: true,
        homePage: '首页',
        endPage: '末页',
        prevContent: '上页',
        nextContent: '下页',
        callback: function(api) {
            myorder(api.getCurrent(), tabDom, apiStatus)
        }
    });
}




function myorderdata(res, tabDom) {
    $('.myorder-content').html('')
    var myorderhtml = ''
    for (var i = 0; i < res.datas.length; i++) {
        var orderid = res.datas[i].ORDERID.toString()
        myorderhtml += '<div class="order-box"><div class="order-title"><div class="order-title-box">'
        myorderhtml += '<div class="order-title-img"> </div>'
        myorderhtml += '<div class="order-title-text"><ul>'
        myorderhtml += '<li><span>订单号：' + res.datas[i].ORDERID + '</span><span>配送员姓名 ：' + res.datas[i].REALNAME + '</span><span>订单状态：' + res.datas[i].STATUNAME + '</span><span>配送员电话：' + res.datas[i].MOBILENO + '</span></li>'
        myorderhtml += '<li><span>下单时间：' + res.datas[i].ORDERTIME + '</span><span>里程数：' + res.datas[i].ORDERMILEAGE + '公里</span></li>'
        myorderhtml += '<li style="margin-top: 15px;">发货人：' + res.datas[i].SENDERNAME + '，15279182512</li>'
        myorderhtml += '<li>' + res.datas[i].SENDDETAILADDRESS + '</li>'
        myorderhtml += '<li style="margin-top: 5px;"><p>收货人：' + res.datas[i].orderDetailList[0].CONSIGNEENAME + ' ，' + res.datas[i].orderDetailList[0].CONSIGNEEPHONE + '</p>'
        myorderhtml += '<p>' + res.datas[i].orderDetailList[0].CONSIGNEEDETAILADDRESS + ' </p>'
        myorderhtml += '<p>物品：' + res.datas[i].orderDetailList[0].GOODSNAME + '</p></li></ul></div> <div class="order-title-price"> <p>￥' + res.datas[i].ORDERPRICE + '</p></div></div>'
        myorderhtml += '</div><div class="order-btn"><a class="display display' + res.datas[i].PAYSTATUS + ' qzf" data-status='+ res.datas[i].STATUS+' onclick="addpay(\'' + orderid + '\') " href="###">去支付</a><a class="display qrfh " onclick="addallpay(\'' + orderid + '\') " href="###" data-status='+ res.datas[i].STATUS+' data-id="' + res.datas[i].DONATIONTYPE + '">确认发货</a></div></div>'
    }
    $('#' + tabDom).html(myorderhtml)
    for (var i = 0; i <3; i++) {
        $('.qzf').eq(i).hide()
        if ($('.qrfh').eq(i).attr('data-id') == '到付') {
            if($('.qrfh').eq(i).attr('data-status')== '3'){
                  $('.qrfh').eq(i).show()
            }
        }else{
            if($('.qzf').eq(i).attr('data-status')== '3'){
                  $('.qzf').eq(i).show()
            }
        }
    }


}

//到付
function addallpay(orderId) {
    var userId = sessionStorage.getItem("userName");
    var validToken = sessionStorage.getItem('validToken')
    var data = $.extend({}, {
        userId: userId,
        validToken: validToken,
        orderId: orderId
    }, md5KeyObj)
    swal({
            title: "确定到付吗？",
            text: "此订单将由收货人付款！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定到付！",
            closeOnConfirm: false
        },
        function() {
            $.ajax({
                url: urlseed,
                method: 'POST',
                dataType: 'json',
                data: data,
                success: function(res) {
                    console.log(res)
                    if (res.result) {
                        swal("成功", res.resp_msg, "success");
                    } else {
                        swal("错误！", res.resp_msg, "warning");
                    }
                }
            })
        });

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
//确认发货