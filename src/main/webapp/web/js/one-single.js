//表单验证
$('.tc-order .require').on('blur', function() {
	if ($(this).val() == '') {
		$(this).addClass('input-warn')
	} else {
		$(this).removeClass('input-warn')
	}
})
$('.tc-order .re-phone').on('blur', function() {
	 var myreg = /^1[0-9]{10}$/;
    if (!myreg.test($(this).val() )) {
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
$('#other-text-id').blur(function(){
			$('#other').attr("data-id",filterXSS($('#other-text-id').val()))
		})
	//其它表单框othet-time
$('#other-time').on('click', function() {
		$('.other-time-text').show()
	})
	//常用按钮
$('.address-btn').on('click', function() {
	$(this).parent().next().toggle();
})
    //12313
$('.address-btn-close').on('click',function(){
    $(this).parent().toggle();
})
// 以上是表单交互

var orderpayObj={}
var orderpriceObj = {}
var orderhtml = ''
var pircedata1={}
var pircedata2={}
var orderto1={}
var orderto2={}
//一单提交订单
function onesingleorder() {
	
	orderto1 = {
		'orderDetailList[0].consigneeName': filterXSS($('#toname').val()),
		'orderDetailList[0].consigneePhone': filterXSS($('#tophone').val()),
		'orderDetailList[0].goodsName': $('.select5 .type-active').attr("data-id"),
		'orderDetailList[0].goodsWeight': $('.select6 .type-active').attr("data-id"),
		'orderDetailList[0].goodsVolume': $('.select7 .type-active').attr("data-id"),
		'orderDetailList[0].lng': $('#to-address').attr("data-lng"),
		'orderDetailList[0].lat': $('#to-address').attr("data-lat"),
		'orderDetailList[0].consigneeDetailAddress': $('#to-address').val() + filterXSS($('#tonum').val())
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
		'priceList[0].goodsName':$('.select5 .type-active').attr("data-id"),
	}
	console.log(pircedata1)
	orderpriceObj = $.extend({}, pircedata1, md5KeyObj, loginObj);
	orderpayObj= $.extend({}, orderto1, orderObjfrom,md5KeyObj, loginObj);
	sumprice(orderpriceObj)

}
//两单
function twosingleorder(){
		
	  orderto2 = {
            'orderDetailList[1].consigneeName': $('#toname').val(),
            'orderDetailList[1].consigneePhone': $('#tophone').val(),
            'orderDetailList[1].goodsName': $('.select5 .type-active').attr("data-id"),
            'orderDetailList[1].goodsWeight': $('.select6 .type-active').attr("data-id"),
            'orderDetailList[1].goodsVolume': $('.select7 .type-active').attr("data-id"),
            'orderDetailList[1].lng': $('#to-address').attr("data-lng"),
            'orderDetailList[1].lat': $('#to-address').attr("data-lat"),
            'orderDetailList[1].consigneeDetailAddress': $('#to-address').val() + $('#tonum').val()
        }
        pircedata2 = {
            'priceList[1].to_lng': $('#to-address').attr("data-lng"),
            'priceList[1].to_lat': $('#to-address').attr("data-lat"),
            'priceList[1].weight': $('.select6 .type-active').attr("data-id"),
            'priceList[1].goodsVolume': $('.select7 .type-active').attr("data-id"),
        }
	console.log(pircedata2)
	orderpriceObj = $.extend({},pircedata2, pircedata1, md5KeyObj, loginObj);
	orderpayObj= $.extend({},orderto1,orderto2, orderObjfrom,md5KeyObj, loginObj);
	sumprice(orderpriceObj)
}


//计算价格
function sumprice(priceObj) {
	console.log(JSON.stringify(priceObj))
	$.ajax({
		url: urlprice,
		method: 'POST',
		data: priceObj,
		dataType: 'json',
		success: function(res) {
			 $('.add-order a').html('确认订单')
  			 $('.add-order a').attr("disabled", "");
			if (res.result) {
				orderhtmlfn()
				$('#total').html(res.fee)
				$('#distance').html('里程数:' + res.distance +'公里')
				$('#serviceCharge').html('服务费:' + res.serviceCharge + '元')
				$('#startPrice').html('起步价:' + res.startPrice + '元')
				discountsum()
				$('.tc-to').hide()
				
				orderflag=2
				// swal("", res.resp_msg, "success")
			} else {
				
				swal({ 
				  title: "互联速递",
				  text: res.resp_msg, 
				  html: true 
				},function(){
					openlogin()
        			return false;
				});
			}
		}
	})
}

//添加html
function orderhtmlfn() {
	orderhtml = ''
	orderhtml += '<div class="order-detail tc-hover" style="padding-left: 0;width: 1200px;"><div class="order-title">'
	orderhtml += '<label for="" style="padding-left: 60px;">订单详细</label><div class="del-edit-btn"></div></div>'
	orderhtml += '<div class="order-content">'
	orderhtml += "<p>收货地址：" + filterXSS($('#to-address').val()) + filterXSS($('#tonum').val()) + "</p>"
	orderhtml += "<p><span>收货人：" + filterXSS($('#toname').val()) + "</span> <span>电话：" + filterXSS($('#tophone').val()) + "</span> </p>"
	orderhtml += "<p><span>物品类型：" + $('.select5 .type-active').attr("data-id") + "</span> <span>物品重量：" + $('.select6 .type-active').html() + "</span> </p>"
	orderhtml += "<p><span>物品体积：" + $('.select7 .type-active').html() + "</span> </p></div></div>"
//<a  onclick='ordertwo()'  class='add-order-btn' href='javascript:void(0)'>添加拼单地址+</a> <a href="">编辑</a><a href="">删除</a>
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
	ordertwo()

}
//第二单
function ordertwo() {
	if (orderflag==0) {
		$('.add-order-btn').hide()
	}else{
		$('.add-order-btn').on('click', function() {
		$('.tc-to').show()
		console.log(0)
		})
	}
	
}