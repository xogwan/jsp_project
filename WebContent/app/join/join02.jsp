<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>너와 농부싶어 - 본인인증</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/join/join02.css">
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


    <!-- ======================================================↑ 서브헤더 ==================================================================== -->
    <div id="lgr_join_process">
        <div class="lgr_middle_process">
            <div class="lgr_step2">
                STEP 01
            </div>
            <div class="lgr_step_text2">회원가입 약관</div>
        </div>
        
        <div class="lgr_now_process">
            <div class="lgr_step1">
                STEP 02
            </div>
            <div class="lgr_step_text1">회원정보입력</div>
            <div id="lgr_triangle"></div>
        </div>
        
        <div class="lgr_middle_process">
            <div class="lgr_step2">
                STEP 03
            </div>
            <div class="lgr_step_text2">회원가입 완료</div>
        </div>
    </div><!-- =========================================================================================================================================== -->
    <div class="join_content">
        <form method="post" action="${pageContext.request.contextPath}/member/joinOk.me" name="detailForm">
            <table class="detail_table">
                <tbody><tr>
                    <th><p class="farmlist">구분</p></th>
                    <td>
						<label class="grade">
						   <input type="radio" name="memberGrade" id="default_grade" value="1"/> 일반인
						</label>
						<label class="grade">
						   <input type="radio" name="memberGrade" value="-1"/> 농장주
						</label>
                        <span class="error_next_box u_black" id="farmer_user" style="visibility: hidden;" aria-live="assertive">농장주만 아르바이트, 체험 프로그램 혹은 멘토 홍보글을 등록할 수 있습니다.</span>
						
					</td>
                    <th class="lgr_border_th">비밀번호
                        <p class="lgr_strong">*</p>
                    </th>
                    <td><input id="password" name="memberPassword" class="w_full" placeholder="비밀번호는 대/소문자, 숫자, 특수문자 조합 10글자 이상입니다." type="password" value="">
                    <span class="form_error" data-path="password" id="passwordMsg"></span></td>
                </tr>
                <tr id="lgr_usernm">
                    <th><label for="telNo">아이디</label>
                    <p class="lgr_strong">*</p></th>
                    <td>
                        <input id="userId" name="memberId" type="text" placeholder="아이디를 입력해주세요.">
                        
                        <!-- 중복체크 문구입니다. css 910번째 줄 확인 요망 -->
                        <span class="error_next_box" id="idMsg" ></span>
                        
                    </td>
                    <th class="lgr_border_th"><label for="passwordCheck">비밀번호확인</label>
                    <p class="lgr_strong">*</p></th>
                    <td><input id="passwordCheck" name="passwordCheck" placeholder="비밀번호를 다시 입력해주세요." type="password" value=""><span class="form_error" data-path="passwordCheck"></span>
                        <!-- 비밀번호와 비밀번호 확인에 입력한 텍스트가 일치하는지 jon_check.js에서 검사 -->
                        <span class="error_next_box" id="passwordMsg"></span>
                    </td>
                </tr>
                <tr>
                    <th><label for="userNm">이름</label>
                    <p class="lgr_strong">*</p></th>
                    <td>
                    	<input id="userNm" name="memberName" type="text" placeholder="이름을 입력해주세요."><span class="form_error"></span>
                   <span class="error_next_box" id="nameMsg"></span>
                    </td>
                    <th class="lgr_border_th">휴대폰 인증
                        <p class="lgr_strong">*</p>
                    </th>
                <div class="phone">
                    <td>
                        <div class="fixedPsize">
                            <div class="phoneSize"> 
                                <label class="phone">
                                
                                    <input type="text" name="memberPhoneNumber" class="phoneNum" value="" placeholder="휴대폰 번호(-제외)를 입력해주세요.">
                            </div>    
                                <div class="fixedBtnSize">
                                    <button type="button" id="numberButton" class="btn_phoneNum" name="numberButton" onclick="sendSms()">인증번호 받기</button>
                                </div>
                        
                            </div>
                            
                                
                             </label>
                           <div class="fixedPsize">  
                           
                            <input type="text" id = "phoneCode" class="phoneconfirm" name="phoneCode" placeholder="인증번호를 입력해주세요.">
                            <div class="fixedBtnSize">
                                <button type="button" class=" btn_confirmNum code_check_btn" onclick="checkSms()">확인</button>
                            </div>
                        </div>
                         <span class="error_next_box" id="phoneNumberMsg" ></span>
                    </td>
                    
                </div>
                </tr>
    
                <tr id="lgr_location">
                    <th class="email"><label for="email">EMAIL</label>
                    <p class="lgr_strong">*</p></th>
                    <td class="email">
                        <div class="email">
                            <input type="text" class="id" value="" data-path="email" name="memberEmail" >
    <span class="hipen">@</span>
    <select class="domain" data-path="email" name="emailDomain" id="emailSelect">
        <option value="" selected="">--선택--</option>
        <option value="naver.com">naver.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option>
        <option value="yahoo.co.kr">yahoo.co.kr</option>
        <option value="daum.net">daum.net</option>
    </select>
    
    <input type="text" class="etc" value="" data-path="email" style="display:none;">
        </div> <input id="email" type="hidden" value="">
        <span class="form_error" data-path="email"></span>
         <input type="hidden" id="email_email">
     <span class="error_next_box" id="emailMsg"></span>
                    </td>
                    <th class="lgr_border_th">지역</th>
                    <td><select id="userInfo01" name="userInfo01" class="area1" onchange="clickCityChange(this)">
                        <option value="">-선택-</option>
                        <option value="서울특별시">서울특별시</option>
                        <option value="부산광역시">부산광역시</option>
                        <option value="대구광역시">대구광역시</option>
                        <option value="인천광역시">인천광역시</option>
                        <option value="대전광역시">대전광역시</option>
                        <option value="울산광역시">울산광역시</option>
                        <option value="세종특별자치시">세종특별자치시</option>
                        <option value="경기도">경기도</option>
                        <option value="강원도">강원도</option>
                        <option value="충청북도">충청북도</option>
                        <option value="충청남도">충청남도</option>
                        <option value="전라북도">전라북도</option>
                        <option value="전라남도">전라남도</option>
                        <option value="경상북도">경상북도</option>
                        <option value="경상남도">경상남도</option>
                    </select>
                    <select id="userInfo02" name="userInfo02" class="area2">
                        <option value="">-선택-</option>
                    </select>
                    </td>
                </tr>
            </tbody>
            </table>
            <div class="btn_wrap">
                <ul>
                    <li id="lgr_cancel"><a href="http://127.0.0.1:5500/join_agree/join01.html">취소</a>
                    </li>
                    <li id="lgr_submit"><a class="agree" href="javascript:void(o);" onclick="join()">회원가입</a></li>
                </ul>
            </div>
        </form>
    </div>

   <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/join/join_check.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/join/ca_address.js"></script>


</html>