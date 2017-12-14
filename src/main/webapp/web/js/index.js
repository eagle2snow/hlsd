
//动画效果
$('.bb-hlsd').addClass('animated rollIn')
$('.bb-hlsd').addClass('animated rollIn')
var userflag = 1;
var adminflag = 1;
$(window).scroll(function(event) {
	var winPos = $(window).scrollTop();
	console.log(winPos)
	if(winPos >= 600 && winPos <= 700) {
		$('.content-intro h2').addClass('animated bounceInDown');
		$('.content-intro p').addClass('animated bounceIn');
	} else {
		$('.content-intro h2').removeClass('bounceInDown');
		$('.content-intro p').removeClass('bounceIn');
	}
	//车主
	if(winPos >= 1200 && winPos <= 1300 && userflag == 1) {
		$('#userapp').addClass('animated rotateInDownLeft');
		$('.user-download').addClass('animated bounceInRight');
		return false;
	} else {
		$('#userapp').removeClass('rotateInDownLeft');
		$('.user-download').removeClass('bounceInRight');
	}
	//司机
	if(winPos >= 2000 && winPos <= 2100 && adminflag == 1) {
		$('#adminapp').addClass('animated rotateInDownRight');
		$('.admin-download').addClass('animated bounceInLeft');
	} else {
		$('#adminapp').removeClass('rotateInDownRight');
		$('.admin-download').removeClass('bounceInLeft');
	}
});