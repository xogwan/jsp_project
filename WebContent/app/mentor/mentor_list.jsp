<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <!-- 영문, 숫자 play 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mentor/mentor_list.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mentor/subheader.css"/>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>

<body>
<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
    <!-- subheader -->
    <div class="sub_title">
        <div class="container">
            <div class="inner">
                <div class="title_left_box">
                    <div class="snb_wrap">
                        <nav class="snb">
                            <div class="top" style="display: inline-block">커뮤니티</div>
                            <div class="lgr_snb" style="display: inline-block; margin-left: 20px;">
                                <ul class="lgr_ul" data-level="1">
                                    <li><a href="/young/board/board04.do" class="active">
                                            <span>공지사항</span>
                                        </a>
                                    </li>
                                    <li class="nowMenu"><a href="/young/board/board07.do" class="active">
                                            <span>멘토 홍보 게시판</span>
                                        </a>
                                    </li>
                                    <li><a href="/young/board/board08.do" class="active">
                                            <span>소통공간</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="title_right_box">
                    <img
                        src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=9RfoLYoam0TsoWU0M9CunXVDpRV%2BMYjz%2Fwx9V8vcTVN9PUStsh042e3NWGD7IukskEQAGJfLet60yqWGs%2Bedtw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                </div>
            </div>
        </div>
    </div>
    <!-- subheader -->

    <div class="sub_content">
        <div class="container">
            <div class="inner">
                <div class="board_wrap">
                    <div class="board_cont">
                        <form name="boardSearchForm" class="board_search_form" method="post" autocomplete="off">

                            <!-- sort 버튼 -->
                            <div class="search_box">
                                <input type="text" name="sv" placeholder="제목,품목 등으로 검색." value=""
                                    onkeydown="if(event.keyCode==13){fn_search();}" title="검색어 입력">
                                <button type="button" class="search_btn" onclick="fn_search();">검색</button>
                                <!-- button type="button" class="reset_btn" onclick="gf_reset();">전체</button-->
                            </div>
                        </form>
                        <form id="listForm" name="listForm" action="/young/board/board02.do" method="post" autocomplete="off">
                            <div class="btns">
                                <!-- 등록버튼 -->
                                <div class="btn_register">
                                    <button type="button" class="iron-iconized iron-action return" onclick="doList();"><span class="val">등록</span></button>
                                </div>
                                
                            </div>
                            <!-- 보기방식: 갤러리형 --><!--작업시작부분 -->
                            <c:choose>
                            <c:when test="${lists !=null and fn:length(lists) >0}">
                                <c:forEach var="list" items="${lists}">
                            <div class="hn_photo_list">
                                <ul>
                                    <li>
                                        <div class="item_photo">
                                            <a class="link" href="javascript:fn_detailView('BOARD02_0000000068');">
                                                <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9uatpWP5y%2FBsLxA7Vla4IuDEe3XyLlcyhgajvjHTrVwew%3D%3D&fname=VaQZG4aE8tLnk0UPRWfmFcrbSVNEoHKXY6mhu5KW2lUhL15U171p56%2Fumq7ABh5d2Rm1FAG7xjNLtT8OpRD6EQ%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D"
                                                    alt="명품 성주 참외 가업 잇는 안규찬 대표">
                                            </a>
                                        </div>
                                        <div class="item_tech">
                                            <ul>
                                                <li>
                                                    <p><span>
                                                    <c:out value="${list.getMentorLocation()}"/>
                                                    </span></p>
                                                </li>
                                                <li>
                                                    <p><span><c:out value="${list.getMentorCrops()}"/></span></p>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item_cont">
                                            <div class="tit" data-depth="1">
                                                <a class="link" href="javascript:fn_detailView('BOARD02_0000000068');">
                                                    <c:out value="${list.getMentorTitle()}"/></a>
                                            </div>
                                            <div class="writer_info">
                                                멘토 : <span class="mentor_name"><c:out value="${list.getMentorName()}"/></span><br>
                                                이메일 : <span class="mentor_email"><c:out value="${list.getMentorEmail()}"/></span><br>
                                                연락처 : <span class="menter_phone"><c:out value="${list.getMentorPhoneNumber()}"/>
                                                <span class="write_info_img1"></span>
                                                <span class="write_info_img2"></span>
                                            </span>
                                            </div>
                                        </div>
                                    </li>
                                    </ul>
                                    </div>
                                    </c:forEach>
                            </c:when>
                           <c:otherwise>
                           <td colspan ="5" align ="center">등록된 게시물이 없습니다.</td>
                           </c:otherwise>
                            </c:choose>
                                   

                            <div class="btn_wrap">
                                <ul>
                                </ul>
                            </div>
                               <!-- 페이징 -->
                <div id="page" class="page_height">
                    <div class="numberClick">
                    <div class="page_nation">
                       <c:if test="${prev}">
                       <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/mentor/listOk.mt?page=1"></a>
                       <a class="page-num arrow prev" href="${pageContext.request.contextPath}/mentor/listOk.mt?page=${startPage-1}"></a>
                       </c:if>
                    	<c:forEach var = "i" begin ="${startPage}" end="${endPage}">
                    	<c:choose>
                    	<c:when test = "${not (i eq page)}">
                       <a class="page-num active" href="${pageContext.request.contextPath}/mentor/listOk.mt?page=${i}"><c:out value="${i}"/></a>
                       </c:when>
                       <c:otherwise>
                       <a class="page-num active" href="${pageContext.request.contextPath}/mentor/listOk.mt?page=${i}"><c:out value="${i}"/></a>
                       </c:otherwise>
                       </c:choose>
                       </c:forEach>
                       <c:if test="${next}">
                       <a class="page-num arrow next" href="${pageContext.request.contextPath}/mentor/listOk.mt?page=${endPage+1}"></a>
                       <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/mentor/listOk.mt?page=${realEndPage}"></a>
                       </c:if>
                    </div>
                    </div>
                </div>
    </form>
    
</div>


                </div>
            </div>
        </div>
    </div>

<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="${pageContext.request.contextPath}/assets/js/mentor/mentor.js"></script>
</html>