/*
 * File: js/slideshow.js
 * Author: Gladys Chan
 * Description: initialize slideshow
 */

$(function(){
    $("#slides").slides({
        generatePagination: true,
        play: 5000,
        pause: 2500,
        hoverPause: true
    });
});
