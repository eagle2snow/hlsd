//同城，跨城，我的
			
		    $("#tabul").mouseout(function(){
				onlead(temp)
			});
			function onlead(temp){
				var imgarr=document.getElementsByClassName('imgbtn')
				imgarr[0].src='img/ordernav/tongcheng_.png'
				imgarr[1].src='img/ordernav/kuacheng.png'
				imgarr[2].src='img/ordernav/wode.png'
				imgarr[3].src='img/ordernav/jiage.png'
				$('#tabul span')[0].style.color="#212632"
				$('#tabul span')[1].style.color="#212632"
				$('#tabul span')[2].style.color="#212632"
				$('#tabul span')[3].style.color="#212632"
				switch(temp){
					case 0:
					  imgarr[0].src='img/ordernav/tongcheng.png'
					  $('#tabul span')[0].style.color="#44C2F1"
					  break;
					case 1:
					  imgarr[1].src='img/ordernav/kuacheng_.png'
					   $('#tabul span')[1].style.color="#44C2F1"
					  break;
					case 2:
					 imgarr[2].src='img/ordernav/wode_.png'
					  $('#tabul span')[2].style.color="#44C2F1"
					  break;
					case 3:
					 imgarr[3].src='img/ordernav/jiage_.png'
					  $('#tabul span')[3].style.color="#44C2F1"
					  break;
					default:
					  console.log('123')
					}
			}
			$('#tabul').on('mouseover','a',function(e){
				
				onlead(temp)
				console.log(this.getAttribute('href'))
				if(this.getAttribute('href')=='intracity.jsp'){
					this.getElementsByTagName("img")[0].src="img/ordernav/tongcheng.png" 
					this.getElementsByTagName("span")[0].style.color="#44C2F1"
				}
				else if(this.getAttribute('href')=='crosscity.jsp'){
					this.getElementsByTagName("img")[0].src="img/ordernav/kuacheng_.png" 
					this.getElementsByTagName("span")[0].style.color="#44C2F1"
				}
				else if(this.getAttribute('href')=='myorder.jsp'){
					this.getElementsByTagName("img")[0].src="img/ordernav/wode_.png" 
					this.getElementsByTagName("span")[0].style.color="#44C2F1"
				}
				else{
					this.getElementsByTagName("img")[0].src="img/ordernav/jiage_.png" 
					this.getElementsByTagName("span")[0].style.color="#44C2F1"
				}
				
			})