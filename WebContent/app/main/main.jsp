<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너와 농부싶어</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main/swiperbundlemin.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<body>
<section class="main" id="site_main">

<div id="lgr_body">
	<!-- 상단 이미지 위 요소들 -->
	<div id="lgr_top" >
		<div id="lgr_main_logo">
			<a href="${pageContext.request.contextPath}/index/main.ix"><img id="lgr_domain_logo" src="${pageContext.request.contextPath}/assets/images/common/logo_black.png" /></a>
		</div>
		<div id="lgr_top_textwrap">
			<img id="lgr_background_img" src="https://www.rda.go.kr/young/images/site/main/ma_img_background.png" />
			<!-- 좌측 텍스트 -->
            <div id="lgr_left">
                <div id="lgr_top_text" >
                    청년 농업인의<br>
                    내일을 <div><img  src="https://www.rda.go.kr/young/images/site/main/ma_img_effect.png"></div>합니다
                </div>
                <div id="lgr_top_subtext">
                    <span>창농·창업 준비부터 성공적인 영농정착까지!<br>청년농업인과 함께 만들고 이끌어 나가겠습니다.</span>
                </div>
            </div>
		</div> 
		<!-- 버튼 그룹 -->
        <div id="lgr_right">
            <div id="lgr_top_btn_season" onclick="location.href='${pageContext.request.contextPath}/policy/policys1.po'">
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_seasonmarket.png">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_seasonmarket.png">
                    </div>
                    <div class="lgr_top_btntext">
                        <span>청년농 지원정책</span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi">
                                <span>더보기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            <div id="lgr_top_btn2" onclick="location.href='${pageContext.request.contextPath}/cropsInfo/searchOk.ci'">
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu01.png" >
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu01_over.png" >
                    </div>
                    <div class="lgr_top_btntext">
                        <span>농업정보</span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi">
                            <span>더보기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            <div id="lgr_top_btn3"  onclick="location.href='${pageContext.request.contextPath}/program/applyListOk.pg'">
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu02.png">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu02_over.png" >
                    </div>
                    <div class="lgr_top_btntext">
                        <span>프로그램</span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi" style="display: inline">
                            <span>더보기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            <div id="lgr_top_btn4"  onclick="location.href='${pageContext.request.contextPath}/community/listOk.cm'">
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu03.png">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu03_over.png" >
                    </div>
                    <div class="lgr_top_btntext" >
                        <span>커뮤니티</span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi" style="display: inline">
                            <span>더보기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            <div id="lgr_top_btn5"  onclick="location.href='${pageContext.request.contextPath}/region/region.rg'">
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="	https://www.rda.go.kr/young/images/site/main/ma_ico_menu04.png">
                        <img src="	https://www.rda.go.kr/young/images/site/main/ma_ico_menu04_over.png" >
                    </div>
                    <div class="lgr_top_btntext">
                        <span>지역정보</span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi" style="display: inline">
                                <span>더보기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            <div id="lgr_top_btn6"  onclick="location.href='${pageContext.request.contextPath}/test/readyTest.te'">
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu05.png">
                        <img src="https://www.rda.go.kr/young/images/site/main/ma_ico_menu05_over.png" >
                    </div>
                    <div class="lgr_top_btntext">
                        <span>귀농 테스트</span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi" style="display: inline">
                                <span>더보기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            <c:choose>
              	<c:when test="${memberNumber != null}">
              		<div id="lgr_top_login" onclick="location.href='${pageContext.request.contextPath}/member/logout.me'">
              	</c:when>
              	<c:otherwise>
              		<div id="lgr_top_login" onclick="location.href='${pageContext.request.contextPath}/member/login.me'">
              	</c:otherwise>
           	</c:choose>
            
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="${pageContext.request.contextPath}/assets/images/main/login.png" >
                        <img src="${pageContext.request.contextPath}/assets/images/main/login_over.png" >
                    </div>
                    <div class="lgr_top_btntext">
                        <span>
                        <c:choose>
                        	<c:when test="${memberNumber != null}">로그아웃</c:when>
                        	<c:otherwise>로그인</c:otherwise>
                       	</c:choose>
                        </span>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi" style="display: inline">
                                <span>바로가기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
            
             <c:choose>
              	<c:when test="${memberNumber != null}"> <!-- 마이 페이지 한 번 확인해봐야 함  -->
              		<div id="lgr_top_join" onclick="location.href='${pageContext.request.contextPath}/mypage/mypageOk.my'">
             	</c:when>
	           	<c:otherwise>
	           		<div id="lgr_top_join" onclick="location.href='${pageContext.request.contextPath}/member/join01.me'">
	           	</c:otherwise>
	          </c:choose>
                <div class="lgr_top_menubtn">
                    <div class="lgr_top_imgwrap">
                        <img src="${pageContext.request.contextPath}/assets/images/main/user.png">
                        <img src="${pageContext.request.contextPath}/assets/images/main/user_over.png" >
                    </div>
                    <div class="lgr_top_btntext">
                        <c:choose>
                        	<c:when test="${memberNumber != null}">마이페이지</c:when>
                        	<c:otherwise>회원가입</c:otherwise>
                       	</c:choose>
                    </div>
                    <div class="lgr_top_btnbtn">
                        <div>
                            <div class="lgr_thebogi" style="display: inline">
                                <span>바로가기</span>
                            </div>
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more.png">
                            <img style="display: inline-block;" src="https://www.rda.go.kr/young/images/site/main/ma_ico_more_pink.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <div id="lgr_topbtn"><img src="https://www.rda.go.kr/young/images/site/main/common_btn_top.png"></div>
	<!-- 정책 정보 -->
	<div id="lgr_main_content">
		
		<div id="lgr_title">
			<span  id="lgr_jungbo">최신 체험 프로그램</span>
		</div>
		<div id="lgr_subtitle"><span>청년 농업인들을 위한 체험 프로그램을 모았습니다!</span></div>
		
		<form id="searchasForm" name="searchasForm"  method="post" autocomplete="off">
		<input type="hidden" name="search_category" value="">
		<input type="hidden" name="search_area1" value="">
		<input type="hidden" name="search_area2" value="">
		</form>
	<!-- 최근 게시글 -->
	
	<div id="lgr_recengroup">
		<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-41fc337125c5d9bd" aria-disabled="false"></div>
		<div class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-41fc337125c5d9bd" aria-disabled="true"></div>
		<!-- Swiper -->
		<div class="swiper customSwiper">
		  <ul class="swiper-wrapper">
		  	<c:choose>
		  			<c:when test="${programs != null and fn:length(programs) > 0}">
		  				<c:forEach var="program" items="${programs}">
		  					<li class="swiper-slide lgr_content"  onclick="location.href='${pageContext.request.contextPath}/program/apply01Ok.pg?programNumber=${program.getProgramNumber()}'">
								<!-- 카테고리 -->
								<div class="lgr_categorywrap">
									<div class="place_box"><div class="lgr_place"><p class="place_txt">${program.getProgramLocation()}</p></div></div>
								</div>
								<!-- 내용 -->
								<div class="lgr_subject"><span>${program.getProgramName()}</span></div>
								<div class="lgr_datebadge"><span>기간</span></div>
								<div class="lgr_date">~&nbsp;${program.getProgramApplyEndDate()}</div>
								<div class="lgr_more"><p style="display: inline; margin-right: -50px;">더보기</p></div>
							</li>
		  				</c:forEach>
		  			</c:when>
		  			<c:otherwise>
						<span  style="text-align:center; width:100%; padding-top: 100px; font-size: 20px;">등록된 프로그램이 없습니다.</span>
					</c:otherwise>
		  		</c:choose>
		  	</ul>
		  <div class="swiper-pagination"></div>
		</div>
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<script type="text/javascript">
			//슬라이드
			var swiper = new Swiper(".customSwiper", {
				slidesPerView: 'auto',
				spaceBetween: 18,
				pagination: {
					el: ".swiper-pagination",
					type: "pagination",
				 },
				navigation: {
					nextEl: ".swiper-button-next",
					prevEl: ".swiper-button-prev",
				},
			});
			
		</script>
	</div>
	</div>
	
	<!-- 이미지 -->
	<div id="lgr_middle" style="background-image: url(https://www.rda.go.kr/young/images/site/main/ma_img_listbg.png); height: 188px;">
		<div id="lgr_middle_textwrap">
			<span>청년 농이<br>
			<img src="https://www.rda.go.kr/young/images/site/main/ma_ico_curiosity.png" style="display: inline-block;"> 해하는 정보!
			</span>
			
		</div>
			
			
			<!-- 버튼 -->
			<div id="lgr_middlebtn_group">
					<div id="lgr_middlebtn1" onclick="alert('서비스를 준비중입니다.')">
						<div class="lgr_middlebtn_imgwrap">
							<img src="https://www.rda.go.kr/young/images/site/main/ma_ico_list03.png">
						</div>
						<div class="lgr_middelbtn_textwrap">
							<span>작물 정보</span>
						</div>
					</div>
				<div id="lgr_middlebtn2" onclick="alert('서비스를 준비중입니다.')">
					<div class="lgr_middlebtn_imgwrap">
						<img src="https://www.rda.go.kr/young/images/site/main/ma_ico_list05.png">
					</div>
					<div class="lgr_middelbtn_textwrap">
						<span>계절별 <br>작물 추천</span>
					</div>
				</div>
				
				<div id="lgr_middlebtn3" onclick="alert('서비스를 준비중입니다.')">
					<div class="lgr_middlebtn_imgwrap">
						<img src="https://www.rda.go.kr/young/images/site/main/ma_ico_list04.png">
					</div>
					<div class="lgr_middelbtn_textwrap">
						<span>지역별 <br>특산물 정보</span>
					</div>
				</div>
				<div id="lgr_middlebtn4" onclick="alert('서비스를 준비중입니다.')">
					<div class="lgr_middlebtn_imgwrap">
						<img src="https://www.rda.go.kr/young/images/site/main/ma_ico_list02.png">
					</div>
					<div class="lgr_middelbtn_textwrap">
						<span>작물 시세<br> 확인</span>
					</div>
				</div>
				
				<div id="lgr_middlebtn5" onclick="alert('서비스를 준비중입니다.')">
					<div class="lgr_middlebtn_imgwrap">
						<img src="https://www.rda.go.kr/young/images/site/main/ma_ico_list07.png">
					</div>
					<div class="lgr_middelbtn_textwrap">
						<span>병해충 정보</span>
					</div>
				</div>
				
				<div id="lgr_middlebtn6" onclick="alert('서비스를 준비중입니다.')">
					<div class="lgr_middlebtn_imgwrap">
						<img src="${pageContext.request.contextPath}/assets/images/main/spary.png">
					</div>
					<div class="lgr_middelbtn_textwrap">
						<span>농약 정보</span>
					</div>
				</div>
		</div>
	</div>


</section>
<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script type="text/javascript" src="/young/js/dist/local.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main/main.js"></script>
</html>