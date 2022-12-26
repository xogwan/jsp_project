<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너와 농부싶어 - 로그인</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets//css/login/famer_login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets//css/login/pw.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets//css/login/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets//css/login/layer_popup.css">
</head>

<body>	
		<c:if test="${not empty param.login}">
			<script>
				alert("아이디 또는 비밀번호를 다시 확인해주세요.");
			</script>
		</c:if>

  <jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
 
    <section class="login" id="site_main">
        <div class="sub_title">
            <div class="container">
                <div class="inner">
                    <div class="title_left_box">
                        <div id="snb_wrap" class="snb_wrap">
                            <nav id="snb" class="snb">
                                <div class="top">로그인</div>
                            </nav>
                        </div>
                    </div>
                    <div class="title_right_box">
                        <img src="https://www.rda.go.kr/young/images/site/login/sub06_img_cha.png" alt="로그인 타이틀 사진">
                    </div>
                </div>
            </div>
        </div>
        <div class="login_box">
            <div id="lgr_top_wrap">
                <div id="lgr_topimg_wrap">
                    <img src="https://www.rda.go.kr/young/images/site/login/login01.png">
                </div>
                <div id="lgr_toptext_box">
                    <div id="lgr_toptext_title">
                        나는 너와 농부싶어!!
                        <div id="lgr_mobbr"></div>
                        방문을 환영합니다!!
                    </div>
                    <div id="lgr_toptext_sub">비밀번호는 대소문자를 구분합니다. 확인 후 입력해주세요.</div>
                </div>
            </div>
    	<form method="post" action="${pageContext.request.contextPath}/member/loginOk.me" name="loginForm">
            <div class="login_input" id="lgr_login_idinput">
                <input type="text" id="inputId" placeholder="아이디를 입력해주세요." autocomplete="off" name="memberId" value="${empty memberId ? '' : memberId}"/>
                <img id="lgr_idimg1" src="https://www.rda.go.kr/young/images/site/login/login02_1.png">
                <img id="lgr_idimg1" src="https://www.rda.go.kr/young/images/site/login/login02_2.png">
            </div>
            <div class="login_input" id="lgr_login_pwinput">
                <input type="password" id="inputPw" placeholder="비밀번호를 입력해주세요." autocomplete="off" name="memberPassword">
                <img id="lgr_pwimg1" src="https://www.rda.go.kr/young/images/site/login/login03_1.png">
                <img id="lgr_pwimg2" src="https://www.rda.go.kr/young/images/site/login/login03_2.png">

            </div>
            <div id="lgr_idrem_wrap">

                <input id="lgr_check" type="checkbox" name="saveId" value="saveId">
                <div id="lgr_idrem">
                    <label for="lgr_check">아이디 저장</label>
                </div>
            </div>
            <div class="login_btn">
                <a class="button" onclick="send()" href="javascript:void(0);">로그인</a>
            </div>
            <div class="user_btn">
                <ul style="padding-left: 20px; padding-right: 20px;">
                    <li>
                        <a style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/member/join01.me'">회원가입</a>
                        <!--회원가입 버튼 클릭시 주소 이동 바꿔야함  -->
                    </li>
                    <li class="lgr_vertical_line"></li>
                    <li>
                        <a href="javascript:openPop_id()" >아이디 찾기</a>
                    </li>
                    <li class="lgr_vertical_line"></li>
                    <li>
                        <a href="javascript:openPop_pw()" onclick="alert('서비스를 준비중입니다.')">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>
      </form>
        </div>
    </section>



    <!-- 팝업 시작 - 아이디 찾기 -->
    <div class="popup_layer" id="fine_id_popup">
        <div class="popup_box">
            <div class="close-btn">
                <a href="javascript:closePop_id();"><img src="${pageContext.request.contextPath}/assets/images/login/close.png" class="find-id-close"></a>
            </div>
            <!--팝업 컨텐츠 영역-->
            <div class="popup_cont">
                <!-- 아이디 찾기 step1 -->
               <form method="post" action="#" name="findIdForm">
                <div class="find_id_wrap id_step1">
                    <div class="find_id_close"><span class="close_btn"></span></div>

                    <div class="pop_inner">
                        <div class="pop_top">
                            <img src="https://www.rda.go.kr/young/images/popup/login_ico_lock.png">
                            <h2>아이디 찾기</h2>
                            <span>이름과 휴대폰번호를 입력해주세요.</span>
                        </div>
                        
                            <div class="pop_con">
                                <div class="p_con_inner">
                                    <p>이름</p>
                                    <div class="p_inner_box">
                                        <input type="text" id="find_id_name" placeholder="이름을 입력해주세요." name="memberFindName">
                                    </div>
                                </div>

                                <div class="p_con_inner phoneNum">
                                    <p>휴대폰 번호</p>
                                    <div class="p_inner_box">
                                        <input type="text" id="find_id_phone" class="findId_phone" placeholder="휴대폰 번호(-제외)를 입력해주세요." name="memberFindPhoneNumber">
                                        <a href="javascript:void(0);" class="btn_phone btn_phone_id">인증번호 요청</a>
                                    </div>
                                </div>

                                <div class="p_con_inner findId_code">
                                    <p>인증 번호</p>
                                    <div class="p_inner_box">
                                        <input type="text" id="find_id_phone_code" placeholder="인증 번호를 입력해주세요." class="name_text">
                                        <span class="error_next_box" id="findIdMsg"></span>
                                    </div>
                                </div>
                            </div>
                        <div class="p_btn01">
                            <a href="javascript:void(0);" class="id_next_step">확인</a>
                        </div>

                    </div>

                    <div>
                    </div>
                </div>
                <!-- 아이디 찾기 step2 -->
                <div class="find_id_wrap id_step2">
                    <div class="pop_inner">
                        <div class="pop_top">
                            <img src="https://www.rda.go.kr/young/images/popup/login_ico_lock.png">
                            <h2>아이디 찾기</h2>
                            <span>회원님의 회원 아이디입니다.</span>
                        </div>
                        <div class="pop_con">
                            <div class="p_con_inner">
                                <p>회원님의 아이디</p>
                                <div class="p_inner_box"><p id="memberFindId" class="memberFindId"></p></div>
                            </div>

                            <div class="p_btn01">
                                <a href="javascript:closePop_id();" onclick="">확인</a>
                            </div>
                        </div>
                    </div>
                </div>
                </form>


            </div>
        </div>
    </div>


    <!-- 팝업 시작 - 비밀번호 찾기 -->
    <div class="popup_layer" id="fine_pw_popup">
        <div class="popup_box">
            <div class="close-btn">
                <a href="javascript:closePop_pw();"><img src="${pageContext.request.contextPath}/assets/images/login/close.png" class="find-id-close"></a>
            </div>
            <!--팝업 컨텐츠 영역-->
            <div class="popup_cont">
                <!-- 비밀번호 찾기 step1 -->
               <form name="findPwForm" method="post">
                <div class="find_pw_wrap pw_step1">
                    <div class="find_pw_close"><span class="close_btn"></span></div>

                    <div class="pop_inner">
                        <div class="pop_top">
                            <img src="https://www.rda.go.kr/young/images/popup/login_ico_lock.png">
                            <h2>비밀번호 찾기</h2>
                            <span>휴대폰번호와 아이디를 입력해주세요.</span>
                        </div>

                            <div class="pop_con">
                                <div class="p_con_inner">
                                    <p>아이디</p>
                                    <div class="p_inner_box">
                                        <input type="text" id="find_pw_name" placeholder="아이디를 입력해주세요." name="findPw_name">
                                    </div>
                                </div>

                                <div class="p_con_inner phoneNum">
                                    <p>휴대폰 번호</p>
                                    <div class="p_inner_box">
                                        <input type="text" id="find_pw_phone" class= "find_pw_phone" placeholder="휴대폰 번호(-제외)를 입력해주세요." name="findPw_phone">
                                        <a href="javascript:void(0);" class="btn_phone btn_phone_pw">인증번호 요청</a>
                                    </div>
                                </div>



                                <div class="p_con_inner findPw_code">
                                    <p>인증 번호</p>
                                    <div class="p_inner_box">
                                        <input type="text" id="find_pw_phone_code" placeholder="인증 번호를 입력해주세요."
                                            class="name_text">
                                    </div>
                                </div>
                            </div>

                        <div class="p_btn01">
                            <a href="javascript:void(0);" class="pw_next_step">확인</a>
                        </div>
                    </div>

                </div>

                <!-- 비밀번호 찾기 step2 -->
                <div class="find_id_wrap pw_step2">
                    <div class="pop_inner">
                        <div class="pop_top">
                            <img src="https://www.rda.go.kr/young/images/popup/login_ico_lock.png">
                            <h2>비밀번호 재설정</h2>
                            <span>비밀번호를 재설정해주세요.</span>
                        </div>


                        <!-- 비밀번호 일치하는지 검사 후 비밀번호 수정 완료 -->
                            <div class="pop_con">
                                <div class="p_con_inner">
                                    <p>새로운 비밀번호 입력</p>
                                    <div class="p_inner_box">
                                        <input type="password" id="newPassword" placeholder="●●●●●" name="password">
                                    </div>
                                </div>


                                <div class="p_con_inner bottom">
                                    <p>새로운 비밀번호 확인</p>
                                    <div class="p_inner_box">
                                        <input type="password" id="check_newPassword" placeholder="●●●●●" name="passwordCheck">
                                    </div>
                                    <p class="change_pw_check"></p>
                                </div>
                            </div>

                            <div class="pw_change">
                                <input type="button" value="비밀번호 변경" onclick="pwChange()"/>
                            </div>
                    </div>
                </div>
                        </form>


            </div>

        </div>
    </div>
  <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/common/header.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login/layer_popup.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login/password.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login/login_check.js"></script>
<script>
console.log(${memberId});
</script>
</html>