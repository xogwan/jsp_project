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

// 휴대폰 번호일 때 자동 하이픈(-) 입력 - 미적용
	 const autoHyphen = (target) => {
     target.value = target.value
         .replace(/[^0-9]/g, '')
         .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
     }

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
	
	if(!programForm.file.value) {
		alert("파일을 등록해주세요");
		return;
	}
	
	alert("글이 정상적으로 등록되었습니다.")
	programForm.submit();
}

// 취소 버튼 눌렀을 때 알림창
function saveCheck(){
    var msg = "지금 나가면 글이 저장되지 않습니다.\n그래도 나가시곘습니까?";
    var flag = confirm(msg);
    list = '/program/applyListOk.pg';

    if(flag) location.href = list;
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
