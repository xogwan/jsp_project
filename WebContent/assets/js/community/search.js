/**
 * 
 */

showList();

function showList() {
		$.ajax({
			url: "/community/searchOk.cm",
			type: "get",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function(boards) {
			let text = "";
			let $result = $("tbody");
			
			$.each(boards, function(i, board) {
				text += `<tr>`;
				text += `<td>` + board.communityNumber + `</td>`;
				text += `<td><a href=/community/detailOk.cm?communityNumber=`+ board.communityNumber + `>` + board.communityTitle + `</a></td>`;
				text += `<td class="file">`+ board.communityFileName +`</td>`;
				text += `<td>`+ board.memberId +`</td>`;
				text += `<td class="file">`+ board.communityDate +`</td>`;
				text += `<td class="file">`+ board.communityViewCount +`</td>`;
				text += `</tr>`;
				
				$result.html(text);
			});
		}
	});
}