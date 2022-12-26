<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mentor/mentor_write.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mentor/subheader.css"/>
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

    <div class="contentfullwrap">
        <div class="contentwrap">
            <h2 class="pagetitle" id="contentBox" tabindex="0">
                </h2>
            <div class="base_boardwrap">
                <div class="printboard">
                    <div class="base_boardwrite02">
                    <form method="post" action="" name="writeForm">
                            <table class="brdTline02 tblspace01">
                                <colgroup>
                                    <col width="20%">
                                    <col width="80%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                            <div class="iron-input-note">
                                                <span class="content"><input type="text" name="mentorTitle" id="nttSj" class="val" title="제목" maxlength="1900"></span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>지역</th>
                                        <td>
                                            <div class="iron-input-note">
                                                <span class="content"><input type="text" name="mentorLocation" id="nttSj" class="val" title="제목" maxlength="1900"></span>
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                        <th>주작물</th>
                                        <td>
                                            <div class="iron-input-note">
                                                <span class="content"><input type="text" name="mentorCrops" id="nttSj" class="val" title="제목" maxlength="1900"></span>
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <div class="iron-input-note">
                                                <span class="content"><input type="text" name="mentorName" id="nttSj" class="val" title="제목" maxlength="1900"></span>
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>
                                            <div class="iron-input-note">
                                                <span class="content"><input type="text" name="mentorEmail" id="nttSj" class="val" title="제목" maxlength="1900"></span>
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td>
                                            <div class="iron-input-note">
                                                <span class="content"><input type="text" name="mentorPhoneNumber" id="nttSj" class="val" title="제목" maxlength="1900"></span>
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                            <th>첨부파일</th>
                                            <td>
                                                <div class="fileInfo">
                                                    <input type="file" id="egovComFileUploader" title="첨부파일" name="mentorImage">
                                                </div>
                                                <div id="egovComFileList"></div>
                                                    <span class="attchtext"> 첨부파일은 총 1개까지 가능합니다.</span>
                                            </td>
                                        </tr>
                                </tbody>
                            </table>
                            <span class="tbl_lineb"></span>
                            <div class="te_right mt25">
                                <button type="button" class="iron-iconized iron-action primary featured save" onclick="doInsert();">
                                    <span class="val">저장</span></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="${pageContext.request.contextPath}/assets/js/mentor/mentor_write.js"></script>
</html>