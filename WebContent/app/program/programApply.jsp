<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 신청 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/program/programApply.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css"/>

</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
    <!-- 바디 -->
    <div class="wrap">
        <div class="main">
            <div class="sub_wrap">
                <div class="sub_title">
                    <div class="container">
                        <div class="inner">
                            <div class="title_left_box">
                                <div id="sub_wrap" class="sub_wrap">
                                    <nav id="snb" class="snb">
                                        <div class="top">
                                            프로그램 신청
                                        </div>
                                        <div class="lgr_snb">
                                            <ul class="lgr_ul">
                                                <li class="nowMenu">
                                                    <a class="a_tag" href="${pageContext.request.contextPath}/program/applyListOk.pg"><span class="checkText">농촌 체험 프로그램</span></a>
                                                </li>
                                                <li>
                                                    <a class="a_tag" href="${pageContext.request.contextPath}/alba/applyListOk.ab"><span class="secondMenu">농촌 아르바이트</span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                            <div class="title_right_box">
                                <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=8nFVTgUIDUlBiYgKluFrhBdHVni9G2K67o64OtO8tD1DEXBRoHgiiIK%2BvPxFADkbugGa28PnSO6qNVxcSqtCKg%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sub_content">
                    <div class="container">
                        <div class="inner">
                            <div class="board_wrap">
                                <div class="board_cont">
                                    <form id="listForm" name="listForm">
                                        <div class="sub01_con inner clearfix">
                                            <div>
                                                <div class="sort_list">
                                                    <button type="button" class="sort_btn" data-id="viewCnt" onclick="javascript:preparing();">조회순</button>
                                                    <button type="button" class="sort_btn" data-id="asc" onclick="location.href='${pageContext.request.contextPath}/program/applyListOk.pg'">가장최근등록일순</button>
                                                    <button type="button" class="sort_btn" data-id="applEdDt" onclick="javascript:preparing();">가장최근마감일순</button>
                                                	<c:if test="${-1 eq memberGrade || 0 eq memberGrade}">
                                                    <button type="button" class="sort_btn_farmer" data-id="register" onclick="location.href='${pageContext.request.contextPath}/program/programWrite.pg'">
                                                    	글 등록</button>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="k_result inner clearfix">
                                                <p class="count">
                                                    총 <span><c:out value="${totalCount}"/></span>건 (진행중 
                                                	<span class="pCount"><c:out value="${processCount}" /></span>건) 
                                                </p>
                                                <br>
                                                <ul style="margin: 0px" id="programListsAllUl">
                                                		<c:if test="${programs != null and fn:length(programs) > 0}">
                                                			<c:forEach var="program" items="${programs}">
                                                			
                                                    <li class="program" onclick="location.href='${pageContext.request.contextPath}/program/apply01Ok.pg?programNumber=${program.getProgramNumber()}'">
                                                            <div class="info">
                                                                <p class="local"><c:out value="${program.getProgramLocation()}"/></p>
                                                                <!-- 진행사항 -->
                                                                <p class="progress">진행중</p>
                                                                <!-- 지원금액 -->
                                                            </div>
                                                            <div class="title">
                                                                <p><c:out value="${program.getProgramName()}"/></p>
                                                            </div>
                                                            <div class="num">
                                                                <p class="prd">
                                                                    <span class="endstatus"></span> &nbsp; | &nbsp; 
                                                                    <span class="end-day"><c:out value="${program.getProgramApplyEndDate()}"/></span>
                                                                    <span style="display: none;"><c:out value="${program.getProgramApplyStartDate()}" /></span>
                                                                </p>
                                                                <p class="hits"><img src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png"> 
                                                                <c:out value="${program.getProgramViewCount()}"/></p>
                                                            </div>
                                                            <div class="file">
                                                            </div>
                                                        
                                                    </li>
                                                			</c:forEach>
                                                		</c:if>
                                                </ul>
                                            </div>
                                           
                                        </div>
                                       <%-- 등록순 페이징 --%>
                                        	 <div id="page" style="margin-bottom : 30px">
                                            <div class="page_nation">
                                            	<c:if test="${prev}">
			                                            <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/program/applyListOk.pg?page=1"></a>
			                                            <a class="page-num arrow prev" href="${pageContext.request.contextPath}/program/applyListOk.pg?page=${startPage - 1}"></a>
			                                    </c:if>
	                                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
	                                            <c:choose>
															<c:when test="${not (i eq page)}">
															
	                                            			<!-- 현재페이지 아님 -->
			                                            		<a class="page-num" href="${pageContext.request.contextPath}/program/applyListOk.pg?page=${i}">
			                                            		<c:out value="${i}"/></a>
															</c:when>
															<c:otherwise>
															<!-- 현재페이지 -->
			                                            		<a class="page-num active" href="${pageContext.request.contextPath}/program/applyListOk.pg?page=${i}">
			                                            		<c:out value="${i}"/></a>
															</c:otherwise>
														</c:choose>
	                                            </c:forEach>
	                                            <c:if test="${next}">
			                                            <a class="page-num arrow next" href="${pageContext.request.contextPath}/program/applyListOk.pg?page=${endPage + 1}"></a>
			                                            <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/program/applyListOk.pg?page=${realEndPage}"></a>
			                                    </c:if>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/program/program_apply.js"></script>
<script>
function preparing(){
	alert("서비스를 준비 중입니다.");
}

let page = 1;
/* 조회순 정렬 ajax */
function viewOrder(){
		$.ajax({
		url: "${pageContext.request.contextPath}/program/viewCountOk.pg",
		contextType: "application/json; charset=utf-8",
		dataType: "json",
		success: viewOrderList,
		error : function(request, status, error) {
			console.log(error);
		}
	});
}

