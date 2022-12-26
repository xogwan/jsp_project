/**
 * 
 */


var checked = $("#box1").prop("checked");


function back() {
	location.href = "/app/myPage/myProfile.jsp";
}


/* 피드백 부분 클릭 */
$(".checkBox span a").click(function() {
	console.log($(this).find("img").attr("src"));
	var src = $(this).find("img").attr("src") == '/assets/images/deletePage/uncheckedBox.png' ? "/assets/images/deletePage/checkedBox.png" : "/assets/images/deletePage/uncheckedBox.png";
	$(this).find("img").attr("src", src);
});


/* -------------------------------------------------------------- */
/* 비밀번호 입력하지 않고 탈퇴 버튼 클릭시 말풍선 출력 */
$("#submitBtn").click(function() {
	$(".tooltiptext").finish();
	if ($(".passwordInput").val().length == 0) {
		$(".tooltiptext").css("visibility", "visible");
		$(".passwordInput").focus();
		$(".tooltiptext").fadeIn(600);
		$(".tooltiptext").fadeOut(600);
	}
});

function deleteMember(){
	let $inputPassword = $("#deletePassword").val();
	console.log($inputPassword);	
	$.ajax({
		url : "/mypage/DeleteOk.my",
		type : "post",
		data: {inputPassword: $inputPassword},
		success : function (result) {
			console.log(result);
			if(result == 'false'){
				alert('비밀번호가 맞지 않습니다');
				$inputPassword.focus();
			}else{
				alert('회원탈퇴 처리 되었습니다');
				location.href = "/member/logout.me";
			}
		}
	})
}
/*
function send(){
	deleteForm.submit();
}*/