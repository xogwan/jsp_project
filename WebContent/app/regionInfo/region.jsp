<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>지역 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/regionInfo/region.css">
</head>
<body>
  <jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp"/>
    <div class="sub_title">
        <div class="container">
            <div class="inner">
                <div class="title_left_box">
                    <div class="snb_wrap">
                        <nav class="snb">
                            <div class="top" style="display: inline-block">지역정보</div>
                            <div class="lgr_snb" style="display: inline-block; margin-left: 20px;">
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="title_right_box">
                    <img src="https://www.rda.go.kr/young/file/imageView.do?fpath=78mfPU1tH5tpGdf2EjZQb0R3AXuZGhjU7I8pBv4Rl9tqEaXhOUrKyqO8iZWgudng&fname=8nFVTgUIDUlBiYgKluFrhBdHVni9G2K67o64OtO8tD1DEXBRoHgiiIK%2BvPxFADkbugGa28PnSO6qNVxcSqtCKg%3D%3D&fmime=Lg45aghPCGTl0b%2FVATARWg%3D%3D">
                </div>
            </div>
        </div>
    </div>

<div class="inner">
<div class="sub03_tax_box">
    <ul>
        <li class="tax_b1">
            <div class="tax_text">
            <p class="f_01">마을회관 위치 확인하기</p>
        
            <p class="f_02">간단하게 마을회관 위치를 확인 할 수 있습니다.</p>
            </div>
        
            <div class="btn_wrap">
            <label>
           <input type="text" placeholder="원하는 지역을 입력하세요." name="searchLocal">
           <button id="search_button" onclick="searchLocal()"></button>
           </label>
            </div>
            </li>
    </ul>
</div>

    <div id="map" style="width: 79%; height: 640px; position: relative; overflow: hidden; background: url(http://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png); margin: 74px auto;}"></div>
    
    
</div>     
  <jsp:include page="${pageContext.request.contextPath}/app/fix/footer.jsp"/>



	
</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7cca52139ec39981bbfba225cd5346e&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다

function searchLocal(){
	
ps.keywordSearch($("input[name='searchLocal']").val(), placesSearchCB);

}





// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

</html>