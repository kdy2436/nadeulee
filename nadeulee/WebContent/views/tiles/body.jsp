<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ======= Hero Section ======= -->
<section id="hero"
	class="d-flex flex-column justify-content-center align-items-center">
	<div class="container text-center text-md-left" data-aos="fade-up">
		<h1>
			Welcome to <span>DAEGU</span>
		</h1>
		<h2>대구로 오십시여</h2>
		<a href="#about" class="btn-get-started scrollto">Get Started</a>
	</div>
</section>
<!-- End Hero -->
<br />

<!-- map js -->
<script src="js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	function regional_map_on(local) {
		document.getElementById('regional_map').src = './img/DAEGU_' + local
				+ '.png'
	}
	function regional_map() {
		document.getElementById("regional_map").src = "./img/DAEGU_Map.png";
	}

	$(document).ready(function() {
		$("#loc_ul").hover(function() {
			$('#regional_map').attr("src", 'views/mainmap/img/DAEGU_Buk-gu.png')
		}, function() {
			$('#regional_map').attr("src", 'views/mainmap/img/DAEGU_Map.png')
		});
	});
</script>
<!-- map -->
<img src="views/mainmap/img/DAEGU_Map.png" width="289" height="359"
	usemap="#Map" border="0" id="regional_map" />
<map name="Map" id="Map">

	<area shape="poly"
		coords="123,32,123,48,126,69,108,95,109,106,125,110,137,104,154,110,164,125,179,120,188,107,194,108,192,96,192,78,192,62,189,57,189,49,182,28"
		href="#" target="북구" id="loc_ul" onclick="infoList.do" />

</map>
<!--// map -->