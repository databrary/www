// clean dbjs namespace
var dbjs = {};

/**
 * Creates folding content.
 * @param region     container element
 * @param clicker    click toggle, child of fold
 * @param toggle     toggled area, child of fold
 */
dbjs.fold = function (region, clicker, toggle) {
	var $region = $(region),
		$clicker = $region.find(clicker),
		$toggles = $region.find(toggle);

	$clicker.click(function () {
		var $this = $(this);

		$this.closest(region).find(toggle).slideToggle();
		$this.toggleClass('unfolded');
	});

	$clicker.prepend('<span class="arrow"></span>');
	$toggles.toggle();
};

/**
 * Creates fading carousel content.
 * @param region    containing element
 * @param panel     panel elements
 */
dbjs.carousel = function (region, panel) {
	var $region = $(region),
		fadeSpeed = 1000,
		waitSpeed = 5000;

	var resize = function () {
		$region.css({
			'height': ($region.outerWidth() * 9 / 16)+'px'
		});
	};

	$(window).resize(function () {
		resize();
	});

	var interval = setInterval(function () {
		$region.find(panel + ":last-child").fadeOut(fadeSpeed, function () {
			$(this).prependTo($region.find('.panels')).fadeIn(fadeSpeed);
		});
	}, waitSpeed);
};

$(document).ready(function () {
	dbjs.fold('.question', 'h2', 'div');
	dbjs.carousel('.carousel', '.panel');
});
