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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/user.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/form.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/page.css"/>
        
    <!-- 버튼 클릭 시 확인 알림창 -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/assets/js/admin/check.js"></script>
    <title>관리자-사용자 관리</title>
</head>

<body>

    <div id="wrapper">
        <!-- 세로 메뉴바 -->
		<jsp:include page="${pageContext.request.contextPath}/app/admin/admin_menu.jsp"/>

        <!-- 헤더 ~ 밑에 메인 컨텐츠 -->
        <div id="container">
            <!-- 헤더 -->
            <header>
                <span id="admin-header-title">사용자 관리</span>
                <span id="admin-mode">관리자 모드</span>
                <span id="userCount">가입된 회원 수 총 <strong> <c:out value="${total}"/> </strong>명</span>
            </header>

            <!-- 컨텐츠 상단 통계 -->
            <div id="contents-top">
                <div class="content c-left">
                    <div id="counts-group">
                        <div class="counts">
                            <!-- 오늘 추가 되는 프로그램 수 -->
                            <div class="count-title">오늘 가입</div>
                            <span class="count">1</span>
                        </div>
                        <div class="counts">
                            <!-- 오늘 종료 되는 프로그램 수 -->
                            <div class="count-title">총 회원수</div>
                            <span class="count"><c:out value="${total}"/></span>
                        </div>
                    </div>
                </div>
                <!-- 차트 - 일주일 동안의 가입 통계-->
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
                            <select id="type-container" name="type" class="s-select">
                                <option value="i">ID</option>
                                <option value="e">이메일</option>
                                <option value="n">이름</option>
                                <option value="p">연락처</option>
                            </select>
                        </span>
                        <span class="s-f-input">
                            <span class="search-input">
                                <input id="keyword" type="text" name="keyword" placeholder="검색어를 입력하세요">
                            </span>
                        </span>
                        <button type="button" onclick="ready()">
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
                        <th class="num">회원번호</th>
                        <th class="id">ID</th>
                        <th class="email">이메일</th>
                        <th class="phone">연락처</th>
                        <th class="name">이름</th>
                        <th class="birth">구분</th>
                        <th class="address">주소</th>
                    <!--     <th class="program-count"></th>
                        <th class="part-count"></th>  -->
                        <th class="delete"></th>
                    </tr>
                    <!-- ↓ 데이터 출력 -->
                   <tbody>
                    <c:choose>
                    	<c:when test="${userList != null and fn:length(userList) > 0}">
                    		<c:forEach var="member" items="${userList}">
                   				 <tr>
	                    			<td><c:out value="${member.getMemberNumber()}"/></td>
	                    			<td><c:out value="${member.getMemberId()}"/></td>
	                    			<td><c:out value="${member.getMemberEmail()}"/></td>
	                    			<td><c:out value="${member.getMemberPhoneNumber()}"/></td>
	                    			<td><c:out value="${member.getMemberName()}"/></td>
	                    			<td><c:out value="${member.getMemberGrade()}"/></td>
	                    			<td><c:out value="${member.getMemberLocation()}"/></td>
	                    			<td class="delete"><input type="button" value="탈퇴" onClick="outCheck(this); location.href = '${pageContext.request.contextPath}/admin/UserDeleteOk.ad?memberNumber=${member.getMemberNumber()}';"></td>
                    			</tr>
                    		</c:forEach>
                    	</c:when>
                   </c:choose>
                  </tbody>
                  <!--   <tr>
                        <td>1</td>
                        <td>나랑농부할래</td>
                        <td>java123@gmail.com</td>
                        <td>010-1234-1234</td>
                        <td>김농부</td>
                        <td>일반인</td>
                        <td>서울특별시 강남구 테헤란로 146</td>
                        <td>2</td>
                        <td>5</td>
                        <td class="delete"><input type="button" value="탈퇴" onClick="outCheck()"></td>
                    </tr>
                   
                    <tr>
                        <td>13534</td>
                        <td>알콩달콩심자</td>
                        <td>beanLoVe@gmail.com</td>
                        <td>010-1122-3344</td>
                        <td>김콩빈</td>
                        <td>농장주</td>
                        <td>서울특별시 강남구 역삼동 736-6 06236</td>
                        <td>2</td>
                        <td>5</td>
                        <td class="delete"><input type="button" value="탈퇴" onClick="outCheck()"></td>
                    </tr> -->
                </table>

                <!-- 페이징 -->
                <div id="page">
                    <div class="page_nation">
                    		<c:if test="${prev}">
		                        <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/admin/User.ad?page=1"></a>
		                        <a class="page-num arrow prev" href="${pageContext.request.contextPath}/admin/User.ad?page=${startPage -1}"></a>
		                    </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" >
                         <c:choose>
                        	<c:when test="${not (i eq page)}">
		                        <a href="${pageContext.request.contextPath}/admin/User.ad?page=${i}" class="page-num">
		                        <c:out value="${i}"/>
		                        </a>
                        	</c:when>
                        	<c:otherwise> 
                        		<a href="${pageContext.request.contextPath}/admin/User.ad?page=${i}" class="active">
		                       	 <c:out value="${i}"/>
		                        </a>
                        	</c:otherwise>
                        	</c:choose>
                        </c:forEach>
		                	   <c:if test="${next}">
		                        <a class="page-num arrow next" href="${pageContext.request.contextPath}/admin/User.ad?page=${endPage +1}"></a>
		                        <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/admin/User.ad?page=${realEndPage}"></a>
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
	
	
	<script>
/* function showResultBySearch(type){
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/UserSearchOk.ad",
		type: "get",
		data: {type: $("#type-container").val(), keyword: $("#keyword").val()},
		dataType: "json",
		success: function(members){
			if(members.length == 0){
				alert('해당 정보가 없습니다');
			}
		}
	});
} */

 /* function showResultBySearch(){
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/UserSearchOk.ad",
		type: "get",
		data: {type: $("#type-container").val(), keyword: $("#keyword").val()},
		dataType: "json",
		success: function(members){
			let text = "";
			let $result = $("tbody");
			if(members.length == 0){
				$result.html("검색 결과가 없습니다.");
			}
			$.each(members, function(i, member){
				text += `<tr><td>` + member.memberNumber + `</td>`;
				text += `<td>` + member.memberId + `</td>`;
				text += `<td>` + member.memberEmail + `</td>`;
				text += `<td>` + member.memberPhoneNumber + `</td>`;
				text += `<td>` + member.memberName + `</td>`;
				text += `<td>` + member.memberGrade + `</td>`;
				text += `<td>` + member.memberLocation + `</td>`;
				text += `<td>` + member.memberId + `</td></tr>`;
				
				text += `<p>` + member.memberId + `</p>`;
				text += member.memberEmail + `,  `;
				text += member.memberName + `,  `;
				text += member.memberPhoneNumber + `,  `;
				text += `</li>`;
				
				$result.html(text);
			});
		},
		error: function(a, b, c){
			console.log(a, b, c);
		}
	});
} */
</script>

<!-- 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/chartAPI.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/user.js"></script>
</html>