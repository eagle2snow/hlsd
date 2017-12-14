//点击logo返回首页
$('.logo').on('click', function() {
    window.location = "index.jsp"
})

 var map, geolocation;
    //加载地图，调用浏览器定位服务
    map = new AMap.Map('hlsd-container', {
        resizeEnable: true,
        zoom: 10,
    });

function indexmap() {

    /***************************************
    由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
    ***************************************/
   

    map.plugin('AMap.Geolocation', function() {
        geolocation = new AMap.Geolocation({
            enableHighAccuracy: true, //是否使用高精度定位，默认:true
            timeout: 10000, //超过10秒后停止定位，默认：无穷大
            buttonOffset: new AMap.Pixel(10, 20), //定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            zoomToAccuracy: true, //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
            buttonPosition: 'RB'
        });
        map.addControl(geolocation);
        geolocation.getCurrentPosition();
        AMap.event.addListener(geolocation, 'complete', onComplete); //返回定位信息
        AMap.event.addListener(geolocation, 'error', onError); //返回定位出错信息
    });
    //解析定位结果
    function onComplete(data) {
        console.log(data)
        $('#city-address').html(data.addressComponent.city)
        $('#modelcity').html(data.addressComponent.city)
        sessionStorage.setItem("cityname", data.addressComponent.city);
    }
    //解析定位错误信息
    function onError(data) {
        console.log(data)
    }

    AMap.plugin(['AMap.Geocoder', 'AMap.PlaceSearch', 'AMap.Autocomplete'], function() {
        var geocoder = new AMap.Geocoder({
            city: "010" //城市，默认：“全国”
        });

    });

}

 var cityname= sessionStorage.getItem("cityname");
 if(!cityname){
 	indexmap() 
 }else{
 	$('#city-address').html(cityname)
    $('#modelcity').html(cityname)
 }

//城市选择
var index;
$('#select-city').on('click', function() {
    index = layer.open({
        title: ['请选择你所在的城市', 'background:#44c2f1;color:#fff'],
        area: ['700px', '500px'],
        content: $('#city'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
        type: 1
    });

})
$('.cityName').on('click', function() {
    console.log($(this)[0].innerHTML)
    $('#city-address').html($(this)[0].innerHTML)
    sessionStorage.setItem("cityname",$(this)[0].innerHTML);
    layer.close(index)
})