/**
 * 농업정보 - 계절별 작물 추천
 */

/* 8월~11월 재배 작물 캘린더 보기 */
$("li.li-step02").on("click", function(){
	$(".c-step01").hide();
	$(".c-step02").show();
});

/* 3월~7월 재배 작물 캘린더 보기 */
$("li.li-step01").on("click", function(){
	$(".c-step01").show();
	$(".c-step02").hide();
});