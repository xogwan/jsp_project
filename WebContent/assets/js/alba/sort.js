/**
 * 정렬
 */

function showByViewCnt(){
	$.ajax({
		url: "${pageContext.request.contextPath}/alba/viewCountOk.ab", //서비스 주소 
		dataType: "json",
		success: function(albaLists){
			console.log("들어옴?");
			let text = "";
			let pageText = "";
			
			albaLists.forEach(alba => {
				text += `<li class="alba" onclick="location.href='/alba/apply01.ab?albaNumber=` + alba.albaNumber + `'">`;
				text += `<div class="info">`;
				text += `<p class="local"> ` + alba.albaLocation + `</p>`;
				text += `<p class="progress">진행중</p>`;
				text += `</div>`;
				text += `<div class="title">`;
				text += `<p> ` + alba.albaName + `</p>`;
				text += `</div>`;
				text += `<div class="num">`;
				text += `<p class="prd">`;
				text += `<span class="endstatus"></span> &nbsp;| &nbsp;`;
				text += `<span class="end-day">` + alba.albaApplyEndDate + `</span>`;
				text += `<span style="display: none;">` + alba.albaApplyStartDate + `</span>`;
				text += `</p>`;
				text += `<p class="hits">`;
				text += `<img src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png">`;
				text += `<span>` + alba.albaViewCount + `</span>`;
				text += `</p>`;
				text += `</div>`;
				text += `</div>`;
				text += `</li>`;
				
			});
	
			$("#albaListsAllUl").html(text);
		},
		error : function(request, status, error) {
			console.log("왜 안돼 ㅜㅜ = ");
		}
	});
}


