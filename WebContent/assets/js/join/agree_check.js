
    // 자세히 보기 
	$(document).ready(function(){
		$('.scroll_box').hide();
	});
	
	$('#0').click(function(){
		$('#10').slideToggle( '5000' );
		$('#11').hide();
		$('#12').hide();
	})
	
	$('#1').click(function(){
		$('#10').hide();
		$('#11').slideToggle( '5000' );
		$('#12').hide();
	})
	
	$('#2').click(function(){
		$('#10').hide();
		$('#11').hide();
		$('#12').slideToggle( '5000' );
	})




    function fn_agreeAction() {
			//필수 약관 체크
			document.detailForm.agree.value = false;
			if (!fn_checkEssentialTerm()) {
				alert("이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
				return;
			} else {
				document.detailForm.agree.value = true;
                document.detailForm.submit();
                location.href='/member/join02.me';
		    } 
    }





    /* 약관 전체 선택 */
		function fn_allTermCheck() {
			if($("#allTermCheck").is(":checked")){
				$(".checkTerm").prop("checked", true);
				$("input.checked").val("1");
			} else {
				$(".checkTerm").prop("checked", false);
				$("input.checked").val("0");
			}
		}


        /* 약관 선택 */
		function fn_checkTerm() {
			var chkCnt = 0;
			var rowCnt = 0;
			$.each($(".checkTerm"),function(i, item){
				rowCnt ++;
				var termsId = $(item).val();
				if($(item).is(":checked")){
					$(".termsId[value='"+termsId+"']").next(".checked").val("1");
					chkCnt++;
				} else {
					$(".termsId[value='"+termsId+"']").next(".checked").val("0");
				}
			});
			if (chkCnt == rowCnt) {
				$("#allTermCheck").prop("checked", true);
			} else {
				$("#allTermCheck").prop("checked", false);
			}
		}
	
		function fn_checkEssentialTerm() {
			var chkCnt = 0;
			var rowCnt = 0;
			$.each($(".checkTerm.necessary"),function(i, item){
				rowCnt ++;
				if($(item).is(":checked")){
					chkCnt++;
				}
			});
			if(chkCnt == rowCnt){
				return true;
			} else {
				return false;
			}
		}
	
		function fn_joinCancel() {
			location.href = "/young/";
		}