$(document).ready(function() {
	$('.imgslider').bxSlider({
		mode : 'fade',
		captions : true,
		touchEnabled : false,
		auto : true,
		pager : false,
		speed : 2000,
		controls : false
	});
	$('.videoslider').bxSlider({
		touchEnabled : false
	});
	var topEle = $('#topBtn');
	var delay = 1000;
	topEle.on('click', function() {
		$('html,body').stop().animate({
			scrollTop : 0
		}, delay);
	});
});