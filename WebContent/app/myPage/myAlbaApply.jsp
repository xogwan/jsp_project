<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage/myAlbaApply.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    <title>내가 신청한 알바</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
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
                                            프로그램 내역
                                        </div>
                                        <div class="lgr_sub">
                                            <ul class="lgr_ul">
                                                <li class="nowMenu"><a href="${pageContext.request.contextPath}/mypage/ProgramOk.my"><span >농촌 체험 프로그램</span></a></li>
                                                <li ><a href="${pageContext.request.contextPath}/mypage/AlbaOk.my"><span class="checkText">농촌 아르바이트</span></a></li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                            <div class="title_right_box">
                                <div class="requestImg"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sub_content">
                    <div class="container">
                        <div class="inner">
                            <link href="/young/css/custom/custom.css" media="all" rel="stylesheet" type="text/css">
                            <div class="board_wrap">
                                <div class="board_cont">
                                    <form id="listForm" name="listForm">
                                        <div class="sub01_con inner clearfix">
                                            <div>
                                                <div class="asa_listView">
                                                    
                                                </div>
                                                <div class="sort_list">
                                                    <button type="button" class="sort_btn" data-id="viewCnt">조회순</button>
                                                    <button type="button" class="sort_btn" data-id="asc">가장최근등록일순</button>
                                                    <button type="button" class="sort_btn" data-id="applEdDt">가장최근마감일순</button>
                                                </div>
                                            </div>
                                            <div class="k_result inner clearfix">
                                                <p class="count">총 <span>${total}</span>건 (진행중 <span>${total}</span>건)</p>
                                                <br>
                                                <ul>
                                                         <c:forEach var="alba" items="${albas}">
                                                        <li class="alba" onclick="location.href='${pageContext.request.contextPath}/alba/apply01.ab?albaNumber=${alba.getAlbaNumber()}'">
                                                            <div class="info">
                                                                <p class="local"><c:out value ="${alba.getAlbaLocation()}"/></p>
                                                                <!-- 진행사항 -->
                                                                <p class="progress">진행중</p>
                                                                <!-- 지원금액 -->
                                                                <p class="sup_price">
                                                                </p>
                                                            </div>
                                                            <div class="title">
                                                                <p><c:out value ="${alba.getAlbaName()}"/></p>
                                                            </div>
                                                            <div class="num">
                                                                <p class="prd">
                                                                	<c:set var = "startDate" value ="${alba.getAlbaApplyStartDate()}"/>
                                                                	<c:set var = "endDate" value ="${alba.getAlbaApplyEndDate()}"/>
                                                                	<fmt:parseDate value = "${startDate}" pattern = "yyyy-MM-dd" var = "date"/>
																	<fmt:parseDate value = "${endDate}" pattern = "yyyy-MM-dd" var = "edate"/>
                                                                	
                                                                	<fmt:parseNumber var="startDate_N" value="${date.time / (1000*60*60*24)}" integerOnly="true" />
                                                                	<fmt:parseNumber var="endDate_N" value="${edate.time / (1000*60*60*24)}" integerOnly="true" />
                                                                	<c:choose>
                                                                	<c:when test="${(endDate_N -startDate_N)>0}">
                                                                		D-<c:out value = "${endDate_N -startDate_N}" />
                                                                	</c:when>
                                                                	<c:otherwise>
                                                                		당일 마감
                                                                	</c:otherwise>
                                                                	</c:choose>
                                                                    &nbsp; | &nbsp; <c:out value ="${alba.getAlbaApplyEndDate()}"/>
                                                                </p>
                                                                <p class="hits"><img src="https://www.rda.go.kr/young/images/site/sub/common_ico_view.png">
                                                                     <c:out value ="${alba.getAlbaViewCount()}"/>
                                                                </p>
                                                            </div>
                                                        </li>
                                                        </c:forEach>
                                                </ul>
                                            </div>

                                             <div id="page" style="margin-bottom: 30px">
											<div class="page_nation">
												<c:if test="${prev}">
													<a href="${pageContext.request.contextPath}/mypage/AlbaOk.my?page=1" class="page-num arrow pprev"></a>
													<a href="${pageContext.request.contextPath}/mypage/AlbaOk.my?page=${startPage - 1}" class="page-num arrow prev" ></a>
												</c:if>
												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:choose>
														<c:when test="${not (i eq page)}">
															<a href="${pageContext.request.contextPath}/mypage/AlbaOk.my?page=${i}" class="page-num" >
																<c:out value="${i}"/>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/mypage/AlbaOk.my?page=${i}" class="page-num active" >
																<c:out value="${i}"/>
															</a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${next}">
													<a href="${pageContext.request.contextPath}/mypage/AlbaOk.my?page=${endPage + 1}" class="page-num arrow next"></a>
													<a href="${pageContext.request.contextPath}/mypage/AlbaOk.my?page=${realEndPage}" class="page-num arrow nnext"></a>
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
    <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</html>