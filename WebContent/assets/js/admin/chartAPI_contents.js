google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'date');
      data.addColumn('number', '추가');
      data.addColumn('number', '종료');

      // 차트 안에 들어갈 데이터
      data.addRows([
        ['8',  5, 7],
        ['9',  3, 7],
        ['10', 4, 8],
        ['11', 2, 3],
        ['12', 5, 6],
        ['13', 6, 7],
        ['14', 3, 4]
      ]);

      var options = {
        legend: {
          // position: 'none' // 범례 없애기
        },
        series: { // 선 색 바꾸기
          0: { color: '#A0BAED' },
          1: { color: '#ED9595' }
        },
        hAxis: { // x축 설정
          title: ''
        },
        vAxis: { // y축 설정
          maxValue: 10
        }
      };

      var chart = new google.charts.Line(document.getElementById('lineChart'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }