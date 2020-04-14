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
      zoom: 10,
      center: {lat: 35.86, lng: 128.55}
    });

    var labels = '북남중서동수달군';
  

  // Data for the markers consisting of a name, a LatLng and a zIndex for the
  // order in which these markers should display on top of each other.
  
  var markers = locations.map(function(location, i) {
          return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length]
          });
        });
  
  var markerCluster = new MarkerClusterer(map, markers,
          {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
    }
  
  var locations = [
    {lat: 35.88, lng: 128.58},
    {lat: 35.84, lng: 128.59},
    {lat: 35.86, lng: 128.60},
    {lat: 35.87, lng: 128.55},
    {lat: 35.88, lng: 128.63},
    {lat: 35.85, lng: 128.63},
    {lat: 35.83, lng: 128.53},
    {lat: 35.77, lng: 128.43}
  ]
 
  </script>
  <!-- Replace following script src -->
  <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
  
    <script  async defer
  			    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHbC7NopLG_Ivy9mNugiG_LMcP4X0m2cU&callback=initMap">
   </script>
   
  </body>
</html>