<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/font.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/main_contents.css"/>
        
   <title>관리자-메인</title>
</head>

<body>

   <div id="wrapper">
      <!-- 세로 메뉴바 -->
		<jsp:include page="${pageContext.request.contextPath}/app/admin/admin_menu.jsp"/>

      <!-- 헤더 ~ 밑에 메인 컨텐츠 -->
      <div id="container">
         <!-- 헤더 -->
         <header>
            <span id="admin-header-title" class="short">메인</span>
            <span id="admin-mode">관리자 모드</span>
            <span id="userCount">가입된 회원 수 총 <strong> <c:out value="${total}"/> </strong>명</span>
         </header>

         <!-- 메인화면 컨텐츠 -->
         <div id="content-wrap-top" class="content-wrap">

            <div class="contents">
               <div class="content-title">
                  <div class="title">방문자 현황</div>
               </div>
               <div class="c-content">
                  <!-- 차트 -->
                  <div id="lineChart"></div>
               </div>
            </div>

            <div class="contents">
               <div class="content-title none">
                  <div class="title">일자별 통계</div>
                  <div class="title2">월별</div>
               </div>
               <div class="c-content">
                  <table>
                     <tr>
                        <th>일자</th>
                        <th>체험 신청</th>
                        <th>알바 신청</th>
                        <th>가입</th>
                        <th>방문자</th>
                        <th>게시글</th>
                        <th>댓글 수</th>
                     </tr>
                     <tr class="check">
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>4</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>2022-09-30</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                     </tr>
                     <tr>
                        <td>이번달 합계</td>
                        <td>12건</td>
                        <td>7건</td>
                        <td>7명</td>
                        <td>1명</td>
                        <td>8</td>
                        <td>8</td>
                     </tr>
                  </table>
               </div>
            </div>

         </div>
         <div class="content-wrap">

            <div class="c-w-wrap">

               <!-- 최신 유저 -->
               <div class="contents small">
                  <div class="content-title">
                     <div class="title">최근 가입한 사용자</div>
                     <div class="title2">
                           <a href="${pageContext.request.contextPath}/admin/User.ad">더보기 →</a>
                     </div>
                  </div>
                  <div class="c-content">
                     <table>
                        <colgroup>
                           <col width="18%;">
                           <col width="34%;">
                           <col width="18%;">
                           <col width="10%;">
                           <col width="20%;">
                        </colgroup>
                        <tbody>
                        	<!-- 유저관리 목록 -->
                    		<c:forEach var="mainUserList" items="${userList}">
                   				 <tr>
	                    			<td><c:out value="${mainUserList.getMemberName()}"/></td>
	                    			<td><c:out value="${mainUserList.getMemberEmail()}"/></td>
	                    			<td><c:out value="${mainUserList.getMemberPhoneNumber()}"/></td>
	                    			<td><c:out value="${mainUserList.getMemberLocation()}"/></td>
	                    			<td><c:out value="${mainUserList.getMemberJoinDate()}"/></td>
                    			</tr>
                    		</c:forEach>
         
                           <!-- tr>
                              <td class="name">[홍길동]</td>
                              <td class="email">java11@gamil.com</td>
                              <td>010-1234-1234</td>
                              <td>서울</td>
                              <td class="date">2022-10-03 10:00</td>
                           </tr> -->
                        </tbody>
                     </table>
                  </div>
               </div>

               <!-- 댓글 -->
               <div class="contents small">
                  <div class="content-title">
                     <div class="title">댓글 관리</div>
                     <div class="title2">
                           <a href="${pageContext.request.contextPath}/admin/ReplyOk.ad">더보기 →</a>
                     </div>
                  </div>
                  <div class="c-content">
                     <table>
                        <colgroup>
                           <col width="30%;">
                           <col width="50%;">
                           <col width="20%;">
                        </colgroup>
                        <tbody class="reply">
                           <!-- 소통공간 게시글 최근 순 출력 (5개) -->
                           <c:forEach var="ReplyList" items="${replyList}">
                   				 <tr>
	                    			<td style="padding-left:40px"><c:out value="${ReplyList.getMemberName()}"/></td>
	                    			<td><c:out value="${ReplyList.getReplyContent()}"/></td>
	                    			<td><c:out value="${ReplyList.getReplyDate()}"/></td>
                    			</tr>
                    		</c:forEach>
                    <!--        <tr>
                              <td class="name">[김지연]</td>
                              <td class="content">안녕하세요~</td>
                              <td class="date">2022-10-03 10:00</td>
                           </tr> -->
                        </tbody>
                     </table>
                  </div>
               </div>

            </div>

            <div class="c-w-wrap">

               <!-- 멘토 홍보 -->
               <div class="contents small">
                  <div class="content-title">
                     <div class="title">멘토홍보</div>
                     <div class="title2">
                           <a href="${pageContext.request.contextPath}/admin/MentorOk.ad">더보기 →</a>
                     </div>
                  </div>
                  <div class="c-content">
                     <table>
                        <colgroup>
                           <col width="20%;">
                           <col width="20%;">
                           <col width="20%;">
                           <col width="20%;">
                        </colgroup>
                        <tbody>
                           <!-- 멘토홍보 게시글 최근 순 출력 (5개) -->
                            <c:forEach var="MentorList" items="${mentorList}">
                   				 <tr>
	                    			<td>[<c:out value="${MentorList.getMentorLocation()}"/>]</td>
	                    			<td>[<c:out value="${MentorList.getMentorCrops()}"/>]</td>
	                    			<td><c:out value="${MentorList.getMentorName()}"/></td>
	                    			<td><c:out value="${MentorList.getMentorDate()}"/></td>
                    			</tr>
                    		</c:forEach>
                       <!--     <tr> [지역][주작목] - 이름
                              <td class="name">[경기도][블루베리] - 홍길동</td>
                              <td class="date">2022-10-03 10:00</td>
                           </tr> -->
                         
                        </tbody>
                     </table>
                  </div>
               </div>

               <!-- 소통 공간 -->
               <div class="contents small">
                  <div class="content-title">
                     <div class="title">소통공간</div>
                     <div class="title2">
                           <a href="${pageContext.request.contextPath}/admin/CommunityOk.ad">더보기 →</a>
                     </div>
                  </div>
                  <div class="c-content">
                     <table>
                        <colgroup>
                           <col width="80%;">
                           <col width="20%;">
                        </colgroup>
                        <tbody>
                           <!-- 소통공간 게시글 최근 순 출력 (5개) -->
                             <c:forEach var="CommunityList" items="${communityList}">
                   				 <tr>
	                    			<td><c:out value="${CommunityList.getCommunityTitle()}"/></td>
	                    			<td><c:out value="${CommunityList.getCommunityDate()}"/></td>
                    			</tr>
                    		</c:forEach>
                           <!-- <tr>
                              <td class="title" onclick="location.href='#'">요즘 관심가지고 있는 파테크 아시냐요?</td>
                              <td class="date">2022-10-03 10:00</td>
                           </tr> -->
                          
                        </tbody>
                     </table>
                  </div>
               </div>

            </div>

         </div>

      </div>

   </div>

</body>
<!-- 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/admin/chartAPI.js"></script>
</html>