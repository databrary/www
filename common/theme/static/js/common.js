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
			'height': ($region.outerWidth() * 9 / 16) + 'px'
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

/**
 * Does smart stuff with anchor scrolling...
 */
dbjs.anchorScroll = function () {
	var offset = 50;

	var scrollToAnchor = function (anchor) {
		var $anchor = $(anchor);

		if($anchor.length == 0)
			return;

		$("html, body").scrollTop($anchor.position().top - offset).animate({
			scrollTop: $anchor.position().top - offset
		}, 'slow');

		$('[id]').each(function () {
			var $this = $(this);

			if($this.attr('id') == anchor.substr(1))
				$this.addClass('target');
			else
				$this.removeClass('target');
		});
	};

	$('a').bind('click', function (e) {
		var sHref = this.href.split("#");

		if (document.location.href.indexOf(sHref[0]) == 0 && sHref[1]) {
			scrollToAnchor("#" + sHref[1]);
			window.history.pushState(null, null, this.href);

			e.preventDefault();
			return false;
		}
	});

	scrollToAnchor(document.location.hash);
};

$(document).ready(function () {
	dbjs.fold('.question', 'h2', 'div');
	dbjs.carousel('.carousel', '.panel');
	dbjs.anchorScroll();
});
