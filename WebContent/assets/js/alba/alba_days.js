/**
 * 디데이 계산
 */

let progressCount = 0;
let $endDay = $("span.end-day"); //신청 종료 날짜
let $countTotal = Number($("#countTotal").html()); // 총 모집 인원
let $countPerson = Number($("#countPerson").html()); // 현재 모집된 인원

$(document).ready(function(){
	
	$endDay.each(function(){
		
		console.log($endDay.html());
		let $countDay = $(this).prev(); //디데이
		let $applyStartDay = $(this).next(); //디데이
		let $progress = $(this).parents("li").find("p.progress"); // 진행상황
		
		let dDay = dDaysCount($(this));
		let count = dDaysCount($applyStartDay);
		
		
		/* 비교 후 맞는 문구 삽입 */
		if (dDay > 0) {
			$countDay.html("D-" + dDay);
			/* 현재 시간이 신청 시작 날짜보다 이를 때 */
			if (count > 0) {
				$progress.html("예정");
			}
		} else if (dDay == 0) {
			$countDay.html("D-day");
			$progress.html("오늘마감");
		} else {
			$countDay.html("마감");
			$progress.html("마감");
			$(this).parents("li.alba").css("backgroundColor","#ededed");
			$(this).parents("li.alba").css("filter","grayscale(1)");
			$(this).parents("li.alba").css("opacity",".6");
		}
	});
});

/* 신청이 마감된 아르바이트는 디테일 페이지에서 프로그램 신청 버튼 없애기 */
if (countDates($("#startDate")) > 0) {
	console.log("1");
	$("a").remove("#alba_apply");
	console.log("1****");
	
} else if (dDaysCount($("#endDate")) < 0) {
	console.log("2");
	$("a").remove("#alba_apply");
	console.log("2****");
}

/* 신청인원이 다 차면 신청 버튼 없애기 */
if ($countTotal == $countPerson) {
	$("a").remove("#alba_apply");
}

/* 디데이 계산 함수 */
function dDaysCount(endDay){
	let today = new Date(); //현재 날짜 가져오기
	let dday = new Date(endDay.html()).getTime(); //디데이
	
	let days = dday - today;
	let result = Math.floor(days / (1000 * 60 * 60 * 24) + 1);
	
	return result;
}

/* 현재시간 - 신청 시작 날짜 */
function countDates(startDay){
	let today = new Date(); //현재 날짜 가져오기
	let start = new Date(startDay.html()).getTime(); //시작날짜
	
	let days = start - today;
	let result = Math.floor(days / (1000 * 60 * 60 * 24) + 1);
	
	return result;
}
