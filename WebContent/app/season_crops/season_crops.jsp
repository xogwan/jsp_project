<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작물 정보</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/season_crops/season_crops.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/app/fix/header.jsp" />

	<!-- 바디 -->

	<div class="sub_title">
		<div class="container">
			<div class="inner">
				<div class="title_left_box">
					<div class="snb_wrap">
						<nav class="snb">
							<div class="top" style="display: inline-block">농업정보</div>
							<div class="lgr_snb"
								style="display: inline-block; margin-left: 20px;">
								<ul class="lgr_ul">
									<li class="subMenu after_slash"><span class="checkText">
										<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci">
												작물 정보 </a>
									</span></li>
									<li class="after_slash"><span> <a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls">
												지역별 특산물 정보 </a>
									</span></li>
									<li class="nowMenu"><span class="subMenu"> <a href="${pageContext.request.contextPath}/season/info.sc">
												계절별 작물 추천 </a>
									</span></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
				<div class="title_right_box">
					<img
						src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=9WQzvMM7l2peGVnsOK9OIlCgIjetBkDg5Ctzg52GA8BQcOYk2JAfThrzr%2FPw8mLrGt6NK%2BJmQj8FAxin7nLW%2Fw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
				</div>
			</div>
		</div>
	</div>

	<!-- 3월~7월 재배 작물 캘린더 -->
	<div class="page_wrap c-step01">
		<div class="page_use">
			<div class="category">
				<ul class="center">
					<li class="ct1 li-step01"><a href="javascript:void(0);">3월~7월
							재배 작물 캘린더</a></li>
					<li class="ct2 li-step02"><a href="javascript:void(0);">8월~11월
							재배 작물 캘린더</a></li>
				</ul>
				<!-- 페이지공통 끝 -->

			</div>
			<div id="crops_callender">
				<img
					src="${pageContext.request.contextPath}/assets/images/season_crops/summer.jpg"
					id="summercrops">
			</div>
		</div>
	</div>

	<!-- 8월~11월 재배 작물 캘린더 -->
	<div class="page_wrap c-step02" style="display: none;">
		<div class="page_use">
			<div class="category">
				<ul class="center">
					<li class="ct2 li-step01"><a href="javascript:void(0);">3월~7월
							재배 작물 캘린더</a></li>
					<li class="ct1 li-step02"><a href="javascript:void(0);">8월~11월
							재배 작물 캘린더</a></li>
				</ul>
				<!-- 페이지공통 끝 -->

			</div>
			<div id="crops_callender" style="margin-top: 10px;">
				<img
					src="${pageContext.request.contextPath}/assets/images/season_crops/autumn.jpg"
					id="summercrops">
			</div>
		</div>
	</div>

	<jsp:include
		page="${pageContext.request.contextPath}/app/fix/footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/season_crops/season_crops.js"></script>
</html>