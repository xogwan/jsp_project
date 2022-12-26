//  확인 = true, 취소 = false값 flag에 담기

// 유저 관리 탈퇴
function outCheck(){
    var msg = "이 사용자를 탈퇴시키겠습니까?";
    var flag = confirm(msg);

    if(flag) alert('탈퇴 완료');
}

// 프로그램 신청 관리 거절
function noCheck(){
    var msg = "이 프로그램을 거절 하시겠습니까?";
    var flag = confirm(msg);

    if(flag) alert('프로그램 거절 완료');
}

// 프로그램 관리 삭제
function deleteCheck(){
    var msg = "이 프로그램을 삭제 하시겠습니까?";
    var flag = confirm(msg);

    if(flag) alert('삭제 완료');
}

// 프로그램 지원자 거절
function noCheck2(){
    var msg = "이 사용자를 거절 하시겠습니까?";
    var flag = confirm(msg);

    if(flag) alert('지원자 거절 완료');
}

// 공지 글 작성 나가기
function saveCheck(){
    var msg = "지금 나가면 글이 저장되지 않습니다.\n그래도 나가시곘습니까?";
    var flag = confirm(msg);
    list = 'notice_list.html';

    if(flag) location.href = list;
}

// 공지 글 삭제
function deleteListCheck(){
    var msg = "이 글을 삭제 하시겠습니까?";
    var flag = confirm(msg);

    if(flag) alert('삭제 완료');
}

// 댓글 삭제
function deleteReplyCheck(){
    var msg = "이 댓글을 삭제 하시겠습니까?";
    var flag = confirm(msg);

    if(flag) alert('삭제 완료');
}

