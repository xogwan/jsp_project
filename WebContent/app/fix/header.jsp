<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>document</title>
    <!-- 영어폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/header_origin.css">
</head>
<body>
<!-- 마우스 갖다대면 보이는 헤더 -->
    <div class="lgr_back">
        <div class="lgr_logo_head">
            <div class="lgr_backg_logo">
                <a href="${pageContext.request.contextPath}/index/main.ix"><img src="${pageContext.request.contextPath}/assets/images/common/logo_black.png" alt="메인 로고"
                        style="vertical-align: middle; display: inline-block;"></a>
            </div>
        </div>
        <div class="lgr_background_f9f9f9">
            <div class="lgr_background_003668">
                <img src="https://www.rda.go.kr/young/images/site/main/menu_bg.png" alt="메인 로고">
            </div>
            <div class="lgr_normal_link">
                <ul>
                    <li class="lgr_gnbhead" id="k1"><a href="javascript:void(0);">지원정책</a></li>
                    <li class="j1"><a href="${pageContext.request.contextPath}/policy/policys1.po">청년농 지원정책</a></li>
                </ul>
                <ul>
                    <li class="lgr_gnbhead"  id="k2"><a href="javascript:void(0);">농업정보</a></li>
                    <li class="j2"><a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci">작물 정보</a></li>
                    <li class="j2"><a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls">지역별 특산물 정보</a></li>
                    <li class="j2"><a href="${pageContext.request.contextPath}/season/info.sc">계절별 작물 추천</a></li>
                    <li class="j2"><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">작물 시세 확인</a></li>
                    <li class="j2"><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">병해충 정보</a></li>
                    <li class="j2"><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">농약 정보</a></li>
                </ul>
                <ul>
                    <li class="lgr_gnbhead" id="k3" ><a href="javascript:void(0);" >프로그램</a></li>
                    <li class="j3"><a href="${pageContext.request.contextPath}/program/applyListOk.pg">농촌 체험 프로그램 신청</a></li>
                    <li class="j3"><a href="${pageContext.request.contextPath}/alba/applyListOk.ab">농촌 아르바이트 신청</a></li>
                </ul>
                <ul>
                    <li class="lgr_gnbhead"  id="k4"><a href="javascript:void(0);" >커뮤니티</a></li>
                    <li class="j4"><a href="${pageContext.request.contextPath}/notice/detailOK.nt">공지사항</a></li>
                    <li class="j4"><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">멘토 홍보 게시판</a></li>
                    <li class="j4"><a href="${pageContext.request.contextPath}/community/listOk.cm">소통공간</a></li>
                </ul>
                <ul>
                    <li class="lgr_gnbhead"  id="k5"><a href="javascript:void(0);" >지역정보</a></li>
                    <li class="j5"><a href="${pageContext.request.contextPath}/region/region.rg">마을회관 정보</a></li>
                </ul>
                <ul>
                    <li class="lgr_gnbhead"  id="k6"><a href="javascript:void(0);" >귀농 테스트</a></li>
                    <li class="j6"><a href="${pageContext.request.contextPath}/test/readyTest.te">귀농 준비도 테스트</a></li>
                    <li class="j6"><a href="${pageContext.request.contextPath}/test/readyCheck.te">귀농 단계별 체크리스트</a></li>
                </ul>
            </div>
        </div>
    </div>
<!-- 헤더 -->
    <header class="header">
        <div class="logo_wrap">
            <div class="header_container">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/index/main.ix" title="홈"><img src="${pageContext.request.contextPath}/assets/images/common/logo_black.png"
                            alt="똑똑! 청년농부"></a>
                </div>
                <div id="gnb_wrap" class="gnb_wrap">
                    <nav id="gnb" class="gnb">
                        <ul data-level="1">
                            <li><a href="javascript:void(0);">
                                    <span>지원정책</span>
                                </a>
                                <ul style="text-align: right;" data-level="2">
                                    <li><a href="${pageContext.request.contextPath}/policy/policys.po">
                                            <span>청년농 지원정책</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);">
                                    <span>농업정보</span>
                                </a>
                                <ul style="text-align: right;" data-level="2">
                                    <li><a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci">
                                            <span>작물정보</span>
                                        </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/season/info.sc">
                                            <span>계절별 작물 추천</span>
                                        </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls">
                                            <span>지역별 특산물 정보</span>
                                        </a>
                                    </li>
                                    <li><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">
                                            <span>작물 시세 확인</span>
                                        </a>
                                    </li>
                                    <li><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">
                                            <span>병해충 정보</span>
                                        </a>
                                    </li>
                                    <li><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">
                                            <span>농약 정보</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);" >
                                    <span>프로그램</span>
                                </a>
                                <ul style="text-align: right;" data-level="2">
                                    <li><a href="${pageContext.request.contextPath}/program/applyListOk.pg" >
                                            <span>농촌 체험 프로그램 신청</span>
                                        </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/alba/applyListOk.ab" >
                                            <span>농촌 아르바이트 신청</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);">
                                <span>커뮤니티</span>
                            </a>
                            <ul style="text-align: right;" data-level="2">
                                    <li><a href="${pageContext.request.contextPath}/notice/detailOK.nt" >
                                        <span>공지사항</span>
                                        </a>
                                    </li>
                                    <li><a href="javascript:void(0)" onclick="alert('서비스를 준비중입니다.')">
                                            <span>멘토 홍보 게시판</span>
                                        </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/community/listOk.cm" >
                                            <span>소통공간</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);" >
                                    <span>지역정보</span>
                                </a>
                                <ul style="text-align: right;" data-level="2">
                                    <li><a href="${pageContext.request.contextPath}/region/region.rg" >
                                        <span>마을회관 정보</span>
                                    </a>
                                </li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);" >
                                    <span>귀농 테스트</span>
                                </a>
                                <ul style="text-align: right;" data-level="2">
                                    <li><a href="${pageContext.request.contextPath}/test/readyTest.te" >
                                            <span>귀농 준비도 테스트</span>
                                        </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/test/readyCheck.te" >
                                            <span>귀농 단계별 체크리스트</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                  
                </div>
            </div>
            <div class="usermenu">
            	<c:choose>
            		<c:when test="${empty memberNumber}">
               			 <div id="lgr_login" onclick="location.href='${pageContext.request.contextPath}/member/login.me'">로그인</div>
               			 <div id="lgr_join" onclick="location.href='${pageContext.request.contextPath}/member/join01.me'">회원가입</div>
               		</c:when>
                	<c:otherwise>
              			 <div id="lgr_login" onclick="location.href='${pageContext.request.contextPath}/member/logout.me'">로그아웃</div>
                		<div id="lgr_join" onclick="location.href='${pageContext.request.contextPath}/mypage/mypageOk.my'">마이페이지</div>
               		</c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="lgr_topbtn"><img src="https://www.rda.go.kr/young/images/site/main/common_btn_top.png"></div>
    </header>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/common/header.js"></script>
</html>