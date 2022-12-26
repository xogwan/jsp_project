let code_id_check = false;
let code_pw_check = false;

/*사용자가 입력한 전화번호*/
let $inputPhoneNumber;

/*사용자가 인증번호 입력칸에 입력한 값*/
let $smsCheckNumber;

/*coolSMS에서 보낸 인증번호*/
let $smsNumber;


// 아이디 찾기 팝업 띄우기
    function openPop_id() {
        document.getElementById("fine_id_popup").style.display = "block";
        code_id_check = false;
        $("#fine_id_popup").show();
        $(".id_step1").show();
        $(".findId_code").hide();
        $(".id_step2").hide();
    }
    // 아이디 찾기에서 팝업 닫기
    function closePop_id() {
        document.getElementById("fine_id_popup").style.display = "none";
    }

		// 핸드폰번호 유효성 검사

	$(function(){

    $(".findId_phone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
	var k = e.keyCode;
				
	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	{
  	    e.preventDefault();
	}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;

        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != '')
        {
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }
                else
                {alert("유효하지 않은 전화번호 입니다.");
                 $(this).val("");
                 $(this).focus();
                }
            }
            else 
            {alert("유효하지 않은 전화번호 입니다.");
             $(this).val("");
             $(this).focus();
            }
      }
  });  
});







    /* 휴대폰번호 인증버튼 클릭시 */
  		$(".btn_phone_id").click(function () {
		$inputPhoneNumber = $("#find_id_phone").val();
		$inputName = $("#find_id_name").val();
        
		if(!findIdForm.memberFindName.value){
            findIdForm.memberFindName.focus();
            return;
        }
        
        if(!findIdForm.memberFindPhoneNumber.value){
            findIdForm.memberFindPhoneNumber.focus();
            return;
        }
			
			$.ajax({
				url: "/member/send.me",
				type: "post",
				data: { inputPhoneNumber: $inputPhoneNumber },
				success: function(result) {
					$smsNumber = result;
				}
			})
      
       $(".findId_code").css("display", "block");
        code_id_check = true;
    });

let memberFindId;
    // 이이디 찾기 핸드폰 인증 후 확인 버튼
    $(".id_next_step").click(function () {
		$smsCheckNumber = $("#find_id_phone_code").val();
        if ($smsCheckNumber != $smsNumber) {
            alert ("올바른 인증번호를 입력해주세요.");
            return;
        }
        $(".id_step2").show();
        $(".id_step1").hide();

		$.ajax({
			url:"/member/findId.me",
			type : "post",
			data: { inputPhoneNumber: $inputPhoneNumber, inputName : $inputName },
			success: function(result) {
				memberFindId = result;
				console.log(memberFindId);
				if(memberFindId=="null"){
				$("#memberFindId").text("가입된 정보가 없습니다.");
				console.log(memberFindId);
				return;
				}else{
				$("#memberFindId").text(memberFindId);
				return;
				}
			}
		});
		
		/*document.getElementById("memberFindId").innerHTML=memberFindId;*/
	console.log($inputPhoneNumber);
	console.log($inputName);
	
});

 // ---------------------------------------------------------------------------------

 // 비밀번호 찾기 팝업 띄우기
     /* function openPop_pw() {
        document.getElementById("fine_pw_popup").style.display = "block";
		alert("서비스를 준비중입니다.");
      code_pw_check = false;
        $("#fine_pw_popup").show();
        $(".pw_step1").show();
        $(".findPw_code").hide();
        $(".pw_step2").hide();
    }
    // 비밀번호 찾기에서 팝업 닫기
    function closePop_pw() {
        document.getElementById("fine_pw_popup").style.display = "none";
    }
    
    // 비밀번호 저장하고 팝업 닫기
    function closePop_save() {
        document.getElementById("fine_pw_popup").style.display = "none";
    }
	
	
	// 핸드폰번호 유효성 검사

$(function(){

    $(".find_pw_phone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
	var k = e.keyCode;
				
	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	{
  	    e.preventDefault();
	}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;

        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != '')
        {
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }
                else
                {alert("유효하지 않은 전화번호 입니다.");
                 $(this).val("");
                 $(this).focus();
                }
            }
            else 
            {alert("유효하지 않은 전화번호 입니다.");
             $(this).val("");
             $(this).focus();
            }
      }
  });  
});






    /* 휴대폰번호 인증버튼 클릭시 */
   /* $(".btn_phone_pw").click(function () {
		$inputPhoneNumber = $("#find_pw_phone").val();
		$outputId = $("#find_pw_name").val();
		$outputPassword = $("#newPassword").val();
		
        if(!findPwForm.findPw_name.value){
            findPwForm.findPw_name.focus();
            return;
        }
        
        if(!findPwForm.findPw_phone.value){
            findPwForm.findPw_phone.focus();
            return;
        }

	$.ajax({
		url: "/member/send.me",
		type: "post",
		data: { inputPhoneNumber: $inputPhoneNumber },
		success: function(result) {
			$smsNumber = result;
		}
	})
        $(".findPw_code").css("display", "block");
        code_pw_check = true;
    });

    // 비밀번호 찾기 핸드폰 인증 후 확인 버튼
    $(".pw_next_step").click(function () {
		$smsCheckNumber = $("#find_pw_phone_code").val();
	
        if ($smsCheckNumber != $smsNumber) {
            alert ("올바른 인증번호를 입력해주세요.");
            return;
        }
        $(".pw_step2").show();
        $(".pw_step1").hide();
    });*/
