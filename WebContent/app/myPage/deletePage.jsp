<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage/delete.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    <title>회원탈퇴</title>
</head>

<body>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
    <div class="wrap">
        <!-- 네비게이션바 아래 title -->
        <div class="sub_title">
            <div class="container">
                <div class="inner">
                    <!-- 상단 "회원탈퇴" 폰트 -->
                    <div class="left_font">
                        <div class="mypage">
                            <nav>
                                <div class="top">회원탈퇴</div>
                            </nav>
                        </div>
                    </div>

                    <!-- 일러스트 이미지 -->
                    <div class="title_right_box">
                        <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=ybeUrSjBOXZnYzXPeGpV8EB4nLayDSOijEyayiHqRzP3wf2uZqRIcoNdks4zvn4GD3g57TCf1WZ%2BzJ6F3647Hw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                    </div>
                </div>
            </div>
        </div>

        <!-- 회원탈퇴 폼 -->
        <div class="sub_content">
            <div class="container">
                <div class="inner">
                    <form action="${pageContext.request.contextPath}/mypage/DeleteOk.my" name = "deleteForm"class="dropUserForm">
                        <!-- 회원 탈퇴 안내 부분 -->
                        <div class="title">
                            <h2>회원탈퇴 안내</h2>
                        </div>
                        <div class="dropContainer">
                            <div class="dropInfo">
                                <div id="bigca">회원탈퇴안내</div>
                                <div class="smallca">
                                    <p>고객님께서 회원 탈퇴를 원하신다니 저희 서비스가 많이 부족하고 미흡했나봅니다. 불편하셨던 점이나 불편사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.</p>
                                    <span>아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</span>
                                    <p>1. 회원 탈퇴 후 30일간 재가입이 불가능합니다.</p>
                                    <p>2. 회원 탈퇴 기타 문의사항은 이메일을 통해서 가능합니다.</p>
                                </div>
                            </div>
                        </div>

                        <!-- 비밀번호 입력 및 확인하는 부분 -->
                        <div class="passwordCheck">
                            <div id="passwordCheckText">비밀번호 입력</div>
                            <div class="passwordInputDiv">
                             <input type="password" class="passwordInput" name="password" id="deletePassword" placeholder="현재 비밀번호를 입력해주세요">
                             <span class="tooltiptext">비밀번호를 확인해주세요</span>
                            </div>
                        </div>

                        <!-- 불편사항 체크 부분 -->
                        <div class="feedback">
                            <div id="feedbackText">무엇이 불편하였나요?</div>
                            <div class="checkBox">
                                <span><a class="feedback1"><img src="${pageContext.request.contextPath}/assets/images/deletePage/uncheckedBox.png">홈페이지 이용 불편</a></span>
                                <span><a class="feedback2"><img src="${pageContext.request.contextPath}/assets/images/deletePage/uncheckedBox.png">프로그램 다양성 부족</a></span>
                                <span><a class="feedback3"><img src="${pageContext.request.contextPath}/assets/images/deletePage/uncheckedBox.png">개인정보 유출 우려</a></span>
                                <span><a class="feedback4"><img src="${pageContext.request.contextPath}/assets/images/deletePage/uncheckedBox.png">서비스 불친절</a></span>
                            </div>
                        </div>

                        <!-- 텍스트 필드 -->
                        <div class="feedback">
                            <div class="feedback_back"></div>
                            <textarea id="feedbackInput" cols="35" rows="8" placeholder="회원님의 진심어린 충고 부탁드립니다."></textarea>
                        </div>

                        <!-- 버튼 -->
                        <div class="btn">
                            <input type="button" value="취소" id="cancelBtn" onclick="back()">
                            <input type="button" value="탈퇴" id="submitBtn" onclick="deleteMember()">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/deletePage/delete.js"></script>
</html>