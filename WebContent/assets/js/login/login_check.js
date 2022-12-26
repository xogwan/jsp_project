/**
 * 로그인 send함수쓰기
 */
function send() {
	let id = loginForm.memberId.value;
	let pw = loginForm.memberPassword.value;

	if (!id) {
		loginForm.memberId.focus();
		return;
	}
	if (!pw) {
		loginForm.memberPassword.focus();
		return;
	}

	loginForm.submit();
}

// 아이디 저장 박스 체크하기

// 아이디를 전달받았다면, 아이디 저장을 눌러서 로그인 했다는 뜻.
let memberId = "${memberId}";
// 위의 상황에 맞게 체크해주기!
if (memberId) { $("input[name='saveId']").prop("checked", true); }
console.log(memberId);