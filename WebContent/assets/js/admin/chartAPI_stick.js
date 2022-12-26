//구글 시각화 API를 로딩하는 메소드
google.charts.load('current', { packages: ['corechart'] });
// 구글 시각화 API가 로딩이 완료되면,
// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드
// 화면이 실행될때 함께 실행된다.
google.charts.setOnLoadCallback(columnChart1);

// 묶은 세로 막대형 차트 1
function columnChart1() {
    var arr = [
        ['날짜', '지원자 수'],
        ['09-28', 4],
        ['09-29', 7],
        ['09-30', 3],
        ['10-01', 2],
        ['10-02', 4],
        ['10-03', 2],
        ['10-04', 1]
    ];

    // 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
    var dataTable = google.visualization.arrayToDataTable(arr);

    // 옵션객체 준비
    var options = {
        legend: {
            position: 'none' // 범례 없애기
        },
        series: { // 선 색 바꾸기
            0: { color: '#A0BAED' }
        }
    };
    // 차트를 그릴 영역인 div 객체를 가져옴
    var objDiv = document.getElementById('stickChart');
    // 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
    var chart = new google.visualization.ColumnChart(objDiv);
    // 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
    chart.draw(dataTable, options);
} // drawColumnChart1()의 끝