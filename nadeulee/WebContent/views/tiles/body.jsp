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


<!-- ======= What We Do Section ======= -->
<section id="what-we-do" class="what-we-do">
	<div class="container">

		<div class="section-title">
			<h2>대구에 오시면</h2>
			<p>매우 더워요 불닭볶음면 같이 먹으면 더 더워</p>
		</div>

		<div class="row">
			<div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bxl-dribbble"></i>
					</div>
					<h4>
						<a href="">여기 뭐할지 생각좀</a>
					</h4>
					<p>생각을하자 생각 띵크띵크</p>
				</div>
			</div>

			<div
				class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bx-file"></i>
					</div>
					<h4>
						<a href="">빨리끝내요호호호호호</a>
					</h4>
					<p>그마안그마안그망ㄴ</p>
				</div>
			</div>

			<div
				class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bx-tachometer"></i>
					</div>
					<h4>
						<a href="">흐규규ㅠ규귝규규</a>
					</h4>
					<p>잘거야잘거야</p>
				</div>
			</div>

		</div>

	</div>
</section>
<!-- End What We Do Section -->

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

	$(document).ready(
			function() {
				$("#loc_ul").hover(
						function() {
							$('#regional_map').attr("src",
									'views/mainmap/img/DAEGU_Buk-gu.png')
						},
						function() {
							$('#regional_map').attr("src",
									'views/mainmap/img/DAEGU_Map.png')
						});
			});
</script>
<div id="contents">
	<!-- map -->
	<img src="views/mainmap/img/DAEGU_Map.png" width="289" height="359"
		usemap="#Map" border="0" id="regional_map" />
	<map name="Map" id="Map">

		<area shape="poly"
			coords="123,32,123,48,126,69,108,95,109,106,125,110,137,104,154,110,164,125,179,120,188,107,194,108,192,96,192,78,192,62,189,57,189,49,182,28"
			href="bukgu.cate" target="북구" id="loc_ul" />

	</map>
	<!--// map -->

	<div class="card_box">
		<div>1</div>
		<div>2</div>
		<div>3</div>
		<div>4</div>
	</div>
</div>









<!-- ======= review Section ======= -->
<section id="testimonials" class="testimonials section-bg">
	<div class="container">

		<div class="section-title">
			<h2>베스트 후기</h2>
			<p>베스트 후기야 누눈누눈나나나나나</p>
		</div>

		<div class="owl-carousel testimonials-carousel">

			<div class="testimonial-item">
				<p>
					<i class="bx bxs-quote-alt-left quote-icon-left"></i> 대구는 아프리카보다 매우
					덥습니다 서프라이즈 굉장히 놀랍다뉸 <i
						class="bx bxs-quote-alt-right quote-icon-right"></i>
				</p>
				<img src="assets/img/testimonials/testimonials-1.jpg"
					class="testimonial-img" alt="">
				<h3>마이넴 사울굿맨</h3>
				<h4>Ceo &amp; Founder</h4>
			</div>

			<div class="testimonial-item">
				<p>
					<i class="bx bxs-quote-alt-left quote-icon-left"></i> 가나다라마바사
					아차차차차차차 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
				</p>
				<img src="assets/img/testimonials/testimonials-2.jpg"
					class="testimonial-img" alt="">
				<h3>Sara Wilsson</h3>
				<h4>Designer</h4>
			</div>

			<div class="testimonial-item">
				<p>
					<i class="bx bxs-quote-alt-left quote-icon-left"></i> 그만하고싶다
					빨리끝내끝내끝내 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
				</p>
				<img src="assets/img/testimonials/testimonials-3.jpg"
					class="testimonial-img" alt="">
				<h3>Jena Karlis</h3>
				<h4>Store Owner</h4>
			</div>

			<div class="testimonial-item">
				<p>
					<i class="bx bxs-quote-alt-left quote-icon-left"></i> Fugiat enim
					eram quae cillum dolore dolor amet nulla culpa multos export minim
					fugiat minim velit minim dolor enim duis veniam ipsum anim magna
					sunt elit fore quem dolore labore illum veniam. <i
						class="bx bxs-quote-alt-right quote-icon-right"></i>
				</p>
				<img src="assets/img/testimonials/testimonials-4.jpg"
					class="testimonial-img" alt="">
				<h3>Matt Brandon</h3>
				<h4>Freelancer</h4>
			</div>

			<div class="testimonial-item">
				<p>
					<i class="bx bxs-quote-alt-left quote-icon-left"></i> Quis quorum
					aliqua sint quem legam fore sunt eram irure aliqua veniam tempor
					noster veniam enim culpa labore duis sunt culpa nulla illum cillum
					fugiat legam esse veniam culpa fore nisi cillum quid. <i
						class="bx bxs-quote-alt-right quote-icon-right"></i>
				</p>
				<img src="assets/img/testimonials/testimonials-5.jpg"
					class="testimonial-img" alt="">
				<h3>John Larson</h3>
				<h4>Entrepreneur</h4>
			</div>

		</div>

	</div>
</section>
<!-- End review Section -->