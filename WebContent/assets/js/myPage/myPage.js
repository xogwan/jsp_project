/**
 * 마이페이지 JS
 */

/*로그인한 회원의 알바 신청 내역이 없을 경우*/
console.log(albaApply);
console.log(programApply);

if(albaApply == false){
	console.log("알바체크")
	$(".albaApply").toggle();
	$(".albaNoApply").toggle();
}

/*로그인한 회원의 프로그램 신청 내역이 없을 경우*/
if(programApply == false){
	console.log("프로그램 체크")
	$(".programApply").toggle();
	$(".programNoApply").toggle();
}
