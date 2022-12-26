<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작물 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cropsInfo/cropsInfo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fix/page.css" />


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp" />
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
									<li class="nowMenu after_slash"><span class="checkText">
											<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci">
												작물 정보
											</a>
										</span></li>
									<li class="subMenu after_slash"><span>
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
			<div style="display: flex;">

				<div class="first">
					<div class="search_title">카테고리</div>
					<div class="input_group">
						<select name="" class="kindName" onchange="cropsChange(this)" id="selectKinds">
							<option>선택하세요</option>
							<option value="crops">식량작물</option>
							<option value="vegetable">채소</option>
							<option value="fruit">과수</option>
						</select>
					</div>
				</div>
				<div class="box_margin">
					<div class="search_title">작물 분류</div>
					<div class="input_group">
						<select name="" class="kindName" id="selectCrops">
							<option>선택하세요</option>
						</select>
					</div>
				</div>
				<div class="box_margin">
					<div class="search_title">육성년도</div>
					<div class="input_group">
						<select name="" class="kindName" id="selectYears">
							<option>선택하세요</option>
							<option>2022</option>
							<option>2021</option>
							<option>2020</option>
							<option>2019</option>
							<option>2018</option>
						</select>
					</div>
				</div>
				<button type="button" onclick="searchBtn()" class="search_button"></button>
			</div>
	</div>
	<div class="table_wrap">

		<table class="grid_topLine" style="margin-bottom: 60px;">
			<colgroup>
				<col width="5%">
				<col width="6%">
				<col width="10%">
				<col width="6%">
				<col width="15%">
				<col width="13%">
				<col width="*">
			</colgroup>
			<thead>
				<th scope="col">번호</th>
				<th scope="col">사진</th>
				<th scope="col">작물명</th>
				<th scope="col">육성년도</th>
				<th scope="col">육성기관</th>
				<th scope="col">품종명</th>
				<th scope="col">주요특성</th>
			</thead>
			<tbody style="font-size:13px;" id="result">
				<c:choose>
					<c:when test="${cropsInfoLists != null and fn:length(cropsInfoLists) > 0}">
						<c:forEach var="cropsInfo" items="${cropsInfoLists}">
							<tr>
								<td>${cropsInfo.getCropsNumber()}</td>
								<td>
			                    	<img src="${pageContext.request.contextPath}/upload/cropsInfo/${cropsInfo.getCropsImage()}" style="width: 128px; height: 108px;">
								</td>
								<td>${cropsInfo.getCropsName()}</td>
								<td>${cropsInfo.getCropsDevYear()}</td>
								<td>${cropsInfo.getCropsInstitution()}</td>
								<td>${cropsInfo.getCropsDetailName()}</td>
								<td style="text-align:left;">${cropsInfo.getCropsExplain()}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
        			정보가 없습니다.
        		</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<!-- 페이징 -->
	<div id="page" style="margin-bottom: 30px">
		<div class="page_nation">
			<c:if test="${prev}">
				<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci?page=1" class="page-num arrow pprev"></a>
				<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci?page=${startPage - 1}" class="page-num arrow prev" ></a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${not (i eq page)}">
						<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci?page=${i}" class="page-num" >
							<c:out value="${i}"/>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci?page=${i}" class="page-num active" >
							<c:out value="${i}"/>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${next}">
				<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci?page=${endPage + 1}" class="page-num arrow next"></a>
				<a href="${pageContext.request.contextPath}/cropsInfo/searchOk.ci?page=${realEndPage}" class="page-num arrow nnext"></a>
			</c:if>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp" />
</body>


<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function searchBtn(){
		alert("서비스 준비 중입니다.");
	}

     // /* 카테고리 누르면 해당 작물분류 드롭박스로 나오게 하기  */
     function cropsChange(e){
        var crops = ["선택하세요","벼", "맥류", "두류", "잡곡류", "서류"];
        var vegetable = ["선택하세요","고추", "딸기", "마늘", "무", "방울토마토", "상추", "양배추", "양파", "토마토", "파"];
        var fruit = ["선택하세요", "감귤", "감", "매실", "배", "복숭아", "사과", "살구", "자두", "참다래(키위,다래)", "포도"];
        
        var target = document.getElementById("selectCrops");

        if(e.value == "crops") var list = crops;
        if(e.value == "vegetable") var list = vegetable;
        if(e.value == "fruit") var list = fruit;

        target.options.length = 0;

        for(x in list){
            var opt = document.createElement("option")
            opt.value = list[x];
            opt.innerHTML = list[x];
            target.appendChild(opt);
        }
    }

     search();

 	function search(){
 		let kind = $("#selectKinds").val() || 'none';
 		let crop = $("#selectCrops").val() || 'none';
 		let year = $("#selectYears").val() || 'none';
 		
 		$.ajax({
 			url: "${pageContext.request.contextPath}/cropsInfo/searchResult.ci",
 			type: "get",
 			data: {kind: kind, crop: crop, year: year},
 			dataType: "json",
 			
 			success: function(cropsInfos){
 		 		console.log(kind, crop, year);
 				let text = "";
 				let $result = $("#result");
 				if(cropsInfos.length == 0){
 					$result.html("정보가 없습니다.");
 				}
 				$.each(cropsInfos, function(i, cropsInfo){
 					text += `<tr>`;
					text += `<td>` + cropsInfo.cropsNumber + `</td>`;
					text += `<td>`
		            text += `<img src="` + ${pageContext.request.contextPath} + `/upload/cropsInfo/` + cropsInfo.cropsImage + `" style="width: 128px; height: 108px;">`;
					text += `</td>`
					text += `<td>` + cropsInfo.cropsName + `</td>`;
					text += `<td>` + cropsInfo.cropsDevYear + `</td>`;
					text += `<td>` + cropsInfo.cropsInstitution + `</td>`;
					text += `<td>` + cropsInfo.cropsDetailName + `</td>`;
					text += `<td style="text-align:left;">` + cropsInfo.cropsExplain + `</td>`;
					text += `</tr>`;
 					
 					$result.html(text);
 				});
 			}
 		});
 	}
</script>
</html>