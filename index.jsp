<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css" type="text/css">
<title>위상에 따른 Sin 함수의 실효값</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	var arrsin = [['x', 'sin(x)']];
	var number = parseInt(location.search.substring(1).split("=")[1]);
	var amplitude = number;
	
	for (var i = 0; i <= 360; i++) {
		arrsin.push([i * (2/360) * Math.PI, amplitude * Math.sin(i * (2/360) * Math.PI)]);
	      }
	
	var tickhAxis = [];
	  
	  for (var j = 0; j <= 2; j += 0.25) {
	    tickhAxis.push({
	      v: j * Math.PI,
	      f: j.toString() + "\u03c0"
	    });
	  }

      function drawChart() {        	
          var data = google.visualization.arrayToDataTable(arrsin);
	
          var options = {
         	    title: '위상에 따른 Sin 함수의 실효값',
         	    curveType: 'function',
         	    legend: { position: 'bottom' },
          	hAxis: {
          		ticks: tickhAxis
           },
           vAxis: {
                  viewWindow: {
                      min: amplitude * -1.5,
                      max: amplitude * 1.5
                  }
              },
           width: 1000,
           height: 400,
         	 	
         	};
	
          var chart = new google.visualization.LineChart(document.getElementById('chart'));
          chart.draw(data, options);
      }
</script>
</head>
<body>
    <div id="chart"></div>
    <c:import url="body.jsp"/>
</body>
</html>
