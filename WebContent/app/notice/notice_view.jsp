<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <!-- 영문, 숫자 play 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/notice_view.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/subheader.css"/>
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
                                <li><a href="/young/board/board07.do" class="active">
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
                                    <th class="title">
                                        [전라남도] 2022 전라남도 귀농산어촌 고향사람 박람회</th>
                                </tr>
                                <tr class="datatext">
                                    <td class="datatext">
                                        <div class="datatext_l">등록일 : <span>2022.10.02</span></div>
                                        <ul class="datatext_r">
                                            <li>등록자 : 관리자</li>
                                            <li>조회수 : 21</li>
                                        </ul>
                                    </td>
                                </tr>
                                </thead>
                            <tbody>
                                <tr>
                                    <td class="textarea">
                                        <br>
    <br>행 사 명 : 2022년 전라남도 귀농산어촌 고향사랑 박람회
    <br>주 최 : 전라남도, 전라남도 22개 시·군
    <br>행사기간 : 2022. 9.29. ~ 10. 1.
    <br>홈페이지 :  https://jnfarm.jeonnam.go.kr/farmex/index.do
                                </tr>
                                <tr class="file">
                                    <td class="tblpd01">
                                        <div id="fileList"><a href="javascript:void(0)" onclick="javascript:FL.vtexDownloadFile(&quot;FILE_000000000088177&quot;,&quot;1&quot;,&quot;FL&quot;)">123.jpg [204155 byte]</a><br></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="te_right mt25">
                            <button type="button" class="iron-iconized iron-action return" onclick="doList();"><span class="val">목록</span></button>
                        </div>
                        
                    </div>
                </div>
            </div>
    
    </div>
            </div>
        </div>
<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</html>