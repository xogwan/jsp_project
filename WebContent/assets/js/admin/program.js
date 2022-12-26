// 3글자 마다 콤마 찍어주는 함수
function autoComma(obj) {
    obj.value = comma(uncomma(obj.value));
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

// 수강료
$('#tuition_default').prop("checked", true);
$('input[name="money"]').change(function(){
    // 무료일 때
    if ($('input[name="money"]:checked').val() == 'free') {
        $('.tuition-div').hide();
    // 유료일 때
    } else {
        $('.tuition-div').show();
    }
});

// // 실시간으로 콘솔창에 수강료 입력값 출력
// $('input[name="tuition"]').keyup(function(){
//     console.log($('input[name="tuition"]').val());
// });

// // 휴대폰 번호일 때 자동 하이픈(-) 입력 - 미적용
// const autoHyphen = (target) => {
//     target.value = target.value
//         .replace(/[^0-9]/g, '')
//         .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
//     }

// 저장 버튼 눌렀을 때 모든 값이 입력되어 있는지 검사
function save(){
	if(!programForm.pro_title.value) {
		programForm.pro_title.focus();
		return;
    }

	if(!programForm.s_startDate.value) {
		programForm.s_startDate.focus();
		return;
	}

	if(!programForm.s_endDate.value) {
		programForm.s_endDate.focus();
		return;
	}

	if(!programForm.s_startTime.value) {
		programForm.s_startTime.focus();
		return;
	}

	if(!programForm.s_endTime.value) {
		programForm.s_endTime.focus();
		return;
	}
	
    if ($('input[name="money"]:checked').val() == 'notFree' && !programForm.money_input.value) {
        programForm.money_input.focus();
        return;
    }

	if(!programForm.r_startDate.value) {
		programForm.r_startDate.focus();
		return;
	}

	if(!programForm.r_endDate.value) {
		programForm.r_endDate.focus();
		return;
	}

	if(isNaN(parseInt(programForm.persons.value))) {
		programForm.persons.focus();
		return;
	}

	if(!programForm.address.value) {
		programForm.address.focus();
		return;
	}

	if(!programForm.phone.value) {
		programForm.phone.focus();
		return;
	}
	
	programForm.submit();
}
