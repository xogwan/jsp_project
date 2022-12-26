/* "수정", "취소" 버튼 애니메이션 */
    $(".cancelBtn").mouseover(function() {
        $(".cancelBtn").css("background-color", "white").css("color", "black").css("border", "1px solid #8a8a8a");
        $(".cancelBtn img").css('opacity', '0').stop().attr("src", "/assets/images/updatePage/changeCancel.png").animate({opacity:1}, 500); /* 변경하고자 하는 이미지에 애니메이션 효과 주려면 이렇게 해야한다.. */
    }) ;


    $(".cancelBtn").mouseout(function() {
        $(".cancelBtn").css("background-color", "#8a8a8a").css("color", "white");
        $(".cancelBtn img").attr("src", "/assets/images/updatePage/cancelImage.png")
    })

    $(".updateBtn").mouseover(function() {
        $(".updateBtn").css("background-color", "white").css("color", "black").css("border", "1px solid #8a8a8a");
        $(".updateBtn img").css('opacity', '0').stop().attr("src", "/assets/images/updatePage/changeWriteImage.png").animate({opacity:1}, 500); /* 변경하고자 하는 이미지에 애니메이션 효과 주려면 이렇게 해야한다.. */
    }) ;


    $(".updateBtn").mouseout(function() {
        $(".updateBtn").css("background-color", "#8a8a8a").css("color", "white");
        $(".updateBtn img").attr("src", "/assets/images/updatePage/writeImage.png")
    })
    

	/*-------------------------------------------------------------- */
	/*일반인 농장주 구분 검사*/
	var grade = $('input[id=user]').val();
	console.log(grade);
	if(grade == 1){
		$("#user").prop("checked" , true);
	}else{
		$("#farmer").prop("checked" , true);
	}



    /* -------------------------------------------------------------- */
	/* 비밀번호 일치하는 지 검사 */
    $(function(){
        $(".detail_table input[type='password']").keyup(function(){
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

	/*휴대폰번호 유효성 검사*/
	$(function(){

    $(".inputPhone").on('keydown', function(e){
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


    /* -------------------------------------------------------------- */
    /* 휴대폰 번호 다른번호 인증 클릭시 */
    $(".changePhone").click(function() {
        /* 기존에 있던 요소는 숨기기 */
        $(".changePhone").hide();
        $(".printPhone").hide();

        /* 변경할 휴대폰 번호를 입력할 수 있는 input 보이기 */
        $(".inputPhone").show();
        $(".sendNumber").show();
    });

    /* 변경할 휴대폰 번호 입력 후 "인증번호 발송" 버튼 클릭시 */
    $(".sendNumber").click(function() {
		/*인증번호 발송 input태그, 버튼 숨기기*/
		$(".inputPhone").hide();
		$(".sendNumber").hide();
		
		/*인증번호 입력 input태그, 버튼 보이기*/
		$(".inputCertiNum").show();
		$(".submitBtn").show();
	});

    /* -------------------------------------------------------------- */
    /* 주요생산품목 "직접입력" 선택시 input 보이게 하기 */
    $("#selectUserInfo03").change(function() {
        if(this.value == -1) { /* 사용자 선택이 직접입력인 경우 */
            $("#inputItem").show();
        } else {
            $("#inputItem").hide();
        }
    });


    /* -------------------------------------------------------------- */
    /* 비밀번호 입력하지 않고 수정 버튼 클릭시 말풍선 출력 */
     $(".updateBtn").click(function() {
        $(".tooltiptext").finish();
        if($("#password").val().length == 0) {
            $(".tooltip_pw .tooltiptext").css("visibility", "visible");
            $("#password").focus();
            $(".tooltip_pw .tooltiptext").fadeIn(600);
            $(".tooltip_pw .tooltiptext").fadeOut(600);
        } else if(($("#passwordCheck").val().length == 0)) {
            $(".tooltip_pwCh .tooltiptext").css("visibility", "visible");
            $("#passwordCheck").focus();
            $(".tooltip_pwCh .tooltiptext").fadeIn(600);
            $(".tooltip_pwCh .tooltiptext").fadeOut(600);
        }
    });


    /* -------------------------------------------------------------- */
    /* 취소버튼 클릭시 마이페이지로 이동 */
    /*$(".cancelBtn").on("click", function() {
      
    })*/


    /* -------------------------------------------------------------- */
    /* 지역 선택시 소카 변경 */
    // /* 지역(도,시) 누르면 세부 도시 드롭박스로 나오게 하기  */
    function clickCityChange(e){
        var busan = ["선택하세요","강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산센터", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
        var daegu = ["선택하세요","남구", "달서구", "달성군", "대구센터", "동구", "북구", "서구", "수성구", "중구"];
        var incheon = ["선택하세요","강화군","옹진군"];
        var daejeon = ["선택하세요", "강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "인천센터", "중구"];
        var ulsan = ["선택하세요", "동구", "북구", "울산센터", "울주군"];
        var sejong = ["선택하세요", "세종센터", "조치원읍"];
        var gyeonggi = ["선택하세요","고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
        var gangwon = ["선택하세요","강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];
        var chungcheongbuk = ["선택하세요","괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"];
        var chungcheongdam = ["선택하세요","계룡시", "공주시", "금산군", "논산시", "당진시", "동남구", "보령시", "부여군", "서북구", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"];
        var Jeollabuk = ["선택하세요","고창군", "김제시", "남원시", "덕진구", "무주군", "부안군", "순창군", "완산구", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
        var Jeollanam = ["선택하세요","강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "전라남도", "진도군", "함평군", "해남군", "화순군"];
        var Gyeongsangbuk = ["선택하세요","경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
        var Gyeongsangnam = ["선택하세요","거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];

        var target = document.getElementById("userInfo02");

        if(e.value == "부산") var list = busan;
        if(e.value == "대구") var list = daegu;
        if(e.value == "인천") var list = incheon;
        if(e.value == "대전") var list = daejeon;
        if(e.value == "울산") var list = ulsan;
        if(e.value == "세종") var list = sejong;
        if(e.value == "경기") var list = gyeonggi;
        if(e.value == "강원") var list = gangwon;
        if(e.value == "충북") var list = chungcheongbuk;
        if(e.value == "충남") var list = chungcheongdam;
        if(e.value == "전북") var list = Jeollabuk;
        if(e.value == "전남") var list = Jeollanam;
        if(e.value == "경북") var list = Gyeongsangbuk;
        if(e.value == "경남") var list = Gyeongsangnam;

        target.options.length = 0;

        for(x in list){
            var opt = document.createElement("option")
            opt.value = list[x];
            opt.innerHTML = list[x];
            target.appendChild(opt);
        }
    }

/*사용자가 입력한 전화번호*/
let $inputPhoneNumber;

/*사용자가 인증번호 입력칸에 입력한 값*/
let $smsCheckNumber;

/*coolSMS에서 보낸 인증번호*/
let $smsNumber;

/*인증번호 일치 여부 flag 값*/
let $isCheck = false;

/*인증번호 발송 누를 시*/
function sendSMS(){
	   $inputPhoneNumber = $(".inputPhone").val();
	   console.log($inputPhoneNumber);
	   $.ajax({
		   url : "/mypage/send.my",
		   type : "post",
		   data: {inputPhoneNumber: $inputPhoneNumber},
		   success : function (result) {
			$smsNumber = result;
			}
	   })
   }

/*인증번호 체크*/
function checkSMS(){
	$smsCheckNumber = $("#myNumber").val();
	console.log($smsNumber); 
	console.log($smsCheckNumber);
	if($smsCheckNumber == $smsNumber){
		console.log("인증번호 일치!")
		 $('#smsEqual').css('visibility', '');
		 $('#smsNotEqual').css('visibility', 'hidden');
		 $isCheck = true;
	}else{
		console.log("인증번호가 틀렸습니다")
		 $('#smsEqual').css('visibility', 'hidden');
		 $('#smsNotEqual').css('visibility', '');
		 $("#myNumber").focus();
		 $isCheck = true;
	}
}

/*완료 버튼 누를 시*/
	function send(){
	//8자리 이상, 대문자/소문자/숫자/특수문자 모두 포함되어 있는 지 검사
	var pwCheck = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	//한글이 포함되었는 지 검사
	var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//같은 문자 4번 이상
	var wordCheck = /(\w)\1\1\1/;
	//공백검사
	var spaceCheck = /\s/;
	
	/*변경할 패스워드*/
	 let $pw = $("#password").val();
    //변경할 패스워드 확인
	 let $pw_check = $("#passwordCheck").val();
	console.log($pw);
	console.log($pw_check);
		
		/*email 입력 안할 시 focus*/
		if(!detailForm.email1.value || !detailForm.email2.value){
     			 detailForm.email1.focus();
      			return;

    	}
		/*패스워드 유효성 검사*/
		if(!pwCheck.test(detailForm.password.value)){
				alert("비밀번호를 확인해주세요.");
       	return;
     	}
     	if(hangleCheck.test(detailForm.password.value)){
       		alert("비밀번호를 확인해주세요.");
       	return;
     	}
     	if(wordCheck.test(detailForm.password.value)){
     	 alert("비밀번호를 확인해주세요.");
       	return;
     	}
     	if(spaceCheck.test(detailForm.password.value)){
      	alert("비밀번호를 확인해주세요.");
      	 return;
     	}
     	if(detailForm.password.value.length < 10 || detailForm.password.value.length > 20){
       	alert("비밀번호를 확인해주세요.");
       		return;
     	}		
		
		console.log("들어옴0");
		if(!detailForm.password.value){
			detailForm.password.focus();
			console.log("들어옴1")
			return;
		}
		
		detailForm.submit();
}
		
	
