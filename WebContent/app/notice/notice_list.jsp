<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
   		<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

    <!-- 영문, 숫자 play 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/notice_list.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/subheader.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/page.css"/>
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
                                    <li class="nowMenu"><a href="/young/board/board04.do" class="active">
                                        <span>공지사항</span>
                                    </a>
                                </li>
                                <li><a href="" class="active" onclick="readyMentor()">
                                        <span>멘토 홍보 게시판</span>
                                    </a>
                                </li>
                                <li><a href="${pageContext.request.contextPath} /community/listOk.cm" class="active">
                                        <span>소통공간</span>
                                    </a>
                                </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="title_right_box">
                    <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=9RfoLYoam0TsoWU0M9CunXVDpRV%2BMYjz%2Fwx9V8vcTVN9PUStsh042e3NWGD7IukskEQAGJfLet60yqWGs%2Bedtw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                </div>
            </div>
        </div>
    </div>
    <!-- subheader -->

    <!-- list -->
    <!-- 검색어 입력 폼 -->
<div class="contentfullwrap">
    <div class="contentwrap">
    <form action="" name="searchForm" method="post">
        <div class="search-form">
            <span class="s-form">
                <select name="searchSelect" class="val">
                    <option value="sj">제목</option>
                    <option value="cn">내용</option>
                    <option value="cnsj">제목+내용</option>
                    <option value="nm">작성자</option>
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

    <span class="list-count">총
        <span><c:out value="${total}"/></span>건
    </span>

    <table>
        <thead>
            <tr class="title">
                <th class="number" >번호</th>
                <th class="title" >제목</th>
                <th class="file" >첨부파일</th>
                <th class="registrant" >등록자</th>
                <th class="regist-date" >등록일자</th>
                <th class="viewcount" >조회수</th>
            </tr>
        </thead>
        <!-- ↓ 데이터 출력 -->
        <tbody>
            <c:choose>
                    	<c:when test="${userList != null and fn:length(userList) > 0}">
                    		<c:forEach var="noticeList" items="${userList}">
                   				 <tr>
	                    			<td><c:out value="${noticeList.getNoticeNumber()}"/></td>
	                    			<td><c:out value="${noticeList.getNoticeTitle()}"/></td>
	                    			<td><img src="${pageContext.request.contextPath}/assets/images/common/fileImage.png"></td>
	                    			<td class="registrant">관리자</td>
	                    			<td><c:out value="${noticeList.getNoticeDate()}"/></td>
	                    			<td><c:out value="${noticeList.getNoticeViewCount()}"/></td>
                    			</tr>
                    		</c:forEach>
                    	</c:when>
                   </c:choose>
            <!-- <tr>
                <td class="number">2</td>
                <td class="title"><a href="">[전라남도] 2022 전라남도 귀농산어촌 고향사람 박람회 </a> </td>
                <td class="file">-</td>
                <td class="registrant">관리자</td>
                <td class="regist-date">2022-10-02</td>
                <td class="viewcount">51</td>
            </tr> -->
        </tbody>
    </table>

      <!-- 페이징 -->
      <div id="page">
           <div class="page_nation">
                <c:if test="${prev}">
		                <a class="page-num arrow pprev" href="${pageContext.request.contextPath}/notice/detailOk.nt?page=1"></a>
		                <a class="page-num arrow prev" href="${pageContext.request.contextPath}/notice/detailOk.nt?page=${startPage -1}"></a>
		        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" >
                         <c:choose>
                        	<c:when test="${not (i eq page)}">
		                        <a href="${pageContext.request.contextPath}/notice/detailOk.nt?page=${i}" class="page-num">
		                        <c:out value="${i}"/>
		                        </a>
                        	</c:when>
                        	<c:otherwise> 
                        		<a href="${pageContext.request.contextPath}/notice/detailOk.nt?page=${i}" class="active">
		                       	 <c:out value="${i}"/>
		                        </a>
                        	</c:otherwise>
                        	</c:choose>
                        </c:forEach>
		                	   <c:if test="${next}">
		                        <a class="page-num arrow next" href="${pageContext.request.contextPath}/notice/detailOk.nt?page=${endPage +1}"></a>
		                        <a class="page-num arrow nnext" href="${pageContext.request.contextPath}/notice/detailOk.nt?page=${realEndPage}"></a>
		                        </c:if>
        </div>
    </div>
</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function ready(){
			alert('검색기능 준비중입니다.');
	}
	
	function readyMentor(){
		alert('멘토 홍보 게시판은 준비중인 서비스입니다.');
	}
	</script>
</html>