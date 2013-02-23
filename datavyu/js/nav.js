/*
 * File: js/nav.js
 * Author: Gladys Chan
 * Description: toggle dropdown items in navigation bar
 */

$("body").ready(function() {
    $(".main-nav-item").hover(function() {
        var sub_nav = $(this).find(".sub-nav");
        var parent_width = $(this).width();
        
        $(this).css("background-color", "#FC3");
        sub_nav.width(parent_width - 2);             // 2 = border
        sub_nav.find("li").width(parent_width - 22); // 22 = padding + border
        sub_nav.css("z-index", "10");
        sub_nav.slideToggle();
    });

    $(".main-nav-item").mouseleave(function() {
        if ($(this).hasClass("current")) {
			/* Colors defined in css/main.css */
            if ($(this).is("#download"))
                $(this).css("background-color", "#92e6ec");
            else if ($(this).is("#features"))
                $(this).css("background-color", "#92e6ec");
            else if ($(this).is("#support"))
                $(this).css("background-color", "#92e6ec");
            else if ($(this).is("#developer"))
                $(this).css("background-color", "#92e6ec");
            else if ($(this).is("#blog"))
                $(this).css("background-color", "#92e6ec");
        }
        else
            $(this).css("background-color", "#FFF");
    });
});
