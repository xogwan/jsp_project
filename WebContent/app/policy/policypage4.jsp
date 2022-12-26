<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>policypage4</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/policy/policypage4.css"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
<div class="wrap">
        <!-- 네비게이션바 아래 title -->
        <!-- 서브 타이틀 -->
        <div class="sub_title">
            <div class="container">
                <div class="inner">
                    <!-- "마이페이지" 폰트 -->
                    <div class="left_font">
                        <div class="mypage">
                            <nav><div class="top">청년농<br>지원정책</div></nav>
                        </div>
                    </div>
    
                    <!-- 일러스트 이미지 -->
                    <div class="title_right_box">
                        <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=XJKjJU8OzegQ%2BDiV5x7F9P1nfaGrzsDW9DBRmMR2rPeZH1GTL0obnQKzrJdHZO%2F5xk6mL2R1vUTo0DwHGuMCLA%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                    </div>
                </div>
            </div>
        </div>
        <div class="page_wrap">
        <div class="page_use">
            <div class="category">
            <ul>
	            <a href="${pageContext.request.contextPath}/policy/policys1.po">
	            	<li class="ct1">청년후계농 영농정착 지원사업</li>
	            </a>
	            <a href="${pageContext.request.contextPath}/policy/policys2.po">
	                <li class="ct2">후계농업 경영인 육성사업</li>
	            </a>
                <a href="${pageContext.request.contextPath}/policy/policys3_1.po">
	            	<li class="ct3">귀농귀촌 지원사업</li>
	            </a>
	            <a href="${pageContext.request.contextPath}/policy/policys4.po">
	            	<li class="ct4">청년농업인 경쟁력 제고사업</li>
	            </a>
            </ul>
        </div>
    </div>
</div>
</div> 
        <!-- 페이지공통 끝 -->
    <div class="table_wrap">
    <div class="table">
        <div class="table1">
            <div class="table1_content1">
                <div class="note_img">
                <img src="https://www.rda.go.kr/young/images/sub01/sub03_01_bg03.png" class="table1_img">
                <p>
                    <strong>청년농업인</strong><br>경쟁력 제고사업
                </p>
                </div>
            </div>
            <div class="table1_content2">
                <div class="table1_content2_first">
                    <h4>지원대상</h4>
                    <p>사업시행년도 기준 만18세 이상 ~ 만 40세 미만 청년농업인으로 2년 이상 영농에 종사한 병역필 또는
                        <span class="line">면제자</span>
                    </p>
                </div>
                <div class="table1_content2_second">
                    <h4>사업내용</h4>
                    <p>개소당 50백만원 경상적 사업비 지원(자부담 10%)<br>
                        <span class="line">- 신제품 개발, 가공 · 상품화, 시제품 제작, 체험프로그램 개발 등 지원</span><br>
                        <span class="line">- 브랜드 · 상품로고 제작, 앱 · 전자상거래 홈페이지 구축 등 유통 · 마케팅 개선 지원</span><br>
                        <span class="line">- 창업아이템과 관련된 지식재산권 확보에 소요되는 비용 지원 등</span>
                    </p>
                </div>
                <div class="table1_content2_third">
                    <h4>신청방법</h4>
                    <p>시군농업기술센터(7~8월중)</p>
                </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>
</html>