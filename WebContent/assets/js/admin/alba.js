// 시급에 3글자 마다 콤마 찍어주는 함수
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

// 날짜가
$('#day_default').prop("checked", true);
$('input[name="day"]').change(function(){
    // 하루
    if ($('input[name="day"]:checked').val() == 'aDay') {
		$('.aDay-div').show();
        $('.days-div').hide();
    // 그 외
    } else {
		$('.days-div').show();
		$('.aDay-div').hide();
    }
});

// // 휴대폰 번호일 때 자동 하이픈(-) 입력 - 미적용
// const autoHyphen = (target) => {
//     target.value = target.value
//         .replace(/[^0-9]/g, '')
//         .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
//     }

// 저장 버튼 눌렀을 때 모든 값이 입력되어 있는지 검사
function save(){
	if(!albaForm.alba_title.value) {
		albaForm.alba_title.focus();
		return;
    }

	if(!albaForm.address.value) {
		albaForm.address.focus();
		return;
	}
	
    if ($('input[name="day"]:checked').val() == 'aDay' && !albaForm.aDay_Date.value) {
        albaForm.aDay_Date.focus();
        return;
    } else if ($('input[name="day"]:checked').val() == 'days' && !albaForm.s_startDate.value) {
        albaForm.s_startDate.focus();
        return;
	} else if ($('input[name="day"]:checked').val() == 'days' && !albaForm.s_endDate.value) {
        albaForm.s_endDate.focus();
        return;
	}

	if(!albaForm.s_startTime.value) {
		albaForm.s_startTime.focus();
		return;
	}

	if(!albaForm.s_endTime.value) {
		albaForm.s_endTime.focus();
		return;
	}

	if(!albaForm.money_input.value) {
		albaForm.money_input.focus();
		return;
	}

	if(!albaForm.r_startDate.value) {
		albaForm.r_startDate.focus();
		return;
	}

	if(!albaForm.r_endDate.value) {
		albaForm.r_endDate.focus();
		return;
	}

	if(isNaN(parseInt(albaForm.persons.value))) {
		albaForm.persons.focus();
		return;
	}

	if(!albaForm.phone.value) {
		albaForm.phone.focus();
		return;
	}
	
	albaForm.submit();
}
