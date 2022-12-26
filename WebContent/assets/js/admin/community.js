/**
 * 
 */


function deleteCheck(e){
    var msg = "이 글을 삭제시키겠습니까?";
    var flag = confirm(msg);
    if(flag) {
		alert('삭제 완료');
		
	}else{
		alert('취소되었습니다');
		e.preventDefault();
	}

}