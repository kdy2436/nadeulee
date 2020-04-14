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
        height:  550px;
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
      var map, infoWindow, place;
      var x = ${vo.map_x};
      var y = ${vo.map_y};
      var loc ="${vo.title}";
//		 var x = 128.5874297180;
//		 var y = 35.8818101670;
      function initMap() {
    	  // 지도 중심에 표시할 장소 좌표 정보
    	 	place = { lat: y, lng: x };
    	  //지도 구현
       		map = new google.maps.Map(document.getElementById('map'), {
       		center: place,
       		zoom: 17
        }); 
       		
       	// 해당 장소 마크표시
    	  marker = new google.maps.Marker({
           		position : place,
           		map : map,
           		title : loc,
        		animation : google.maps.Animation.BOUNCE 	//마크 애니메이션 
              });
    	        marker.setMap(map);
    	   
    	   //마커 타이틀 표시
          infowindow = new google.maps.InfoWindow({
        	  content: loc
	       	});
 	      	 infowindow.open(map,marker);
 	      	 
 	      	//마커 클릭시 링크
 	      /*marker.addListener('click', function() {
 	      		location.href = 'http://map.daum.net';
 	         }); */
    	        
      }
    </script>
    
    <script  async defer
  			    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHbC7NopLG_Ivy9mNugiG_LMcP4X0m2cU&callback=initMap">
   </script>
   
  </body>
</html>