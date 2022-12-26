<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 특산물 정보</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/local_specialties/local_specialties.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
<!-- 바디 -->

<div class="sub_title">
    <div class="container">
        <div class="inner">
            <div class="title_left_box">
                <div class="snb_wrap">
                    <nav class="snb">
                        <div class="top" style="display: inline-block">농업정보</div>
                        <div class="lgr_snb" style="display: inline-block; margin-left: 20px;">
                            <ul class="lgr_ul">
									<li class="subMenu after_slash"><span class="checkText">
											<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci">
												작물 정보
											</a>
										</span></li>
									<li class="nowMenu after_slash"><span>
										<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls">
											지역별 특산물 정보
										</a>
										</span></li>
									<li><span class="subMenu">
										<a href="${pageContext.request.contextPath}/season/info.sc">
											계절별 작물 추천
										</a>
									</span></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="title_right_box">
                <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=9WQzvMM7l2peGVnsOK9OIlCgIjetBkDg5Ctzg52GA8BQcOYk2JAfThrzr%2FPw8mLrGt6NK%2BJmQj8FAxin7nLW%2Fw%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
            </div>
        </div>
    </div>
</div>

<div class="search">
    <form action="">
        <div class="first">
            <div class="search_title">특산물 검색</div>
            <div class="input_group">
                <input type="text" style="border: 1px solid #e3e3e3; height: 25px; width: 250px;">
            </div>
        </div>
        <div class="second">
            <div class="search_title">시/도 선택</div>
            <div class="input_group">
                <select name="" id="korea_city" class="dropbox_height" onchange="clickCityChange(this)">
                    <option>선택해주세요</option>
                    <option value="busan">부산광역시</option>
                    <option value="daegu">대구광역시</option>
                    <option value="incheon">인천광역시</option>
                    <option value="daejeon">대전광역시</option>
                    <option value="ulsan">울산광역시</option>
                    <option value="sejong">세종특별자치시</option>
                    <option value="gyeonggi">경기도</option>
                    <option value="gangwon">강원도</option>
                    <option value="chungcheongbuk-do">충정북도</option>
                    <option value="chungcheongdam-do">충청남도</option>
                    <option value="Jeollabuk-do">전라북도</option>
                    <option value="Jeollanam-do">전라남도</option>
                    <option value="Gyeongsangbuk-do">경상북도</option>
                    <option value="Gyeongsangnam-do">경상남도</option>
                </select>
            </div>
        </div>
        <div class="last">
            <div class="search_title">시/군/구 선택</div>
            <div class="input_group">
                <select name="" id="korea_smail_city" class="dropbox_height">
                    <option>선택해주세요</option> 
                </select>
            </div>
        </div>
        <button type="button" class="search_button" onclick="searchBtn()"></button>
    </form>
</div>
<div class="table_wrap">
    
    <table class="grid_topLine" style="margin-bottom: 60px;">
        <colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
        <thead>
            <th scope="col">번호</th>
            <th scope="col">사진</th>
            <th scope="col">특산물명</th>
            <th scope="col">지역</th>
            <th scope="col">등록일</th>
        </thead>
        <tbody>
			<c:choose>
				<c:when test="${localProductLists != null and fn:length(localProductLists) > 0}">
					<c:forEach var="localProduct" items="${localProductLists}">
			            <tr>
			                <td>${localProduct.getSpNumber()}</td>
			                <td>
			                    <img src="${pageContext.request.contextPath}/upload/localProduct/${localProduct.getSpImage()}" style="width: 128px; height: 108px;">
			                </td>
			                <td>${localProduct.getSpName()}</td>
			                <td>${localProduct.getSpLocation()}</td>
			                <td>${localProduct.getSpDate()}</td>
			            </tr>
					</c:forEach>
				</c:when>
			</c:choose>
        </tbody>
    </table>
</div>

  <!-- 페이징 -->
  <div id="page" style="margin-bottom: 30px">
		<div class="page_nation">
			<c:if test="${prev}">
				<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls?page=1" class="page-num arrow pprev"></a>
				<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls?page=${startPage - 1}" class="page-num arrow prev" ></a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${not (i eq page)}">
						<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls?page=${i}" class="page-num" >
							<c:out value="${i}"/>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls?page=${i}" class="page-num active" >
							<c:out value="${i}"/>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${next}">
				<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls?page=${endPage + 1}" class="page-num arrow next"></a>
				<a href="${pageContext.request.contextPath}/localSpecialty/searchOk.ls?page=${realEndPage}" class="page-num arrow nnext"></a>
			</c:if>
		</div>
	</div>

<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>
</body>


<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function searchBtn(){
		alert("서비스 준비 중입니다.");
	}
	
    // /* 지역(도,시) 누르면 세부 도시 드롭박스로 나오게 하기  */
    function clickCityChange(e){
        var busan = ["선택하세요", "기장군"];
        var daegu = ["선택하세요", "달서구"];
        var incheon = ["선택하세요","강화군","옹진군"];
        var daejeon = ["선택하세요"];
        var ulsan = ["선택하세요"];
        var sejong = ["선택하세요"];
        var gyeonggi = ["선택하세요","고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
        var gangwon = ["선택하세요","강릉시", "고성군", "양구군", "양양군", "영월군", "원주시", "인제군", "평창군", "홍천군", "횡성군"];
        var chungcheongbuk = ["선택하세요", "단양군", "음성군", "제천시", "증평군", "영동구", "충주시"];
        var chungcheongdam = ["선택하세요","계룡시", "공주시", "금산군", "논산시", "당진시", "동남구", "보령시", "부여군", "서북구", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"];
        var Jeollabuk = ["선택하세요","고창군", "김제시", "남원시", "덕진구", "무주군", "부안군", "순창군", "완산구", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
        var Jeollanam = ["선택하세요","강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "전라남도", "진도군", "함평군", "해남군", "화순군"];
        var Gyeongsangbuk = ["선택하세요","경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
        var Gyeongsangnam = ["선택하세요","거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];

        var target = document.getElementById("korea_smail_city");

        if(e.value == "busan") var list = busan;
        if(e.value == "daegu") var list = daegu;
        if(e.value == "incheon") var list = incheon;
        if(e.value == "daejeon") var list = daejeon;
        if(e.value == "ulsan") var list = ulsan;
        if(e.value == "sejong") var list = sejong;
        if(e.value == "gangwon") var list = gangwon;
        if(e.value == "gyeonggi") var list = gyeonggi;
        if(e.value == "chungcheongbuk-do") var list = chungcheongbuk;
        if(e.value == "chungcheongdam-do") var list = chungcheongdam;
        if(e.value == "Jeollabuk-do") var list = Jeollabuk;
        if(e.value == "Jeollanam-do") var list = Jeollanam;
        if(e.value == "Gyeongsangbuk-do") var list = Gyeongsangbuk;
        if(e.value == "Gyeongsangnam-do") var list = Gyeongsangnam;

        target.options.length = 0;

        for(x in list){
            var opt = document.createElement("option")
            opt.value = list[x];
            opt.innerHTML = list[x];
            target.appendChild(opt);
        }

    } 
</script>
</html>