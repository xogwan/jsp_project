/**
 * 사용자관리페이지 관련
 */

/*$.ajax({
	url:"/admin/User.ad",
	type:"get",
	data:{memberNumber: memberNumber, memberId: memberId, memberEmail: memberEmail, 
	memberPhoneNumber: memberPhoneNumber, memberName: memberName,
	 memberGrade: memberGrade, memberLocation: memberLocation},
	contentType: "application/json; charset=utf-8",
	dataType: "json",
	success: showList
	
});

function showList(userList){
	if(userList.length > 0){
		let text = "";
		
		userList.forEach(user => {
			text += ``
		})
	}
}*/

function outCheck(e){
    var msg = "이 사용자를 탈퇴시키겠습니까?";
    var flag = confirm(msg);
    if(flag) {
		alert('탈퇴 완료');
		
	}else{
		alert('취소되었습니다');
		e.preventDefault();
	}

}

