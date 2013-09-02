﻿$(function () {
    var ContactMap = {
        invLatlng: new google.maps.LatLng(48.857473, 2.384012),
        pfntLatlng: new google.maps.LatLng(48.838488, 2.170841)
    };

    ContactMap.pfntinfowindow = new google.maps.InfoWindow({
        content: "PFNT<br/>104, Bd Raymond Poincaré<br/>92380 Garches"
    });

    ContactMap.invinfowindow = new google.maps.InfoWindow({
        content: "Invenietis</br>10 rue Mercoeur</br>75011"
    });

    ContactMap.myOptions = {
        center: ContactMap.pfntLatlng,
        zoom: 15,
        mapTypeControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    ContactMap.map = new google.maps.Map(document.getElementById("map_canvas"), ContactMap.myOptions);

    ContactMap.invmarker = new google.maps.Marker({
        position: ContactMap.invLatlng,
        title: 'Invenietis',
        zoomControl: true,
        map: ContactMap.map
    });

    ContactMap.pfntmarker = new google.maps.Marker({
        position: ContactMap.pfntLatlng,
        title: 'PFNT',
        zoomControl: true,
        map: ContactMap.map
    });

    google.maps.event.addListener(ContactMap.invmarker, 'click', (function (marker) {
        return function () {
            ContactMap.invinfowindow.open(ContactMap.map, marker);
        }
    })(ContactMap.invmarker));

    google.maps.event.addListener(ContactMap.pfntmarker, 'click', (function (marker) {
        return function () {
            ContactMap.pfntinfowindow.open(ContactMap.map, marker);
        }
    })(ContactMap.pfntmarker));


    $(".contact-mailType").change(function (value) {
        jQuery.validator.unobtrusive.parseElement($("#form0")[0], false);
        if (value) {
            if ($(this).attr("id") == "tech") {
                $.get(Civi.globalUrl + "/Contact/GetMailForm?type=tech", function (data) {
                    $(".contact-form").html(data);
                    $("#techQuestion").attr("value", true);
                    ContactMap.map.setCenter(ContactMap.invLatlng);
                    jQuery.validator.unobtrusive.parse($('#form0'));
                })
            }
            else if ($(this).attr("id") == "func") {
                $.get(Civi.globalUrl + "/Contact/GetMailForm?type=func", function (data) {
                    $(".contact-form").html(data);
                    $("#techQuestion").attr("value", false);
                    ContactMap.map.setCenter(ContactMap.pfntLatlng);
                    jQuery.validator.unobtrusive.parse($('#form0'));
                })
            }
        }
    });

});

function mailSent(data) {
    if (data.success == true) {
        $('.validation-summary-errors li').html('');
        $('#From').val('');
        $('#Subject').val('');
        $('#Message').val('');
        $('.mailsent-dialog').html('<p>Message envoyé avec succès!</p>');
        $('.mailsent-dialog').fadeIn().delay(800).fadeOut();
    } else {
        mailFailed();
    }
}


function mailFailed() {
    $('.mailsent-dialog').html('<p>Vérifiez votre adresse mail</p>');
    $('.mailsent-dialog').fadeIn().delay(1000).fadeOut();
}

$('.page').click(function () {
    $('.mailsent-dialog').css('display', 'none');
});