//조회순 정렬 함수
function viewOrderList(programLists){
	let text = "";
	let pageText = "";
	
	programLists.forEach(program => {
		text += `<li class="program" onclick="location.href='${pageContext.request.contextPath}/program/apply01Ok.pg?programNumber=` + program.programNumber + `'">`;
		text += `<div class="info">`;
		text += `<p class="local"> ` + program.programLocation + `</p>`;
		text += `<p class="progress">진행중</p>`;
		text += `</div>`;
		text += `<div class="title">`;
		text += `<p> ` + program.programName + `</p>`;
		text += `</div>`;
		text += `<div class="num">`;
		text += `<p class="prd">`;
		text += `<span class="endstatus"></span> &nbsp;| &nbsp;`;
		text += `<span class="end-day">` + program.programApplyEndDate + `</span>`;
		text += `<span style="display: none;">` + program.programApplyStartDate + `</span>`;
		text += `</p>`;
		text += `<p class="hits">`;
		text += `<img src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png">`;
		text += `<span >` + program.programViewCount + `</span>`;
		text += `</p>`;
		text += `</div>`;
		text += `</div>`;
		text += `</li>`;
	
	});

	$("#programListsAllUl").html(text);
	
	pageText+= `<div class="page_nation">`;
	pageText+= `<c:if test="${prev}">`;
	pageText+= `<a href="1" class="page-num arrow pprev"></a>`;
	pageText+= `<a href="` + ${startPage + 1} + `" class="page-num arrow prev" ></a>`;
	pageText+= `</c:if>`;
	pageText+= `<c:forEach var="i" begin="${startPage}" end="${endPage}">`;
	
	pageText+= `<c:choose><c:when test="`+${not (i eq page)}+`">`;
	pageText+=`<a class="page-num" href="${pageContext.request.contextPath}/program/viewCountOk.pg?page=${i}">`;
	pageText+=`<c:out value="`+${i}+`"/></a></c:when><c:otherwise>`;
	pageText+=`<a class="page-num active" href="${pageContext.request.contextPath}/program/viewCountOk.pg?page=${i}">`;
	pageText+=`<c:out value="`+${i}+`"/></a>`;
	pageText+=`</c:otherwise></c:choose>`;
	
	pageText+= `</c:forEach>`;
	pageText+= `<c:if test="${next}">`;
	pageText+= `<a href="` + ${endPage + 1} + `" class="page-num arrow next"></a>`;
	pageText+= `<a href="` + ${realEndPage} + `" class="page-num arrow nnext"></a>`;
	pageText+= `</c:if>`;
	pageText+= `</div>`;

	$(".page_nation").html(pageText);
}

/* 최근마감일순 정렬 ajax*/
function recentOrder(){
		$.ajax({
			url: "${pageContext.request.contextPath}/program/deadlineOk.pg",
			contextType: "application/json; charset=utf-8",
			dataType: "json",
			success: recentOrderList,
			error : function(request, status, error) {
				console.log(error);
			}
		});
} 


//마감순 정렬 함수
function recentOrderList(programLists){
	let text = "";
	let pageText = "";
	
	programLists.forEach(program => {
		text += `<li class="program" onclick="location.href='${pageContext.request.contextPath}/program/apply01Ok.pg?programNumber=` + program.programNumber + `'">`;
		text += `<div class="info">`;
		text += `<p class="local"> ` + program.programLocation + `</p>`;
		text += `<p class="progress">진행중</p>`;
		text += `</div>`;
		text += `<div class="title">`;
		text += `<p> ` + program.programName + `</p>`;
		text += `</div>`;
		text += `<div class="num">`;
		text += `<p class="prd">`;
		text += `<span class="endstatus"></span> &nbsp;| &nbsp;`;
		text += `<span class="end-day">` + program.programApplyEndDate + `</span>`;
		text += `<span style="display: none;">` + program.programApplyStartDate + `</span>`;
		text += `</p>`;
		text += `<p class="hits">`;
		text += `<img src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png">`;
		text += `<span >` + program.programViewCount + `</span>`;
		text += `</p>`;
		text += `</div>`;
		text += `</div>`;
		text += `</li>`;
	
	});

	$("#programListsAllUl").html(text);
	
	pageText+= `<div class="page_nation">`;
	pageText+= `<c:if test="${prev}">`;
	pageText+= `<a href="1" class="page-num arrow pprev"></a>`;
	pageText+= `<a href="` + ${startPage + 1} + `" class="page-num arrow prev" ></a>`;
	pageText+= `</c:if>`;
	pageText+= `<c:forEach var="i" begin="${startPage}" end="${endPage}">`;
	
	pageText+= `<c:choose><c:when test="`+${not (i eq page)}+`">`;
	pageText+=`<a class="page-num" href="${pageContext.request.contextPath}/program/deadlineOk.pg?page=${i}">`;
	pageText+=`<c:out value="`+${i}+`"/></a></c:when><c:otherwise>`;
	pageText+=`<a class="page-num active" href="${pageContext.request.contextPath}/program/deadlineOk.pg?page=${i}">`;
	pageText+=`<c:out value="`+${i}+`"/></a>`;
	pageText+=`</c:otherwise></c:choose>`;
	
	pageText+= `</c:forEach>`;
	pageText+= `<c:if test="${next}">`;
	pageText+= `<a href="` + ${endPage + 1} + `" class="page-num arrow next"></a>`;
	pageText+= `<a href="` + ${realEndPage} + `" class="page-num arrow nnext"></a>`;
	pageText+= `</c:if>`;
	pageText+= `</div>`;

	$(".page_nation").html(pageText);
}

</script>
</html>