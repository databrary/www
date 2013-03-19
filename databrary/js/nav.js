/*
 * File: js/nav.js
 * Author: Gladys Chan
 * Description: toggle dropdown items in navigation bar
 */

$("body").ready(function() {
    $(".main-nav-item").hover(function() {
        var sub_nav = $(this).find(".sub-nav");
        var parent_width = $(this).width();
        
        $(this).css("background-color", "#72CF83");
        sub_nav.width(parent_width - 2);             // 2 = border
        sub_nav.find("li").width(parent_width - 22); // 22 = padding + border
        sub_nav.css("z-index", "10");
        sub_nav.css("display","block");
    });

    $(".main-nav-item").mouseleave(function() {
        if ($(this).hasClass("current")) {
			/* Colors defined in css/main.css */
            if ($(this).is("#about"))
                $(this).css("background-color", "#95CF72");
	    else if ($(this).is("#community"))
                $(this).css("background-color", "#95CF72");
            else if ($(this).is("#faq"))
                $(this).css("background-color", "#95CF72");
            else if ($(this).is("#development"))
                $(this).css("background-color", "#95CF72");
        }
        else
            $(this).css("background-color", "#FFF");
	    
		$(this).find(".sub-nav").css("display","none");
    });
});

