<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
    	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/font.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/side_menu.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/contents.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/list.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/form.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/page.css"/>
        
    <!-- 사이드 메뉴 -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
            <script src="${pageContext.request.contextPath}/assets/js/admin/side_menu.js"></script>
    <!-- 정지 버튼 클릭 이벤트 -->
            <script src="${pageContext.request.contextPath}/assets/js/admin/disabled.js"></script>
    <!-- 버튼 클릭 시 확인 알림창 -->
            <script src="${pageContext.request.contextPath}/assets/js/admin/check.js"></script>
    <title>관리자-체험 프로그램 관리</title>
</head>

<body>

    <div id="wrapper">
        <!-- 세로 메뉴바 -->
		<jsp:include page="${pageContext.request.contextPath}/app/admin/admin_menu.jsp"/>

        <!-- 헤더 ~ 밑에 메인 컨텐츠 -->
        <div id="container">
            <!-- 헤더 -->
            <header>
                <span id="admin-header-title">농촌 프로그램 관리</span>
                <span id="admin-mode">관리자 모드</span>
                <span id="userCount">가입된 회원 수 총 <strong> <c:out value="${userTotalCount}"/> </strong>명</span>
            </header>

            <!-- 컨텐츠 상단 통계 -->
            <div id="contents-top">
                <div class="content c-left">
                    <div class="title">Today</div>
                    <div id="counts-group">
                        <div class="counts">
                            <!-- 오늘 신청 가능한 프로그램 수 -->
                            <div class="count-title">신청 가능</div>
                            <span class="count">1</span>
                        </div>
                        <div class="counts">
                            <!-- 오늘 신청 마감 되는 프로그램 수 -->
                            <div class="count-title">신청 마감</div>
                            <span class="count">2</span>
                        </div>
                    </div>
                </div>
                <!-- 차트 - 하루에 추가된 프로그램 수를 7일치 -->
                <div class="content">
                    <div id="lineChart"></div>
                </div>
            </div>

            <!-- 컨텐츠 검색 부분 -->
            <div class="p-contents">

                <!-- 검색어 입력 폼 -->
                <form action="" name="searchForm" method="post">
                    <div class="search-form">
                        <span class="s-form">
                            <select name="searchSelect" class="s-select">
                                <option value="programName">프로그램명</option>
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
                        <th class="num">글 번호</th>
                        <th class="title">프로그램명</th>
                        <th class="address">지역</th>
                        <th class="date-start">신청시작</th>
                        <th class="date-end">신청마감</th>
                        <th class="manpower">인원</th>
                        <th class="date">작성날짜</th>
                        <th class="delete"></th>
                    </tr>
                    <!-- ↓ 데이터 출력 -->
                    <tbody class="tbody">
                      <c:choose>
                    	<c:when test="${userList != null and fn:length(userList) > 0}">
                    		<c:forEach var="programList" items="${userList}">
                   				 <tr>
	                    			<td><c:out value="${programList.getProgramNumber()}"/></td>
	                    			<td><c:out value="${programList.getProgramName()}"/></td>
	                    			<td><c:out value="${programList.getProgramLocation()}"/></td>
	                    			<td><c:out value="${programList.getProgramApplyStartDate()}"/></td>
	                    			<td><c:out value="${programList.getProgramApplyEndDate()}"/></td>
	                    			<td><c:out value="${programList.getProgramRecruitedCount()}"/>/<c:out value="${programList.getProgramRecruitedTotalCount()}"/></td>
	                    			<td><c:out value="${programList.getProgramDate()}"/></td>
	                    			<td class="delete"><input type="button" value="삭제" onclick="deleteCheck(this); location.href = '${pageContext.request.contextPath}/admin/ProgramListDeleteOk.ad?programNumber=${programList.getProgramNumber()}';"></td>
                    			</tr>
                    		</c:forEach>
                    	</c:when>
                   </c:choose>
                      <!--   <tr>
                            <td>12432</td>
                            <td class="title" onclick="location.href='#'">비료뿌리기</td>
                            <td>서울</td>
                            <td>2022-10-07</td>
                            <td>2022-10-08</td>
                            <td>2/4</td>
                            <td>2022-10-03 10:00</td>
                            <td class="delete"><input type="button" name="delete" value="삭제" onclick="deleteCheck()">
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td class="title" onclick="location.href='#'">잡초 뽑기</td>
                            <td>서울</td>
                            <td>2022-10-11</td>
                            <td>2022-10-11</td>
                            <td>1/2</td>
                            <td>2022-10-03 10:00</td>
                            <td class="delete"><input type="button" name="delete" value="삭제" onclick="deleteCheck()">
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td class="title" onclick="location.href='#'">잡초 뽑기</td>
                            <td>서울</td>
                            <td>2022-10-16</td>
                            <td>2022-10-19</td>
                            <td>2/5</td>
                            <td>2022-10-03 10:00</td>
                            <td class="delete"><input type="button" name="delete" value="삭제" onclick="deleteCheck()">
                            </td>
                        </tr> -->
                    </tbody>
                </table>

                <!-- 페이징 -->
                <div id="page">
                    <div class="page_nation">
                    		<c:if test="${prev}">
		                        <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/admin/ProgramListOk.ad?page=1"></a>
		                        <a class="page-num arrow prev" href="${pageContext.request.contextPath}/admin/ProgramListOk.ad?page=${startPage -1}"></a>
		                    </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" >
                         <c:choose>
                        	<c:when test="${not (i eq page)}">
		                        <a href="${pageContext.request.contextPath}/admin/ProgramListOk.ad?page=${i}" class="page-num">
		                        <c:out value="${i}"/>
		                        </a>
                        	</c:when>
                        	<c:otherwise> 
                        		<a href="${pageContext.request.contextPath}/admin/ProgramListOk.ad?page=${i}" class="active">
		                       	 <c:out value="${i}"/>
		                        </a>
                        	</c:otherwise>
                        	</c:choose>
                        </c:forEach>
		                	   <c:if test="${next}">
		                        <a class="page-num arrow next" href="${pageContext.request.contextPath}/admin/ProgramListOk.ad?page=${endPage +1}"></a>
		                        <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/admin/ProgramListOk.ad?page=${realEndPage}"></a>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/admin/chartAPI_contents.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/programList.js"></script>    
</html>