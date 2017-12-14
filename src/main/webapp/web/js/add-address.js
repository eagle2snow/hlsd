  //订单地图显示
  var mapobj = {
      address: '',
      addressname: '',
      that: ''
  };

  var map;
  //点击定位
  $('.address-add').on('click', function() {
      mapobj.that = $(this).prev().eq(0)
      console.log($(this).prev().eq(0).attr('name'))
       mapobj.name=$(this).prev().eq(0).attr('name')
      addaddress($(this).prev().eq(0).attr('name'))
  })
  //点击input框
  $('.input-address').on('focus', function() {
      mapobj.that = $(this)
       mapobj.name=$(this).attr('name')
      console.log($(this).attr('name'))
      addaddress($(this).attr('name'))
  })


  function addaddress(addressflag) {
      var cityname = sessionStorage.getItem("cityname");
      mapobj.address = layer.open({
          title: ['请选择地址', 'background:#44c2f1;color:#fff'],
          anim: 1,
          area: ['1000px', '650px'],
          type: 1,
          content: $('#map') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
      });

      map = new AMap.Map("select-address", {
          resizeEnable: true
      });

      AMapUI.loadUI(['misc/PoiPicker'], function(PoiPicker) {

          var poiPicker = new PoiPicker({
              city: cityname,
              citylimit: true,
              input: 'tipinput'
          });
          //初始化poiPicker
          poiPickerReady(poiPicker);
      });



      function poiPickerReady(poiPicker) {

          var auto = new AMap.Autocomplete(poiPicker);
          var placeSearch = new AMap.PlaceSearch({
              pageSize: 5,
              pageIndex: 1,
              city: cityname,
              citylimit: true,
              map: map
          }); //构造地点查询类
          window.poiPicker = poiPicker;

          var marker = new AMap.Marker();

          var infoWindow = new AMap.InfoWindow({
              offset: new AMap.Pixel(0, -20)
          });

          //选取了某个POI
          poiPicker.on('poiPicked', function(poiResult) {

              var source = poiResult.source,
                  poi = poiResult.item,
                  info = {
                      source: source,
                      id: poi.id,
                      name: poi.name,
                      location: poi.location.toString(),
                      address: poi.address
                  };
              
              
              sessionStorage.setItem(mapobj.name, poi.adcode);

              marker.setMap(map);
              infoWindow.setMap(map);
              marker.setPosition(poi.location);
              infoWindow.setPosition(poi.location);

              mapobj.addressname = info.name
              var locationArr = info.location.split(",")
              mapobj.lng = locationArr[0]
              mapobj.lat = locationArr[1]
              mapobj.that.val(mapobj.addressname)
              mapobj.that.attr('data-lng', mapobj.lng)
              mapobj.that.attr('data-lat', mapobj.lat)

              $('#tipinput').val(info.name)
              var html = "layer.close(mapobj.address);$('#tipinput').val('')"
              infoWindow.setContent('<div  style="cursor:pointer">' + info.name + '<button id="add-address"  class="myButton" onclick="' + html + '" >使用该地址</button></div> ');

              function close() {}
              infoWindow.open(map, marker.getPosition());
          });
          // poiPicker.onCityReady(function() {
          //     poiPicker.suggest('互联速递');
          // });
      }

  }