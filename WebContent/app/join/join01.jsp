<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>너와 농부싶어 - 회원가입 약관</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/join/join01.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/join/common.css">
</head>
<body>  
  <jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
 <div class="sub_title">
        <div class="container">
            <div class="inner">
                <div class="title_left_box">
                    <div id="snb_wrap" class="snb_wrap">
                        <nav id="snb" class="snb">
                            <div class="top">회원가입</div>
                        </nav>
                    </div>
                </div>
                <div class="title_right_box">
                    <img src="https://www.rda.go.kr/young/images/site/login/sub06_img_cha.png" alt="로그인 타이틀 사진">
                </div>
            </div>
        </div>
    </div>



    <div id="lgr_join_process">
        <div class="lgr_now_process">
            <div class="lgr_step1">
                STEP 01
            </div>
            <div class="lgr_step_text1">회원가입 약관</div>
            <div id="lgr_triangle"></div>
        </div>
        
        
        <div class="lgr_middle_process">
            <div class="lgr_step2">
                STEP 02
            </div>
            <div class="lgr_step_text2">회원정보입력</div>
        </div>
        
        <div class="lgr_middle_process">
            <div class="lgr_step2">
                STEP 03
            </div>
            <div class="lgr_step_text2">회원가입 완료</div>
        </div>
    </div>
    <div class="join_wrap">
        <form id="detailForm" name="detailForm" method="post" action="${pageContext.request.contextPath}/member/join02.me">
            <input type="hidden" name="agree" value="true">
        <ul>
                         <li>
                                <div class="term_title">
                                    <div class="lgr_title_wrap">
                                    <label class="check" for="term_TERM0000000001">
                                        
                                        <i></i>·&nbsp;&nbsp;서비스 이용약관 입니다.</label>
                                    </div>
                                    <div class="lgr_detail_btn0" id="0">
                                        자세히 보기<img src="https://www.rda.go.kr/young/images/site/join/common_ico_down_b.png">
                                    </div>
                                    
                                    <div class="lgr_agreebtn_group1"><label>
                                        동의
                                        <span class="f_red">(필수)</span><input type="checkbox" id="term_TERM0000000001" class="checkTerm lgr_check necessary" value="TERM0000000001" onclick="fn_checkTerm();">
                                    </label></div>
                                </div>
                                <div class="term_box scroll_box" tabindex="0" id="10" style="display: none;">
									<div class="lgr_agree_text" id="b">제 1장 총칙<br>
<br>
제1조(목적)<br>
본 약관은 똑똑!청년농부(이하 "당 사이트")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임 사항과 기타 필요한 사항을<br>
규정함을 목적으로 합니다.<br>
<br>
제2조(용어의 정의)<br>
본 약관에서 사용하는 용어의 정의는 다음과 같습니다. ① 이용자 : 본 약관에 따라 당 사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
② 가 입 : 당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용 계약을 완료시키는 행위<br>
③ 회 원 : 당 사이트에 개인정보 등 관련 정보를 제공하여 회원등록을 한 개인(재외국민, 국내거주 외국인 포함)또는 법인으로서 당 사이트의 정보를 제공받으며, 당<br>
사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
④ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 문자와 숫자의 조합으로 설정한 고유의 체계<br>
⑤ 비밀번호 : 이용자와 아이디가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자가 자신이 선정한 문자와 숫자의 조합.<br>
⑥ 탈 퇴 : 회원이 이용계약을 종료 시키는 행위</div></div>
                         </li>
                        <li>
                                <div class="term_title">
                                    <div class="lgr_title_wrap">
                                    <label class="check" for="term_TERM0000000002">
                                        
                                        <i></i>·&nbsp;&nbsp;개인정보 수집 및 이용 약관</label>
                                    </div>
                                    <div class="lgr_detail_btn1" id="1">
										자세히 보기<img src="https://www.rda.go.kr/young/images/site/join/common_ico_down_b.png">
									</div>
                    
                                    <div class="lgr_agreebtn_group1"><label>
                                        동의
                                        <span class="f_red">(필수)</span><input type="checkbox" id="term_TERM0000000002" class="checkTerm lgr_check necessary" value="TERM0000000002" onclick="fn_checkTerm();">
                                            </label></div>
                                </div>
                                <div class="term_box scroll_box" tabindex="0" id="11" style="display: block;">
									<div class="lgr_agree_text" id="b">제 1장 총칙<br>
