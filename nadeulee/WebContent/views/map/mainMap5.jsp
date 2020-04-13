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
        height:  800px;
        width: 800px;
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
  // The following example creates complex markers to indicate beaches near
  // Sydney, NSW, Australia. Note that the anchor is set to (0,32) to correspond
  // to the base of the flagpole.

  function initMap() {
 	 var map = new google.maps.Map(document.getElementById('map'), {
	  zoom: 12,
      center: {lat: 35.82, lng: 128.55}
    });
 	 
// 	var aa = map.data.loadGeoJson('DaeguXY.json');
// 	var bb = map.data.loadGeoJson('daeguLatLng.json');
	
 	/* google.maps.event.addListener(bb, 'click', function () {
 	    var polygonPaths = this.getPaths();
 	}); */
 	
 	/* map.data.setStyle({
 		  fillColor: 'green',
 		  strokeWeight: 0
 		}); */
 		
		/* map.data.addListener('click', function(aa) {
	 		  location.href = 'http://map.daum.net';
	 		}); */
 	
 	var path1 = [	
 		{lat: 35.875018095799, lng: 128.61022254607482},
        {lat: 35.86813554727083, lng: 128.6147671478279},
        {lat: 35.854932807147186, lng: 128.6083561551019},
        {lat: 35.860184036882636, lng: 128.5746031291938},
        {lat: 35.86260522086231, lng: 128.57424275449134},
        {lat: 35.87903321509162, lng: 128.58002251965559},
        {lat: 35.875018095799, lng: 128.61022254607482},
        {lat: 35.875018095799, lng: 128.61022254607482}
        ];
	 		
	var path2 = [	
 		{lat: 35.87903321509162, lng: 128.58002251965559},
        {lat: 35.86260522086231, lng: 128.57424275449134},
        {lat: 35.85448274440289, lng: 128.54804702908885},
        {lat: 35.869537289079176, lng: 128.5190300767411},
        {lat: 35.88799448446839, lng: 128.52569924514012},
        {lat: 35.87903321509162 , lng: 128.58002251965559},
        {lat: 35.87903321509162, lng: 128.58002251965559}
        ];	 		

	
 	var aa = new google.maps.Polygon({
        paths: path1,
        strokeOpacity: 0,
        strokeWeight: 0,
        fillColor: '#FF0000',
        fillOpacity: 0.35
      });
      aa.setMap(map);
      
      var bb = new google.maps.Polygon({
          paths: path2,
          strokeOpacity: 0,
          strokeWeight: 0,
          fillColor: 'green',
          fillOpacity: 0.35
        });
        bb.setMap(map);
        
      google.maps.event.addListener(aa, 'click', function (event) {
    	  location.href = 'http://map.daum.net';;
    	});  
      google.maps.event.addListener(bb, 'click', function (event) {
    	  location.href = 'http://google.ca';;
    	}); 

}

  </script>
  <!-- Replace following script src -->
  <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
  
    <script  async defer
  			    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHbC7NopLG_Ivy9mNugiG_LMcP4X0m2cU&callback=initMap">
   </script>
   
  </body>
</html>