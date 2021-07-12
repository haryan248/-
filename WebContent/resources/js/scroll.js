$(function() {
	$('.menu-title').each(function() {
		if ($(this).next('div').length > 0) {
			$(this).on('click', function() {
				if ($(this).next('div').css('display') === 'none') {
					$('.inner-menu-box').slideUp();
					$(this).next().stop().slideDown();
				} else {
					$(this).next().stop().slideUp();
				}
				return false;
			});
		}
	});
});
$(window).scroll(function() {
	var $el = $('.show-on-scroll');

	if ($(this).scrollTop() >= 10)
		$el.addClass('shown');
	else
		$el.removeClass('shown');
});