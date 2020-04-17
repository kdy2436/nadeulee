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
  // The following example creates complex markers to indicate beaches near
  // Sydney, NSW, Australia. Note that the anchor is set to (0,32) to correspond
  // to the base of the flagpole.

  function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
      center: {lat: 35.86, lng: 128.55}
    });

    setMarkers(map);
  }

  // Data for the markers consisting of a name, a LatLng and a zIndex for the
  // order in which these markers should display on top of each other.
  var regions = [
    ['북구', 35.885882, 128.582925, 4],
    ['남구', 35.84, 128.59, 5],
    ['중구', 35.86, 128.60, 3],
    ['서구', 35.87, 128.55, 2],
    ['동구', 35.88, 128.63, 1],
    ['수성구', 35.85, 128.63, 6],
    ['달서구', 35.83, 128.53, 7],
    ['달성군', 35.77, 128.43, 7]
  ];

  function setMarkers(map) {
    // Adds markers to the map.

    // Marker sizes are expressed as a Size of X,Y where the origin of the image
    // (0,0) is located in the top left of the image.

    // Origins, anchor positions and coordinates of the marker increase in the X
    // direction to the right and in the Y direction down.
    
    /* var image = {
      url: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
      // This marker is 20 pixels wide by 32 pixels high.
      size: new google.maps.Size(20, 32),
      // The origin for this image is (0, 0).
      origin: new google.maps.Point(0, 0),
      // The anchor for this image is the base of the flagpole at (0, 32).
      anchor: new google.maps.Point(0, 32)
    }; */
    
    // Shapes define the clickable region of the icon. The type defines an HTML
    // <area> element 'poly' which traces out a polygon as a series of X,Y points.
    // The final coordinate closes the poly by connecting to the first coordinate.
   
    /* var shape = {
      coords: [20, 1, 1, 20, 18, 20, 18, 1],
      type: 'poly'
    }; */
    
    for (var i = 0; i < regions.length; i++) {
      var region = regions[i];
      var marker = new google.maps.Marker({
        position: {lat: region[1], lng: region[2]},
        map: map,
        /* icon: image,
        shape: shape, */
        title: region[0],
        zIndex: region[3]
      });
    }
  marker.addListener('click', function() {
 		location.href = 'http://map.daum.net';
    });
  }

    </script>
    
    <script  async defer
  			    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHbC7NopLG_Ivy9mNugiG_LMcP4X0m2cU&callback=initMap">
   </script>
   
  </body>
</html>