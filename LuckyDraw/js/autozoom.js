/*
    By PillarsZhang 2017-9-23
    Web:www.pizyds.com
*/

$(function () {
    if (setAutoZoom) {
        zoom();
        /*
        document.addEventListener("fullscreenchange", zoom);
        document.addEventListener("mozfullscreenchange", zoom);
        document.addEventListener("webkitfullscreenchange", zoom);
        document.addEventListener("msfullscreenchange", zoom);
        */
        };
    });

$(window).resize(function(){
    if (setAutoZoom) {
        zoom();
        }
    });

function zoom() {
    var winH = $(window).height();
    var winW = $(window).width();

    var winH2 = winH/650
    var winW2 = winW/650

    console.log("H=%d W=%d",winH,winW);
    console.log("H2=%f W2=%f",winH2,winW2);
    if (winH2<1 || winW2<1)
        {
        if (winH2<winW2) 
            {
            $("body").css("transform","scale("+winH2+")");
            }
        else
            {
            $("body").css("transform","scale("+winW2+")");
            }
        }
    else 
        {
        $("body").css("transform","scale(1)");
        }
    };