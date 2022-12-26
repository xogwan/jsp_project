// 저장 버튼 눌렀을 때 모든 값이 입력되어 있는지 검사
function save(){
	if(!noticeForm.n_title.value) {
		noticeForm.n_title.focus();
		return;
    }

	// if(!noticeForm.editorForm.value) {
	// 	noticeForm.editorForm.focus();
	// 	return;
    // }
	
    // if ($('input[name="money"]:checked').val() == 'notFree' && !noticeForm.money_input.value) {
    //     noticeForm.money_input.focus();
    //     return;
    // }
	
	// noticeForm.submit();

    $('textarea[name="editorForm"]').html($('.summernote').code());
    console.log( $('textarea[name="editorForm"]').html($('.summernote').code()));

}

// $('input[name="editorForm"]').keyup(function(){
//     console.log(noticeForm.n_title.value);
// });
