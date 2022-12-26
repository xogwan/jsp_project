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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/participant.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/form.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/page.css"/>

    <!-- 버튼 클릭 시 확인 알림창 -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/admin/check.js"></script>
    <title>관리자-아르바이트 지원자 관리</title>
</head>

<body>

    <div id="wrapper">
        <!-- 세로 메뉴바 -->
		<jsp:include page="${pageContext.request.contextPath}/app/admin/admin_menu.jsp"/>

        <!-- 헤더 ~ 밑에 메인 컨텐츠 -->
        <div id="container">
            <!-- 헤더 -->
            <header>
                <span id="admin-header-title">아르바이트 지원자 관리</span>
                <span id="admin-mode">관리자 모드</span>
                <span id="userCount">가입된 회원 수 총 <strong> <c:out value="${userTotalCount}"/> </strong>명</span>
            </header>

            <!-- 컨텐츠 상단 통계 -->
            <div id="contents-top">
                <div class="content c-left">
                    <div class="title">Today</div>
                    <div id="counts-group">
                        <div class="counts">
                            <!-- 오늘 추가 되는 프로그램 수 -->
                            <div class="count-title">지원자</div>
                            <span class="count">1</span>
                        </div>
                    </div>
                </div>
                <!-- 차트 - 일주일 통계 -->
                <div class="content">
                    <div id="stickChart"></div>
                </div>
            </div>

            <!-- 컨텐츠 검색 부분 -->
            <div class="p-contents">

                <!-- 검색어 입력 폼 -->
                <form action="" name="searchForm" method="post">
                    <div class="search-form">
                        <span class="s-form">
                            <select name="searchSelect" class="s-select">
                                <option value="programName">아르바이트명</option>
                                <option value="id">아이디</option>
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
                
                <table>
                    <tr class="title">
                        <th class="num">번호</th>
                        <th class="id">아이디</th>
                        <th class="title">아르바이트명</th>
                        <th class="date">지원날짜</th>
                    </tr>
                    <!-- ↓ 데이터 출력 -->
                    <tbody>
                    <c:choose>
                    	<c:when test="${userList != null and fn:length(userList) > 0}">
                    		<c:forEach var="alba" items="${userList}">
                   				 <tr>
	                    			<td><c:out value="${alba.getAlbaNumber()}"/></td>
	                    			<td><c:out value="${alba.getMemberId()}"/></td>
	                    			<td><c:out value="${alba.getAlbaName()}"/></td>
	                    			<td><c:out value="${alba.getApplyDate()}"/></td>
                    			</tr>
                    		</c:forEach>
                    	</c:when>
                   </c:choose>
                  </tbody>
                    <!-- <tr>
                        <td>1</td>
                        <td>나랑농부할래</td>
                        <td class="title-none">잡초 뽑기</td>
                        <td>2022-10-03 10:00</td>
                    </tr> -->
                </table>

                <!-- 페이징 -->
                <div id="page">
                    <div class="page_nation">
                       <c:if test="${prev}">
		                        <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad?page=1"></a>
		                        <a class="page-num arrow prev" href="${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad?page=${startPage -1}"></a>
		                    </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" >
                         <c:choose>
                        	<c:when test="${not (i eq page)}">
		                        <a href="${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad?page=${i}" class="page-num">
		                        <c:out value="${i}"/>
		                        </a>
                        	</c:when>
                        	<c:otherwise> 
                        		<a href="${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad?page=${i}" class="active">
		                       	 <c:out value="${i}"/>
		                        </a>
                        	</c:otherwise>
                        	</c:choose>
                        </c:forEach>
		                	   <c:if test="${next}">
		                        <a class="page-num arrow next" href="${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad?page=${endPage +1}"></a>
		                        <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/admin/AlbaApplyMemberOk.ad?page=${realEndPage}"></a>
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
<!-- 차트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/admin/chartAPI_stick.js"></script>
</html>