<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/side_menu.css"/>
</head>
<body>

      <!-- 세로 메뉴바 -->
      <nav>
         <div id="team-logo"><a href="${pageContext.request.contextPath}/admin/MainUserOk.ad">너와농부싶어</a></div>

         <div id='side-menu'>
            <div class="side-menu-contents">
               <a href="${pageContext.request.contextPath}/index/main.ix"><span>사이트 바로가기</span></a>
            </div>
            <div class="menu-title">사이트 관리</div>
            <ul>
               <li class='active sub-menu'><a href='#'><span>사용자</span><span class="toggleBtn2">+</span></a>
                  <ul>
                     <li><a href='${pageContext.request.contextPath}/admin/User.ad'><span>사용자 관리</span></a></li>
                  </ul>
               </li>

               <li class='active sub-menu'><a href='#'><span>컨텐츠 관리</span><span class="toggleBtn2">+</span></a>
                  <ul>
                     <li class='sub-menu'><a href='#' class="toggleBtn"><span>농촌 체험 프로그램</span></a>
                        <ul>
                           <li><a href='${pageContext.request.contextPath}/admin/ProgramApplyMemberOk.ad'><span>프로그램 지원자 관리</span></a></li>
                           <li><a href='${pageContext.request.contextPath}/admin/ProgramListOk.ad'><span>체험 프로그램 글 관리</span></a></li>
                        </ul>
                     </li>
                     <li class='sub-menu'><a href='#' class="toggleBtn"><span>농촌 아르바이트</span></a>
                        <ul>
                           <li><a href='${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad'><span>아르바이트 지원자 관리</span></a></li>
                           <li><a href='${pageContext.request.contextPath}/admin/AlbaListOk.ad'><span>아르바이트 공고 글 관리</span></a></li>
                        </ul>
                     </li>
                  </ul>
               </li>

               <li class='active sub-menu last-menu'><a href='#' class="toggleBtn"><span>게시판 관리</span></a>
                  <ul>
                     <li class='sub-menu'><a href='#' class="toggleBtn"><span>공지</span></a>
                        <ul>
                           <li><a href='${pageContext.request.contextPath}/admin/NoticeListOk.ad'><span>공지 관리</span></a></li>
                           <li class='last-menu'><a href='${pageContext.request.contextPath}/admin/NoticeWrite.ad'><span>공지 글 작성</span></a></li>
                        </ul>
                     </li>
                     <li><a href='${pageContext.request.contextPath}/admin/MentorOk.ad'><span>멘토 홍보</span></a></li>
                     <li><a href='${pageContext.request.contextPath}/admin/CommunityOk.ad'><span>소통공간</span></a></li>
                  </ul>
               </li>

               <li class='active sub-menu'><a href='#'><span>댓글</span><span class="toggleBtn2">+</span></a>
                  <ul>
                     <li><a href='${pageContext.request.contextPath}/admin/ReplyOk.ad'><span>댓글 관리</span></a></li>
                  </ul>
               </li>
            </ul>
         </div>
      </nav>
</body>
    <!-- 사이드 메뉴 -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/assets/js/admin/side_menu.js"></script>
</html>