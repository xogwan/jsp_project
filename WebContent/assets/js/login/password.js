    // 비밀번호 일치하는 지 검사
    $(function(){
        $(".pop_con input").keyup(function(){
            let $pw = $("#newPassword").val();
            let $pw_check = $("#check_newPassword").val();

            if($pw != "" || $pw_check != ""){
                if($pw == $pw_check){
                    $('.change_pw_check').html('비밀번호가 일치합니다.');
                    $('.change_pw_check').css('color', 'green');
                } else {
                    $('.change_pw_check').html('비밀번호가 일치하지 않습니다.');
                    $('.change_pw_check').css('color', 'red')

                }
            }
        });
    });
    

    // 입력한 비밀번호가 일치한다면 저장하고 닫기
    function pwChange(){
	
		$outputPhoneNumber = $("#find_pw_phone").val();
		$outputId = $("#find_pw_name").val();
		$outputPassword = $("#newPassword").val();
	
        //8자리 이상, 대문자/소문자/숫자/특수문자 모두 포함되어 있는 지 검사
        var pwCheck = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
        //한글이 포함되었는 지 검사
        var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        //같은 문자 4번 이상
        var wordCheck = /(\w)\1\1\1/;
        //공백검사
        var spaceCheck = /\s/;

        if(!findPwForm.password.value){
            findPwForm.password.focus();
            return;
        }
	
        if(!findPwForm.passwordCheck.value){
            findPwForm.passwordCheck.focus();
            return;
        }
        
        if(!pwCheck.test(findPwForm.password.value)){
            findPwForm.password.focus();
            return;
        }
    
        if(hangleCheck.test(findPwForm.password.value)){
            findPwForm.password.focus();
            return;
        }
        
        if(wordCheck.test(findPwForm.password.value)){
            findPwForm.password.focus();
            return;
        }
    
        if(spaceCheck.test(findPwForm.password.value)){
            findPwForm.password.focus();
            return;
        }
        
        if(findPwForm.password.value.length < 10 || findPwForm.password.value.length > 20){
            findPwForm.password.focus();
            return;
        }
			
		$.ajax({
			url:"/member/findPw.me",
			type : "post",
			data: { outputPhoneNumber: $outputPhoneNumber, outputId : $outputId, outputPassword : $outputPassword },
			success: function(result) {
				console.log(result);
				console.log("들어옴")
			},
		error: function(target){
			console.log(target);
			console.log("오류!!")
		}
		});


       /* findPwForm.submit();*/
        alert('비밀번호가 변경되었습니다.')
		}
