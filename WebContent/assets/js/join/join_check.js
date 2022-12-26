let phone_code_check = false;

// 유저 구분에 일반인으로 디폴트 체크
$('#default_grade').prop("checked", true);
$('input[name="memberGrade"]').change(function(){
    // 일반 유저일 때
    if ($('input[name="memberGrade"]:checked').val() == 'user') {
        $('#farmer_user').css('visibility', 'hidden');
    // 농장주일 때
    } else {
        $('#farmer_user').css('visibility', '');
    }
});

// 아이디 중복 검사
function checkId(memberId){
	if(!memberId){
		$("#idMsg").text("아이디를 입력해주세요.");
		$("#idMsg").css("color", "red");
		return;
	}
	
	$.ajax({
		url: contextPath + "/member/checkIdOk.me",
		type : "get",
		data : {memberId: memberId},
		dataType : "json",
		contentType :"application/json; charset=utf-8",
		success : function(data){
			if(!data.result){
				$("#idMsg").text("사용가능한 아이디입니다.");
				$("#idMsg").css("color", "blue");
			}else{
				$("#idMsg").text("중복된 아이디입니다.");
				$("#idMsg").css("color", "red");
			}
		}
	});
}

$("input[name='memberId']").on("blur",function(){
	checkId($(this).val());
});

// 이름 입력 검사
function checkName(memberName){
	if(!memberName){
		$("#nameMsg").text("이름을 입력해주세요.");
		$("#nameMsg").css("color", "red");
		return;
	}
	if(memberName){
		$("#nameMsg").text("");
		return;
	}
}

$("input[name='memberName']").on("blur",function(){
	checkName($(this).val());
});


// 이메일 입력 검사

function checkEmail(memberEmail){
	if(!memberEmail){
		$("#emailMsg").text("이메일을 입력해주세요.");
		$("#emailMsg").css("color", "red");
		return;
	}
	if(memberEmail){
		$("#emailMsg").text("");
		return;
	}
}

$("input[name='memberEmail']").on("blur",function(){
	checkEmail($(this).val());
});

// 비밀번호 입력 검사
function checkPassword(memberPassword){
	if(!memberPassword){
		$("#passwordMsg").text("비밀번호를 입력해주세요.");
		$("#passwordMsg").css("color", "red");
		return;
	}
	if(memberPassword){
		$("#passwordMsg").text("");
		return;
	}
}

$("input[name='memberPassword']").on("blur",function(){
	checkPassword($(this).val());
});

// 핸드폰번호 유효성 검사

$(function(){

    $(".phoneNum").on('keydown', function(e){
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


// 핸드폰번호 중복 검사
function checkPhoneNumber(memberPhoneNumber){
	if(!memberPhoneNumber){
		$("#phoneNumberMsg").text("핸드폰 번호를 입력해주세요.");
		$("#phoneNumberMsg").css("color", "red");
		return;
	}
	
	$.ajax({
		url: contextPath + "/member/checkPhoneNumberOk.me",
		type : "get",
		data : {memberPhoneNumber: memberPhoneNumber},
		dataType : "json",
		contentType :"application/json; charset=utf-8",
		success : function(data){
			if(!data.result){
				$("#phoneNumberMsg").text("사용가능한 번호입니다.");
				$("#phoneNumberMsg").css("color", "blue");
			}else{
				$("#phoneNumberMsg").text("중복된 번호입니다.");
				$("#phoneNumberMsg").css("color", "red");
			}
		}
	});
	
	}

$("input[name='memberPhoneNumber']").on("blur",function(){
	checkPhoneNumber($(this).val());
});


// 비밀번호 일치하는 지 검사
    $(function(){
        $(".detail_table input[type='memberPassword']").keyup(function(){
            let $pw = $("#password").val();
            let $pw_check = $("#passwordCheck").val();

            if($pw != "" || $pw_check != ""){
                if($pw == $pw_check){
			        $('#pwEqual').css('visibility', '');
			        $('#pwNotEqual').css('visibility', 'hidden');
                } else {
			        $('#pwEqual').css('visibility', 'hidden');
			        $('#pwNotEqual').css('visibility', '');
                }
            }
        });
    });

// 사용자가 입력한 전화번호
let $memberPhoneNumber;

// 사용자가 인증번호 입력칸에 입력한 값
let $smsCheckNumber;

// coolSms에서 보낸 인증번호
let $smsNumber;

// 인증번호 일치 여부 검사
let $isCheck = false;


    // 휴대폰 인증번호 보내기
    function sendSms(){

	$memberPhoneNumber = $(".phoneNum").val();
	console.log($memberPhoneNumber);
	
	$.ajax({
		url : "/member/send.me",
		type : "post",
		data : {inputPhoneNumber : $memberPhoneNumber},
		success : function(result){
			$smsNumber = result;
		}
	});
	
    }




    // 인증번호 입력 체크
    function checkSms(){
	$smsCheckNumber = $("#phoneCode").val();
	console.log($smsNumber);
	console.log($smsCheckNumber);
	if($smsCheckNumber == $smsNumber){
		console.log("인증번호 일치!");
		
		$isCheck = true;
		alert("인증번호가 일치합니다.");
	}else{
		$isCheck = false;
		
		alert("인증번호 일치하지 않습니다.");
		detailForm.phoneCode.focus();
	}
   	}

    // 입력한 비밀번호가 일치한다면 저장하고 닫기
    function join(){
        console.log('비밀번호 체크')
        //8자리 이상, 대문자/소문자/숫자/특수문자 모두 포함되어 있는 지 검사
        var pwCheck = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
        //한글이 포함되었는 지 검사
        var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        //같은 문자 4번 이상
        var wordCheck = /(\w)\1\1\1/;
        //공백검사
        var spaceCheck = /\s/;

        if(!detailForm.memberId.value){
            detailForm.memberId.focus();
            return;
        }

        if(!detailForm.memberName.value){
            detailForm.memberName.focus();
            return;
        }

        if(!detailForm.memberEmail.value){
            detailForm.memberEmail.focus();
            return;
        }
        if(!detailForm.emailDomain.value){
            detailForm.emailDomain.focus();
            return;
        }


        if(!detailForm.memberPassword.value){
            detailForm.memberPassword.focus();
            return;
        }
	
        if(!detailForm.passwordCheck.value){
            detailForm.passwordCheck.focus();
            return;
        }
        
        // 비밀번호 입력시 검사
         if(!pwCheck.test(detailForm.memberPassword.value)){
				alert("비밀번호를 확인해주세요.");
             return;
         }
    
         if(hangleCheck.test(detailForm.memberPassword.value)){
             alert("비밀번호를 확인해주세요.");
             return;
         }
        
         if(wordCheck.test(detailForm.memberPassword.value)){
            alert("비밀번호를 확인해주세요.");
             return;
         }
    
         if(spaceCheck.test(detailForm.memberPassword.value)){
           alert("비밀번호를 확인해주세요.");
             return;
         }
        
         if(detailForm.memberPassword.value.length < 10 || detailForm.memberPassword.value.length > 20){
             alert("비밀번호를 확인해주세요.");
             return;
         }

        if(!detailForm.memberPhoneNumber.value){
            detailForm.memberPhoneNumber.focus();
            return;
        }

        if(!detailForm.phoneCode.value){
            detailForm.phoneCode.focus();
            alert("휴대폰 인증이 필요합니다.")
            return;
        }
		
		if(!$isCheck){
			detailForm.phoneCode.focus();
			alert("인증번호를 다시 한번 확인해주세요.");
			return;
		}
		
        detailForm.submit();
        alert('회원가입이 완료되었습니다.')
    }