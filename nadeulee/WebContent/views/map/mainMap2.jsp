<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height:  600px;
        width: 500px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    
  <script>
  var map; //map을 담을 변수 선언
  function initMap() {
                                 //div id가 map인 영역에 지도를 초기화
      map = new google.maps.Map(document.getElementById('map'), {
          zoom: 2, //지도의 zoom은 2로 설정.
          center: new google.maps.LatLng(2.8,-187.3), //지도가 초기화 될 때 중심 위치
          mapTypeId: 'terrain' //지도의 타입 : 육지, 위성 등이 있음
      });

      // 여러개의 위치 데이터를 가져오는 json 파일.
      var script = document.createElement('script');
      // This example uses a local copy of the GeoJSON stored at
      // http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
      script.src = 'https://developers.google.com/maps/documentation/javascript/examples/json/earthquake_GeoJSONP.js';
      document.getElementsByTagName('head')[0].appendChild(script);
  }

  // 리스트 정보를 for문을 돌려 각각의 위치에 마커를 표시한다.
  // set of coordinates.
  window.eqfeed_callback = function(results) {
      for (var i = 0; i < results.features.length; i++) {
    	  console.log(results);
          var coords = results.features[i].geometry.coordinates;
          console.log(coords);
          var latLng = new google.maps.LatLng(coords[1],coords[0]); //위도 경도 변수
          var marker = new google.maps.Marker({
              position: latLng, //여기에 위도 경도 정보를 입력하고 마커 생성
              map: map
          });
      }
  }

    </script>
    
    <script  async defer
  			    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHbC7NopLG_Ivy9mNugiG_LMcP4X0m2cU&callback=initMap">
   </script>
   
  </body>
</html>