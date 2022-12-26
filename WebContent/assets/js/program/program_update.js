/**
 * 프로그램 글 수정
 */

//기존 수강료 내용 반영
if ( $('input[name="money_input"]').val() == '무료' ){
	$('#tuition_default').prop("checked", true);
        $('.tuition-div').hide();
}else{
	$('#tuition').prop("checked", true);
        $('.tuition-div').show();
	
}
// 수강료
$('input[name="money"]').change(function(){
	console.log("들어오니?")
    // 무료일 때
    if ($('input[name="money"]:checked').val() == 'free') {
        $('.tuition-div').hide();
	console.log("아니?")
    // 유료일 때
    } else {
        $('.tuition-div').show();
	console.log("ㅇ?")
    }
});

//첨부파일
function fileUpload(){
	var fileValue = $(".fileName").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	$("#file-content").html(fileName);
	
}

// 취소 버튼 눌렀을 때 알림창
function saveCheck(){
    var msg = "지금 나가면 글이 저장되지 않습니다.\n그래도 나가시겠습니까?";
    var flag = confirm(msg);
    list = '/program/applyListOk.pg';

    if(flag) location.href = list;
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
	
	alert("글이 정상적으로 수정되었습니다.")
	programForm.submit();
}

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

