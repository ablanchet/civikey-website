﻿$(function () {
    var elemsTab = ["leprojet", "aide", "acteurs"];
    var notActivElem = [1, 2, 0];

    $('.project-menuelem').click(function () {
        clickedElem = $(this);
        changeContent(clickedElem);

    });

    function changeContent(clickedElem) {
        console.log(notActivElem);
        if (changeActiveElem(clickedElem)) {
            detectNotActivElem(clickedElem);
            $('.project-slide' + notActivElem[0]).fadeOut(function () {
                $('.project-slide' + notActivElem[1]).fadeOut(function () {
                    $('.project-slide' + notActivElem[2]).fadeIn();
                });
            });
        }
    }

    function detectNotActivElem(activeElem) {
        var j = 0;
        for (var i = 0; i < elemsTab.length; i++) {
            if (clickedElem.attr('id') != elemsTab[i]) {
                notActivElem[j] = i;
                j++;
            } else {
                notActivElem[notActivElem.length - 1] = i;
            }
        }
    }

    function changeActiveElem(clickedElem) {

        if (!clickedElem.hasClass('active')) {
            $('.project-menuelem').removeClass('active');
            $('.project-menuelem').addClass('inactive');
            clickedElem.removeClass('inactive');
            clickedElem.addClass('active');
            return true;
        } else {
            return false;
        }
    }
});