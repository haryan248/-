$(function() {
	var duration = 300;

	var $side = $('#sidebar');
	var $sidebt = $side.find('button').on('click', function() {
		$side.toggleClass('open');

		if ($side.hasClass('open')) {
			$side.stop(true).animate({
				left : '0px'
			}, duration);
			$sidebt.find('span').text('◀');
		} else {
			$side.stop(true).animate({
				left : '-300px'
			}, duration);
			$sidebt.find('span').text('▶');
		}
		;
	});
});