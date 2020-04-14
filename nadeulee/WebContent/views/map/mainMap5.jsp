<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <title>Simple Map</title>
 <meta name="viewport" content="initial-scale=1.0">
 <meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
      center: {lat: 35.84, lng: 128.55}
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
 	
 	var center = [	
 		{lat: 35.875018095799, lng: 128.61022254607482},
        {lat: 35.86813554727083, lng: 128.6147671478279},
        {lat: 35.854932807147186, lng: 128.6083561551019},
        {lat: 35.860184036882636, lng: 128.5746031291938},
        {lat: 35.86260522086231, lng: 128.57424275449134},
        {lat: 35.87903321509162, lng: 128.58002251965559},
        {lat: 35.875018095799, lng: 128.61022254607482},
        {lat: 35.875018095799, lng: 128.61022254607482}
        ];
	 		
	var seo = [	
 		{lat: 35.87903321509162, lng: 128.58002251965559},
        {lat: 35.86260522086231, lng: 128.57424275449134},
        {lat: 35.85448274440289, lng: 128.54804702908885},
        {lat: 35.869537289079176, lng: 128.5190300767411},
        {lat: 35.88799448446839, lng: 128.52569924514012},
        {lat: 35.87903321509162 , lng: 128.58002251965559},
        {lat: 35.87903321509162, lng: 128.58002251965559}
        ];	 		
	
	var south = [
		{lat: 35.854932807147186, lng: 128.6083561551019},
        {lat: 35.80916637849655, lng: 128.5916823399427},
        {lat: 35.807707186749354, lng: 128.58748744548922},
        {lat: 35.83443020196186, lng: 128.55538454886468},
        {lat: 35.860184036882636, lng: 128.5746031291938},
        {lat: 35.854932807147186 , lng: 128.6083561551019}
	]
	/* var dong= [
		{lat: 35.99307580176681, lng: 128.73470063352892},
		{lat: 35.99068829761382, lng: 128.73316403261364},
		{lat: 35.99010720002594, lng: 128.73206401923736},
		{lat: 35.98938130012162, lng: 128.73159182966748},
		{lat: 35.98751144193859, lng: 128.73118684771393},
		{lat: 35.98601429211175, lng: 128.73140117849923},
		{lat: 35.98536143587345, lng: 128.7309739455313},
		{lat: 35.983753068141816, lng: 128.73223979370172},
		{lat: 35.98310317361592, lng: 128.73319290410117},
		{lat: 35.945105671224646, lng: 128.74363020524913}, 
		{lat: 35.94492522278742, lng: 128.7437041617869}, 
		{lat: 35.9439580732785, lng: 128.74408670691028}, 
		{lat: 35.94297836905648, lng: 128.74381378715702}, 
		{lat: 35.94227478754494, lng:  128.74304792417007}, 
		{lat: 35.937606788705146, lng:  128.73983979651442}, 
		{lat: 35.9375029885485, lng:  128.7397672404997}, 
		{lat: 35.9146448497285, lng:  128.75550760513744}, 
		{lat: 35.91439938622805, lng:  128.75565181427106}, 
		{lat: 35.887237888788206, lng:  128.76138154354237}, 
		{lat: 35.887065624213804, lng:  128.76128637483168}, 
		
        [ lang: 128.7598178227643, 35.866859309877654 ],
        [ lang: 128.75981857143532, 35.86678411141532 ],
        [ lang: 128.74032326310075, 35.85220076728611 ],
        [ lang: 128.739881542102, 35.8519942769952 ],
        [ lang: 128.7374535240631, 35.851160648300656 ],
        [ lang: 128.73628227309777, 35.85lang: 1284856918575 ],
        [ lang: 128.72551083785038, 35.85780099067629 ],
        [ lang: 128.67999785161942, 35.86212695830509 ],
        [ lang: 128.65079773393614, 35.87836006825259 ],
        [ lang: 128.6147671478279, 35.86813554727083 ],
        [ lang: 128.61022254607482, 35.875018095799 ],
        [ lang: 128.63184334333585, 35.89312565528483 ],
        [ lang: 128.62697327714358, 35.95825884254795 ],
        [ lang: 128.60335923053947, 35.98798734396206 ],
        [ lang: 128.60360071742093, 35.98822601388796 ],
        [ lang: 128.60481022933484, 35.98942073287718 ],
        [ lang: 128.60599289315024, 35.99082502960832 ],
        [ lang: 128.60613397041328, 35.991203584643976 ],
        [ lang: 128.6065089806228, 35.992083476061985 ],
        [ lang: 128.60704146144633, 35.99255381861845 ],
        [ lang: 128.60769318375165, 35.9931139244816 ],
        [ lang: 128.60830937760167, 35.99341143825253 ],
        [ lang: 128.60864341837433, 35.99359652607783 ],
        [ lang: 128.6088380926183, 35.99393623935934 ],
        [ lang: 128.6090027754094, 35.994639803940906 ],
        [ lang: 128.60954479511364, 35.99505129862948 ],
        [ lang: 128.6095785813569, 35.99507703075351 ],
        [ lang: 128.61021862724812, 35.99610275527793 ],
        [ lang: 128.61019017970807, 35.99611644219186 ],
        [ lang: 128.61019523767132, 35.996280201782646 ],
        [ lang: 128.6101956784411, 35.99628526808989 ],
        [ lang: 128.6101981954839, 35.996323533188395 ],
        [ lang: 128.6101369350199, 35.99644656652363 ],
        [ lang: 128.61006373148894, 35.99668155575763 ],
        [ lang: 128.61005254999378, 35.996747146285216 ],
        [ lang: 128.61038938542632, 35.99691570088883 ],
        [ lang: 128.61055192736796, 35.99698504796746 ],
        [ lang: 128.61069255357992, 35.99705018683188 ],
        [ lang: 128.61085797556677, 35.997093353357904 ],
        [ lang: 128.61083393147302, 35.99711812176803 ],
        [ lang: 128.6108091786371, 35.99714492462764 ],
        [ lang: 128.61103009934976, 35.99751170226147 ],
        [ lang: 128.61137821381334, 35.9976745770412 ],
        [ lang: 128.61182365463375, 35.99795576397511 ],
        [ lang: 128.61204329438587, 35.99837696936956 ],
        [ lang: 128.6125159053662, 35.99929678476548 ],
        [ lang: 128.61355287404544, 35.99952104985042 ],
        [ lang: 128.61571659335465, 36.00097715565245 ],
        [ lang: 128.6161513579533, 36.00214219240171 ],
        [ lang: 128.61628770994173, 36.002557678905426 ],
        [ lang: 128.61665188806714, 36.003641998826915 ],
        [ lang: 128.61742843564923, 36.00652384430619 ],
        [ lang: 128.61748582039385, 36.00673736505646 ],
        [ lang: 128.6324299437088, 36.00813988772396 ],
        [ lang: 128.63302527484845, 36.008270051685315 ],
        [ lang: 128.63484631574684, 36.00903035901045 ],
        [ lang: 128.6362433280134, 36.00909537198001 ],
        [ lang: 128.63739733558074, 36.009192102391005 ],
        [ lang: 128.63995920835478, 36.009571352048184 ],
        [ lang: 128.64013010776287, 36.00980896929306 ],
        [ lang: 128.64078254646665, 36.01054996136207 ],
        [ lang: 128.65419140836792, 36.009455388914574 ],
        [ lang: 128.65426791497893, 36.00944685050893 ],
        [ lang: 128.66417966762262, 36.01011125779763 ],
        [ lang: 128.66418455240438, 36.0101lang: 1287570798 ],
        [ lang: 128.67364687406467, 36.013382985299415 ],
        [ lang: 128.67745313563154, 36.013246491457856 ],
        [ lang: 128.69559638954976, 36.016165116930104 ],
        [ lang: 128.72132624474943, 36.006360350972244 ],
        [ lang: 128.7218935251517, 36.006198606935726 ],
        [ lang: 128.7309901080981, 35.9976724702787 ],
        [ lang: 128.73187299677605, 35.997527170245995 ],
        [ lang: 128.73470063352892, 35.99307580176681, },
	] */

 	var centerP = new google.maps.Polygon({
        paths: center,
        strokeOpacity: 1,
        strokeWeight: 1,
        fillColor: 'gray',
        fillOpacity: 0.3
      });
		centerP.setMap(map);
      
      var seoP = new google.maps.Polygon({
          paths: seo,
          strokeOpacity: 1,
          strokeWeight: 1,
          fillColor: 'gray',
          fillOpacity: 0.3
        });
      	seoP.setMap(map);
      	
      	var southP = new google.maps.Polygon({
            paths: south,
            strokeOpacity: 1,
            strokeWeight: 1,
            fillColor: 'gray',
            fillOpacity: 0.3
          });
      	southP.setMap(map);
        
      google.maps.event.addListener(centerP, 'click', function () {
    	  location.href = 'jungu.cate';
    	});  
      google.maps.event.addListener(centerP, 'mouseover', function () {
    	  this.setOptions({fillColor: 'blue'});
    	});
      google.maps.event.addListener(centerP, 'mouseout', function () {
    	  this.setOptions({fillColor: 'gray'});
    	});
      
      google.maps.event.addListener(seoP, 'click', function () {
    	  location.href = 'seogu.cate';
    	}); 
      google.maps.event.addListener(seoP, 'mouseover', function () {
    	  this.setOptions({fillColor: 'yellow'});
    	});
      google.maps.event.addListener(seoP, 'mouseout', function () {
    	  this.setOptions({fillColor: 'gray'});
    	});
      
      google.maps.event.addListener(southP, 'click', function () {
    	  location.href = 'namgu.cate';
    	}); 
      google.maps.event.addListener(southP, 'mouseover', function () {
    	  this.setOptions({fillColor: 'green'});
    	});
      google.maps.event.addListener(southP, 'mouseout', function () {
    	  this.setOptions({fillColor: 'gray'});
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