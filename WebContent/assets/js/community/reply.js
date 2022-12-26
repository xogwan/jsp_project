/**
 * 댓글
 */
 
 
//textarea 글자수 세기
$('.comm_textarea').keyup(function (e){
    var content = $(this).val();
    $('.comment_text02').html("("+$(this).val().length+" / 1000byte)");
    //글자수 실시간 카운팅    
if ($(this).val().length > 1000){
    alert("최대 1000자까지 입력 가능합니다.");
    $(this).val($(this).val().substring(0, 1000)); 
    $('.comment_text02').html("(1000 / 최대 1000자)");
    }
});

/* 댓글 목록 출력 */
show();

function show() {
	$.ajax({
		url: "/reply/listOk.re",
		type: "get",
		data: {communityNumber: communityNumber},
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: showList
	});
}

function showList(replyList){
				
		if(replyList.length > 0) {
		let text="";
		replyList.forEach(reply => {
			text += `<div id="reply">`;
				text+= `<div class="re-list">`;
				text+= `<div class="re-top">`;
					text+= `<span class="re-writer">`+ reply.memberId +`</span>`;
					
					if(memberNumber == reply.memberNumber) { // 게시글 작성자와 댓글 작성자가 일치하는 경우
						text+= `<span class="re-b-writer">게시글 작성자</span>`;	
					}
					text+= `<span class="re-date">`+ reply.replyDate +`</span>`;
					text+= `<span class="re-btn-group">`;
					if(loginSession == reply.memberNumber) { // 현재 로그인 한 회원이 작성한 댓글인 경우
						text+= `<a href="` + reply.replyNumber + `" class="re-modify-ready re-btn">수정</a>`;
						text+= `<a href="` + reply.replyNumber + `" class="re-delete">삭제</a>`;
						text+= `<a href="` + reply.replyNumber + `" class="re-modify re-btn">저장</a>`;
						text+= `<a href="` + reply.replyNumber + `" class="re-cancel">취소</a>`;	
					}
					text+= `</span>`;
				text+= `</div>`;
				text+= `<div class="re-content">`;
					text+= `<pre>` + reply.replyContent + `</pre>`;
				text+= `</div>`;
			text+= `</div>`;			
			
			$("#replyList").html(text); /* 위에서 작성된 내용들 최종적으로 삽입 */
		});
	}
}

/* 댓글 작성 등록 */
function send(){
	let replyContent = replyForm.replyContent.value;

	if(!replyContent){ /* 유효성 검사 */
		alert("댓글 내용을 작성해주세요.");
		return;
	}
	
	$.ajax({ /* 작성을 다 한 후에는 show를 콜백함수로 호출하여 다시 댓글목록 조회 */
		url: "/reply/writeOk.re",
		type: "get",
		data: {replyContent: replyContent, communityNumber: communityNumber, memberNumber: memberNumber},
		contentType: "application/json; charset=utf-8",
		success: function(){
			document.getElementById("replyText").value = ''; /*게시글을 작성한 후에는 기존에 textarea에 입력한 문자열을 초기화함*/
			show();
			}
	});
}


/* 댓글 삭제 */
$("#replyList").on("click", ".re-delete", function(e){
	e.preventDefault();
	$.ajax({ /* 작성을 다 한 후에는 show를 콜백함수로 호출하여 다시 댓글목록 조회 */
		url: "/reply/deleteOk.re",
		type: "get",
		data: {replyNumber: $(this).attr("href")},
		success: function(){show();}
	});
});


/* 댓글 수정 */
$("#replyList").on("click", ".re-modify-ready", function(e){
	e.preventDefault();
	const buttonWrap = $(this).parent();
	const buttons = buttonWrap.children();
	const content = buttonWrap.parent().next().children();
	
	buttons.eq(0).hide();
	buttons.eq(1).hide();
	buttons.eq(2).show();
	buttons.eq(3).show();
	
	content.replaceWith("<textarea>" + content.text() + "</textarea>");
});

/* 댓글 수정 저장 */
$("#replyList").on("click", ".re-modify", function(e){
	e.preventDefault();
	const buttonWrap = $(this).parent();
	const buttons = buttonWrap.children();
	const content = buttonWrap.parent().next().children().val();
	
	$.ajax({
		url: "/reply/modifyOk.re",
		data: {replyContent: content, replyNumber: $(this).attr("href")},
		success: function(){show();}
	});
});


/* 댓글 수정 취소 */
$("#replyList").on("click", ".re-cancel", function(e){
	e.preventDefault();
	const buttonWrap = $(this).parent();
	const buttons = buttonWrap.children();
	const content = buttonWrap.parent().next().children();
	
	buttons.eq(0).show();
	buttons.eq(1).show();
	buttons.eq(2).hide();
	buttons.eq(3).hide();
	
	content.replaceWith("<pre>" + content.text() + "</pre>")
});