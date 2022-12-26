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

// 휴대폰 번호일 때 자동 하이픈(-) 입력 - 미적용
const autoHyphen = (target) => {
	target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}


/* 글 작성 일 때 취소 버튼 누르면 경고창 띄우기 */
function saveCheck(){
    var msg = "지금 나가면 글이 저장되지 않습니다.\n그래도 나가시곘습니까?";
    var flag = confirm(msg);
    list = '/alba/applyListOk.ab';

    if(flag) location.href = list;
}

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
	
	if(!albaForm.file.value) {
		alert("파일을 등록해주세요.");
		return;
	}
	
	alert("글이 정상적으로 등록되었습니다.");
	albaForm.submit();
}

//첨부파일 파일명 보이기
function fileUpload(){
	var fileValue = $(".fileName").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	$("#file-content").html(fileName);
	
}

//삭제 버튼
$('input[type="file"]').on("change",function(){
	if($("#file-content").html() == ""){
		$("#deleteBtn").hide();
	}else{
		$("#deleteBtn").show();
	}
});

//첨부파일 업로드 취소
function cancelFile(){
	$("input[type='file']").val("");
	$("#file-content").html("");
	console.log($("input[type='file']").val(""));
	$("#deleteBtn").hide();
}
