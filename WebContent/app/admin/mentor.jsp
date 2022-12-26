<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
   		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/font.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/contents.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/mentor.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/board.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/form.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/page.css"/>
        
    <!-- 버튼 클릭 시 확인 알림창 -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/js/admin/check.js"></script>
    <title>관리자-멘토 홍보 관리</title>
</head>

<body>

    <div id="wrapper">
        <!-- 세로 메뉴바 -->
		<jsp:include page="${pageContext.request.contextPath}/app/admin/admin_menu.jsp"/>

        <!-- 헤더 ~ 밑에 메인 컨텐츠 -->
        <div id="container">
            <!-- 헤더 -->
            <header>
                <span id="admin-header-title">멘토 홍보 관리</span>
                <span id="admin-mode">관리자 모드</span>
                <span id="userCount">가입된 회원 수 총 <strong> <c:out value="${userTotalCount}"/> </strong>명</span>
            </header>

            <!-- 컨텐츠 검색 부분 -->
            <div class="p-contents chart-no">

                <!-- 검색어 입력 폼 -->
                <form action="" name="searchForm" method="post">
                    <div class="search-form">
                        <span class="s-form">
                            <select name="searchSelect" class="s-select">
                                <option value="title">제목</option>
                                <option value="id">아이디</option>
                                <option value="crop">주작목</option>
                                <option value="address">지역</option>
                            </select>
                        </span>
                        <span class="s-f-input">
                            <span class="search-input">
                                <input type="text" name="programSearch" placeholder="검색어를 입력하세요">
                            </span>
                        </span>
                        <button type="button" class="" onclick="ready()">
                            <img src="${pageContext.request.contextPath}/assets/images/common/search.png">
                        </button>
                    </div>
                </form>

            </div>

            <!-- 프로그램 리스트 출력 틀 -->
            <div class="p-contents contents-bottom">
                <span class="list-count">총
                    <span><c:out value="${total}"/></span>건
                </span>

                <table class="mentor">
                    <tr class="title">
                        <th class="num">번호</th>
                        <th class="title">제목</th>
                        <th class="main">주작목</th>
                        <th class="address">지역</th>
                        <th class="id">아이디</th>
                        <th class="email">이메일</th>
                        <th class="phone">전화번호</th>
                        <th class="file-check">첨부파일</th>
                        <th class="date">작성날짜</th>
                        <th class="delete"></th>
                    </tr>
                    <!-- ↓ 데이터 출력 -->
                    <tbody class="tbody">
                    <c:choose>
                    	<c:when test="${userList != null and fn:length(userList) > 0}">
                    		<c:forEach var="mentorList" items="${userList}">
                   				 <tr>
	                    			<td><c:out value="${mentorList.getMentorNumber()}"/></td>
	                    			<td><c:out value="${mentorList.getMentorTitle()}"/></td>
	                    			<td><c:out value="${mentorList.getMentorCrops()}"/></td>
	                    			<td><c:out value="${mentorList.getMentorLocation()}"/></td>
	                    			<td><c:out value="${mentorList.getMemberId()}"/></td>
	                    			<td><c:out value="${mentorList.getMentorEmail()}"/></td>
	                    			<td><c:out value="${mentorList.getMentorPhoneNumber()}"/></td>
	                    			<td><img src="${pageContext.request.contextPath}/assets/images/common/fileImage.png"></td><%-- <td><c:out value="${mentorList.getMentorImage()}"/></td> --%>
	                    			<td><c:out value="${mentorList.getMentorDate()}"/></td>
	                    			<td class="delete"><input type="button" value="삭제" onclick="deleteCheck(this); location.href = '${pageContext.request.contextPath}/admin/MentorDeleteOk.ad?mentorNumber=${mentorList.getMentorNumber()}';"></td>
                    			</tr>
                    		</c:forEach>
                    	</c:when>
                   </c:choose>
	                    			
                   <%--  <tr>
                        <td>1</td>
                        <td class="title">홍길동이 가르쳐줌</td>
                        <td>블루베리</td>
                        <td>경기도</td>
                        <td>아임멘토</td>
                        <td>imnongbu@naver.com</td>
                        <td>010-1234-1234</td>
                        <td><img src="${pageContext.request.contextPath}/assets/images/common/fileImage.png"></td>
                        <td>2022-10-03</td>
                        <td class="delete"><input type="button" value="삭제" onclick="deleteListCheck()"></td>
                    </tr> --%>
                </table>

                <!-- 페이징 -->
                <div id="page">
                    <div class="page_nation">
                    		<c:if test="${prev}">
		                        <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/admin/MentorOk.ad?page=1"></a>
		                        <a class="page-num arrow prev" href="${pageContext.request.contextPath}/admin/MentorOk.ad?page=${startPage -1}"></a>
		                    </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" >
                         <c:choose>
                        	<c:when test="${not (i eq page)}">
		                        <a href="${pageContext.request.contextPath}/admin/MentorOk.ad?page=${i}" class="page-num">
		                        <c:out value="${i}"/>
		                        </a>
                        	</c:when>
                        	<c:otherwise> 
                        		<a href="${pageContext.request.contextPath}/admin/MentorOk.ad?page=${i}" class="active">
		                       	 <c:out value="${i}"/>
		                        </a>
                        	</c:otherwise>
                        	</c:choose>
                        </c:forEach>
		                	   <c:if test="${next}">
		                        <a class="page-num arrow next" href="${pageContext.request.contextPath}/admin/MentorOk.ad?page=${endPage +1}"></a>
		                        <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/admin/MentorOk.ad?page=${realEndPage}"></a>
		                        </c:if>
                    </div>
                </div>

            </div>

        </div>

    </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function ready(){
			alert('검색기능 준비중입니다.');
	}
	</script>
<script src="${pageContext.request.contextPath}/assets/js/admin/mentor.js"></script>
</html>