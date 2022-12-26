/**
 * 
 */
var GNB;
//전체 메뉴 HOVER , FOCUS
$(function () {
    GNB = $('#gnb');
    GNB.find('>ul>li>a').on('mouseenter', function (e) {
        e.preventDefault();
        GNB.find('>ul>li>ul[data-level="2"]:visible').parent('li').removeClass('on');
        $(this).next('ul[data-level="2"]:hidden').parent('li').addClass('on');
    }).focus(function () {
        $(this).mouseover();
    }).end().mouseleave(function () {
        GNB.find('>ul>li>ul[data-level="2"]').prev('a').parent().siblings().removeClass('on');
    }).find('li').last().focusout(function () {
        $(this).mouseleave();
    });
});

// 상단 메뉴 있었다가 없어지기
$(document).ready(function () {
    $('#gnb_wrap').mouseover(function () {
        $('.lgr_back').css('display', 'block');
    });

    $('.lgr_back').mouseleave(function () {
        $('.lgr_back').css('display', 'none');
    })
})

// 자녀 항목들 mouseover시 부모 타이틀 색 변경

$('.j1').mouseover(function () {
    console.log("확인-1");
    $('#k1 > a').css('color', '#7fb069');
});

$('.j1').mouseleave(function () {
    $('#k1 > a').css('color', '#333333');
});

$('.j2').mouseover(function () {
    $('#k2 > a').css('color', '#7fb069');
});

$('.j2').mouseleave(function () {
    $('#k2 > a').css('color', '#333333');
});

$('.j3').mouseover(function () {
    $('#k3 > a').css('color', '#7fb069');
});

$('.j3').mouseleave(function () {
    $('#k3 > a').css('color', '#333333');
});

$('.j4').mouseover(function () {
    $('#k4 > a').css('color', '#7fb069');
});

$('.j4').mouseleave(function () {
    $('#k4 > a').css('color', '#333333');
});

$('.j5').mouseover(function () {
    $('#k5 > a').css('color', '#7fb069');
});

$('.j5').mouseleave(function () {
    $('#k5 > a').css('color', '#333333');
});

$('.j6').mouseover(function () {
    $('#k6 > a').css('color', '#7fb069');
});

$('.j6').mouseleave(function () {
    $('#k6 > a').css('color', '#333333');
});

$("#lgr_topbtn").click(function(){
	$('html, body').animate({scrollTop: '0'}, 800);
	return false;
});