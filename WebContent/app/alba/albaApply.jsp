<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프로그램 신청 페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/alba/albaApply.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css" />
</head>
<body>
	<!--헤더 넣는쪽-->
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp" />
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
										<div class="top">아르바이트 신청</div>
										<div class="lgr_sub">
											<ul class="lgr_ul">
												<li>
													<a class=a_tag href="${pageContext.request.contextPath}/program/applyListOk.pg"><span class="checkText">농촌 체험 프로그램</span></a>
												</li>
												<li class="nowMenu">
													<a class=a_tag href="${pageContext.request.contextPath}/alba/applyListOk.ab"><span class="secondMenu">농촌 아르바이트</span></a>
												</li>
											</ul>
										</div>
									</nav>
								</div>
							</div>
							<div class="title_right_box">
								<img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=8nFVTgUIDUlBiYgKluFrhBdHVni9G2K67o64OtO8tD1DEXBRoHgiiIK%2BvPxFADkbugGa28PnSO6qNVxcSqtCKg%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
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
													<button type="button" class="sort_btn" id="viewCnt" onclick="showByViewCnt()">조회순</button>
													<button type="button" class="sort_btn" id="applyWrite" onclick="location.href='${pageContext.request.contextPath}/alba/applyListOk.ab'">가장최근등록일순</button>
													<button type="button" class="sort_btn" id="applyEnd" onclick="showByDeadline()">가장최근마감일순</button>
													<c:if test="${-1 eq memberGrade || 0 eq memberGrade}">
														<button type="button" class="sort_btn alba_write_btn" data-id="writeBtn" onclick="location.href='${pageContext.request.contextPath}/alba/albaWrite.ab'">
															글 등록</button>
													</c:if>
												</div>
											</div>
											<div class="k_result inner clearfix">
												<p class="count">
													총 <span><c:out value="${total}" /></span>건 (진행중 <span class="pCount"><c:out value="${processCount}"/></span>건)
												</p>
												<br>
												<ul style="margin: 0px" id="albaListsAllUl">
										<c:choose>
														<c:when test="${albaLists != null and fn:length(albaLists) > 0}">
															<c:forEach var="alba" items="${albaLists}">
																<li class="alba" onclick="location.href='${pageContext.request.contextPath}/alba/apply01.ab?albaNumber=${alba.getAlbaNumber()}'">
																	<div class="info">
																		<p class="local">
																			<c:out value="${alba.getAlbaLocation()}" />
																		</p>
																		<!-- 진행상황 -->
																		<p class="progress">진행중</p>
																		<!-- 지원금액 -->
																	</div>
																	<div class="title">
																		<p>
																			<c:out value="${alba.getAlbaName()}" />
																		</p>
																	</div>
																	<div class="num">
																		<p class="prd">
																			<span class="endstatus"></span> &nbsp; | &nbsp;
																			<span class="end-day"><c:out value="${alba.getAlbaApplyEndDate()}" /></span>
																			<span style="display: none;"><c:out value="${alba.getAlbaApplyStartDate()}" /></span>
																		</p>
																		<p class="hits">
																			<img
																				src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png">
																			<c:out value="${alba.getAlbaViewCount()}" />
																		</p>
																	</div>
																	<div class="file"></div>
																	
																</li>
															</c:forEach>
														</c:when>
													</c:choose>
												</ul>
											</div>

										</div>
										<!-- 페이징 -->
										<div id="page" style="margin-bottom: 30px">
											<div class="page_nation">
												<c:if test="${prev}">
													<a href="${pageContext.request.contextPath}/alba/applyListOk.ab?page=1" class="page-num arrow pprev"></a>
													<a href="${pageContext.request.contextPath}/alba/applyListOk.ab?page=${startPage - 1}" class="page-num arrow prev" ></a>
												</c:if>
												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:choose>
														<c:when test="${not (i eq page)}">
															<a href="${pageContext.request.contextPath}/alba/applyListOk.ab?page=${i}" class="page-num" >
																<c:out value="${i}"/>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/alba/applyListOk.ab?page=${i}" class="page-num active" >
																<c:out value="${i}"/>
															</a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${next}">
													<a href="${pageContext.request.contextPath}/alba/applyListOk.ab?page=${endPage + 1}" class="page-num arrow next"></a>
													<a href="${pageContext.request.contextPath}/alba/applyListOk.ab?page=${realEndPage}" class="page-num arrow nnext"></a>
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
	</div>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/alba/alba_days.js"></script>
