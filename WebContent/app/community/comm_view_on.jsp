<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/comm_view_on.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/subheader.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/reply.css"/>
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
                                    <li ><a href="/young/board/board04.do" class="active">
                                        <span>공지사항</span>
                                    </a>
                                </li>
                                <li><a href="/young/board/board07.do" class="active">
                                        <span>멘토 홍보 게시판</span>
                                    </a>
                                </li>
                                <li class="nowMenu"><a href="${pageContent.request.contetPath}/community/listOk.cm" class="active">
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
	<div class="contentfullwrap">
		<div class="contentwrap">
			<div class="base_boardwrap">
				<div class="printboard">
					<div class="base_boardview">
						<table width="100%;">
							<colgroup>
								<col width="100%;">
							</colgroup>
							<thead>
								<tr>
									<th class="title">${board.getCommunityTitle()}</th>
								</tr>
								<tr class="datatext">
									<td class="datatext">
										<div class="datatext_l">
											등록일 : <span>${board.getCommunityDate()}</span>
										</div>
										<ul class="datatext_r">
											<li>아이디 : ${board.getMemberId()}</li>
											<li>조회수 : ${board.getCommunityViewCount()}</li>
										</ul>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="textarea">${board.getCommunityContent()}</td>
								</tr>
								<tr class="file">
									<td class="tblpd01">
										<div id="fileList">
											<c:choose>
												<c:when test="${files != null and fn:length(files) > 0 }"> <!-- 게시글에 첨부파일이 존재할 때 -->
													<c:forEach var="file" items="${files}"> <!-- 파일이 여러 개일 수도 있으니 -->
														<a href="${pageContext.request.contextPath}/communityFile/download.cmFile?communityFileName=${file.getCommunityFileName()}&communityFileRealname=${file.getCommunityFileRealname()}">${file.getCommunityFileRealname()}</a><br>
													</c:forEach>
												</c:when>
												<c:otherwise> <!-- 게시글에 첨부파일이 존재하지 않을 때 -->
													<a>첨부파일이 없습니다.</a></br>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="te_right mt25">
							<c:set var='writeId' value='${board.getMemberId()}'/>
							<c:set var='memberId' value='${memberId}'/>
							<c:if test="${writeId == memberId}">
								<button type="button" class="iron-iconized iron-action return" onclick="location.href = '${pageContext.request.contextPath}/community/update.cm?communityNumber=${board.getCommunityNumber()}'">
									<span class="val">수정</span>
								</button>
								<button type="button" class="iron-iconized iron-action return" onclick="location.href = '${pageContext.request.contextPath}/community/deleteOk.cm?communityNumber=${board.getCommunityNumber()}'">
									<span class="val">삭제</span>
								</button>
							</c:if>
							<button type="button" class="iron-iconized iron-action return" onclick="location.href = '${pageContext.request.contextPath}/community/listOk.cm'">
								<span class="val">목록</span>
							</button>
						</div>

					</div>
				</div>
			</div>
			<div id="commentArea" class="comment_area">
				<!-- 기초데이터 설정 -->

				<!-- 댓글 내용 시작 -->
				<ul class="comment_box">
					<li class="comment_text01"><font color="black">댓글등록</font></li>
					<li>
						<ul class="comment_inputBox">
							<form method="post" action="#" name="replyForm">
								<c:choose>
									<c:when test="${memberNumber != null }"> <!-- 로그인이 되어 있는 경우 -->
										<li class="common_textarea"><textarea class="comm_textarea" id="replyText"  title="댓글입력" name="replyContent" placeholder="비속어를 사용하지 말아주세요."></textarea></li>
										<li class="common_btnBox"><button type="button" class="comm_btn" onclick="send()">등록</button></li>
									</c:when>
									<c:otherwise> <!-- 로그인이 되어 있지 않은 경우 -->
										<li class="common_textarea"><textarea class="comm_textarea" title="댓글입력" name="replyContent" placeholder="로그인 후에 입력 가능합니다." disabled></textarea></li>
										<li class="common_btnBox"><button type="button" class="comm_btn">등록</button></li>
									</c:otherwise>
								</c:choose>
							</form>
						</ul>
					</li>
					<li class="comment_text02 showLength">0/1000byte</li>
				</ul>
				<!-- 댓글 내용 종료 -->

				<!-- 댓글 리스트 -->
				<div class="reply">
					<form action="#" id="replyList" name="reModifyForm"></form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script>
	var communityNumber = "${board.getCommunityNumber()}";
	var memberNumber = "${board.getMemberNumber()}"; // 게시글을 작성한 회원의 번호
	let memberId = "${board.getMemberId()}";
	
	/* 현재 로그인 한 회원의 세션 */
	 var loginSession = '<%=(Integer)session.getAttribute("memberNumber")%>';
	
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/community/reply.js"></script>
</html>