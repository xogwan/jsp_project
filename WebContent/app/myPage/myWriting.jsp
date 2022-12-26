<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage/myWriting.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    <title>게시판 활동 내역</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
    <!-- 서브타이틀 -->
    <div class="sub_title">
        <div class="container">
            <div class="inner">
                <!-- "마이페이지" 폰트 -->
                <div class="left_font">
                    <div class="mypage">
                        <nav><div class="top">게시판 활동 내역</div></nav>
                    </div>
                </div>

                <!-- 일러스트 이미지 -->
                <div class="title_right_box">
                    <div class="communityImg"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="wrap">
        <!-- 검색 입력창 -->
        <form class="searchForm">
            <div class="searchOut">
                <div class="searchInner">
                    <span class="selectBox">
                        <span class="selectDrop">
                            <select name="selectChoice" class="selectChoice">
                                <option value="sj">제목</option>
                                <option value="cn">내용</option>
                                <option value="cnsj">제목+내용</option>
                                <option value="nm">작성자</option>
                            </select>
                        </span>
                    </span>
                    <span class="inputLine">
                        <span class="inputBox">
                            <input type="text" class="searchBox">
                        </span>
                    </span>
                    <span class="submit">
                        <button type="button" class="submitBtn"></button>
                    </span>
                </div>
            </div>
        </form>

        <!-- 검색 결과 총 갯수 -->
        <p class="countText"><img src="https://www.returnfarm.com:444/css/wvtex/img/sub/board_count.png">총 <span>${total}</span>건</p>

        <!-- 검색 결과 리스트 출력 -->
        <div class="boardList">
            <table class="boardTable">
                <colgroup>
                    <col style="width: 8%;">
                    <col style="width: 52%;">
                    <col style="width: 8%;">
                    <col style="width: 12%;">
                    <col style="width: 12%;">
                    <col style="width: 8%;">
                </colgroup>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>첨부파일</th>
                    <th>아이디</th>
                    <th>등록일자</th>
                    <th>조회수</th>
                </tr>
                <c:forEach var="list" items = "${lists}">
                <tr>
                    <td class="number"><c:out value="${list.getCommunityNumber()}"/></td>
                    <td class="title"><a href="${pageContext.request.contextPath}/community/detailOk.cm?communityNumber=${list.getCommunityNumber()}"><c:out value="${list.getCommunityTitle()}"/></a><span class="commentCnt"> (0)</span></td>
                    <td class="icon"><img src="${pageContext.request.contextPath}/assets/images/common/fileImage.png"></td>
                    <td class="writer"><c:out value="${list.getMemberId()}"/></td>
                    <td class="date"><c:out value="${list.getCommunityDate()}"/></td>
                    <td class="viewCnt"><c:out value="${list.getCommunityViewCount()}"/></td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
	<div id="page" style="margin-bottom: 30px">
    <div class="page_nation">
		<c:if test="${prev}">
			<a href="${pageContext.request.contextPath}/mypage/WriteOk.my?page=1" class="page-num arrow pprev"></a>
			<a href="${pageContext.request.contextPath}/mypage/WriteOk.my?page=${startPage - 1}" class="page-num arrow prev" ></a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${not (i eq page)}">
						<a href="${pageContext.request.contextPath}/mypage/WriteOk.my?page=${i}" class="page-num" >
						<c:out value="${i}"/>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/mypage/WriteOk.my?page=${i}" class="page-num active" >
						<c:out value="${i}"/>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:if test="${next}">
			<a href="${pageContext.request.contextPath}/mypage/WriteOk.my?page=${endPage + 1}" class="page-num arrow next"></a>
			<a href="${pageContext.request.contextPath}/mypage/WriteOk.my?page=${realEndPage}" class="page-num arrow nnext"></a>
		</c:if>
	</div>
	</div>
    <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</html>