<script>
let page = 1;

function showByViewCnt(){
	alert("서비스 준비 중입니다.");
}

function showByDeadline(){
	alert("서비스 준비 중입니다.");
}

/* function showByViewCnt(){
	$.ajax({
		url: "${pageContext.request.contextPath}/alba/viewCountOk.ab",
		dataType: "json",
		data: {page: page},
		contentType: "application/json; charset=utf-8",
		success: sortList,
		error : function() {
			console.log("왜 안돼 ㅜㅜ? 	1");
		}
	});
} */

function sortList(albaLists) {
	console.log("들어옴? 이것은 조회 순 정렬??!!");
	let text = "";
	
	albaLists.forEach(alba => {
		text += `<li class="alba" onclick="location.href='${pageContext.request.contextPath}/alba/apply01.ab?albaNumber=` + alba.albaNumber + `'">`;
		text += `<div class="info">`;
		text += `<p class="local"> ` + alba.albaLocation + `</p>`;
		text += `<p class="progress">진행중</p>`;
		text += `</div>`;
		text += `<div class="title">`;
		text += `<p> ` + alba.albaName + `</p>`;
		text += `</div>`;
		text += `<div class="num">`;
		text += `<p class="prd">`;
		text += `<span class="endstatus"></span> &nbsp;| &nbsp;`;
		text += `<span class="end-day">` + alba.albaApplyEndDate + `</span>`;
		text += `<span style="display: none;">` + alba.albaApplyStartDate + `</span>`;
		text += `</p>`;
		text += `<p class="hits">`;
		text += `<img src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png">`;
		text += `<span>` + alba.albaViewCount + `</span>`;
		text += `</p>`;
		text += `</div>`;
		text += `</div>`;
		text += `</li>`;
	});

	$("#albaListsAllUl").html(text);
	/* pageNation(); */
}

function pageNation() {
	let pageText = "";
	
	pageText+= `<div class="page_nation">`;
	<c:if test="${prev}">
	pageText+= `<a href="1" class="page-num arrow pprev"></a>`;
	pageText+= `<a href="` + ${startPage + 1} + `" class="page-num arrow prev" ></a>`;
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:choose>
	<c:when test="${not (i eq page)}">
	pageText+= `<a href="`+ ${i} +`" class="page-num" >`;
	pageText+= <c:out value="${i}"/>;
	pageText+= `</a>`;
	</c:when>
	<c:otherwise>
	pageText+= `<a href="`+ ${i} +`" class="page-num active" >`;
	pageText+= <c:out value="${i}"/>;
	pageText+= `</a>`;
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${next}">
	pageText+= `<a href="` + ${endPage + 1} + `" class="page-num arrow next"></a>`;
	pageText+= `<a href="` + ${realEndPage} + `" class="page-num arrow nnext"></a>`;
	</c:if>
	pageText+= `</div>`;
	
	$("#page").html(pageText);
	$("#page").on("click", "a.page-num",function(e){
		console.log("이게 버튼 클릭...?");
		e.preventDefault();
		page = $(this).html();
	return page;		
	});
		console.log("페이징ㅜㅜ : " + page);
	sortList();
}



</script>
<%-- <script src="${pageContext.request.contextPath}/assets/js/alba/sort.js"></script> --%>
</html>