<br>
제1조(목적)<br>
본 약관은 똑똑한청년농부(이하 "당 사이트")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임 사항과 기타 필요한 사항을<br>
규정함을 목적으로 합니다.<br>
<br>
제2조(용어의 정의)<br>
본 약관에서 사용하는 용어의 정의는 다음과 같습니다. ① 이용자 : 본 약관에 따라 당 사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
② 가 입 : 당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용 계약을 완료시키는 행위<br>
③ 회 원 : 당 사이트에 개인정보 등 관련 정보를 제공하여 회원등록을 한 개인(재외국민, 국내거주 외국인 포함)또는 법인으로서 당 사이트의 정보를 제공받으며, 당<br>
사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
④ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 문자와 숫자의 조합으로 설정한 고유의 체계<br>
⑤ 비밀번호 : 이용자와 아이디가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자가 자신이 선정한 문자와 숫자의 조합.<br>
⑥ 탈 퇴 : 회원이 이용계약을 종료 시키는 행위</div></div>
                                
                                </li>
                        <li>
                                <div class="term_title"> 
                                    <div class="lgr_title_wrap">
                                    <label class="check" for="term_TERM0000000003">
                                        
                                        <i></i>·&nbsp;&nbsp;정보공개동의</label>
                                    </div>
                                    <div class="lgr_detail_btn2" id="2">
										자세히 보기<img src="https://www.rda.go.kr/young/images/site/join/common_ico_down_b.png">
									</div>
                                    
                                    <div class="lgr_agreebtn_group1"><label>
                                        동의
                                        <span class="f_red">(필수)</span><input type="checkbox" id="term_TERM0000000003" class="checkTerm lgr_check necessary" value="TERM0000000003" onclick="fn_checkTerm();">
                                           </label> </div>
                                </div>
                                <div class="term_box scroll_box" tabindex="0" id="12" style="display: none;">
                                    <div class="lgr_agree_text" id="b">제 1장 총칙<br>
<br>
제1조(목적)<br>
본 약관은 똑똑한청년농부(이하 "당 사이트")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임 사항과 기타 필요한 사항을<br>
규정함을 목적으로 합니다.<br>
<br>
제2조(용어의 정의)<br>
본 약관에서 사용하는 용어의 정의는 다음과 같습니다. ① 이용자 : 본 약관에 따라 당 사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
② 가 입 : 당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용 계약을 완료시키는 행위<br>
③ 회 원 : 당 사이트에 개인정보 등 관련 정보를 제공하여 회원등록을 한 개인(재외국민, 국내거주 외국인 포함)또는 법인으로서 당 사이트의 정보를 제공받으며, 당<br>
사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
④ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 문자와 숫자의 조합으로 설정한 고유의 체계<br>
⑤ 비밀번호 : 이용자와 아이디가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자가 자신이 선정한 문자와 숫자의 조합.<br>
⑥ 탈 퇴 : 회원이 이용계약을 종료 시키는 행위</div></div>
                                </li>
                        <li>
                                <div class="term_title">
                                    <div class="lgr_title_wrap">
                                    <label class="check" for="term_TERM0000000004">
                                        
                                        <i></i>·&nbsp;&nbsp;본 사이트는 14세 이상이며, 가입한 회원에게 더 많은 도움 정보를 제공하고 있습니다.</label>
                                    </div>
                                    <div class="lgr_agreebtn_group2"><label>
                                        동의
                                        <span class="f_red">(필수)</span><input type="checkbox" id="term_TERM0000000004" class="checkTerm lgr_check necessary" value="TERM0000000004" onclick="fn_checkTerm();">
                                         </label>   </div>
                                </div>
                                </li>
                        <li>
                                <div class="term_title">
                                    
                                    
                                    
                                    <div class="lgr_title_wrap">
                                    <label class="check" for="term_TERM0000000005">
                                        
                                        <i></i>·&nbsp;&nbsp;SMS 활용동의를 하지 않으실 경우, 문자를 활용한 모든 정보를 받으실 수 없습니다.</label>
                                    </div>
                                    <div class="lgr_agreebtn_group2"><label>
                                        동의
                                        <span>(선택)</span><input type="checkbox" id="term_TERM0000000005" class="checkTerm lgr_check" value="TERM0000000005" onclick="fn_checkTerm();">
                                         </label>   </div>
                                </div>
                                </li>
                        <li>
                                <div class="term_title">
                                    
                                    
                                    
                                    <div class="lgr_title_wrap">
                                    <label class="check" for="term_TERM0000000006">
                                        
                                        <i></i>·&nbsp;&nbsp;이메일 활용동의를 하지 않으실 경우, 이메일을 활용한 모든 정보를 받으실 수 없습니다.</label>
                                    </div>
                                    <div class="lgr_agreebtn_group2"><label>
                                        동의
                                        <span>(선택)</span><input type="checkbox" id="term_TERM0000000006" class="checkTerm lgr_check" value="TERM0000000006" onclick="fn_checkTerm();">
                                           </label> </div>
                                </div>
                                </li>
                        </ul>
        <div class="lgr_allbtn"><label>
            <input type="checkbox" id="allTermCheck" onclick="fn_allTermCheck();">&nbsp;상기 내용에 따른 모든 약관에 동의합니다.</label>
        </div>
    
        <div class="lgr_agree">
            <a class="agree" href="javascript:fn_agreeAction();">동의합니다.</a>
            <!-- 필수약관 전체선택 시 아래 주소로 넘어가야함 -->
            <!-- <a class="agreeMove" href="http://127.0.0.1:5500/join_page/join02.html"></a> -->
        </div>
        </form>
</div>
  <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>

</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/join/agree_check.js"></script>
</html>