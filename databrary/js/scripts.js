// clean dbjs namespace
var dbjs = {};

// setup site features
(function () {
    var isTouch = 'ontouchstart' in document.documentElement;

    dbjs.toggleFold = function (fold, folder, folded) {
        var $folders = $(fold + ' ' + folder),
            $foldeds = $(fold + ' ' + folded);

        $folders.click(function (e) {
            $(this).next(folded).slideToggle();
            $(this).toggleClass('unfolded');
        });

        $folders.prepend('<span class="arrow"></span>')
        $foldeds.toggle();
    }
}());

// initialization
$(document).ready(function () {
    // from the new site...
    dbjs.toggleFold('.question', 'h2', 'div');

    // specifically for the old site...
    var $headerLi = $("#header nav > ul > li");

    $headerLi.each(function () {
        $(this).find("> ul").width($(this).find("> a").outerWidth() - 2);
    });
});