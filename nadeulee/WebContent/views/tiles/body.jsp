<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!-- ======= Hero Section ======= -->
<section id="hero"
	class="d-flex flex-column justify-content-center align-items-center">
	<div class="container text-center text-md-left" data-aos="fade-up">
		<h1>
			Welcome to <span>DAEGU</span>
		</h1>
		<h2>대구로 오세요</h2>
		<a href="reviewList.do" class="btn-get-started scrollto">여행후기보기</a>
	</div>
</section>
<!-- End Hero -->
<br />


<!-- =======  Section ======= -->
<section id="what-we-do" class="what-we-do">
	<div class="container">

		<div class="section-title">
			<h2>대구에 오시면</h2>
			<p>매우 더워요 불닭볶음면 같이 먹으면 더 더워</p>
		</div>

		<div class="row">
			<div
				class="col-lg-2 col-md-6 col-sm-4 d-flex align-items-stretch mt-4 mt-md-0">
				<div class="icon-box">
					<div class="icon">
						<i class='bx bxs-tree bx-tada bx-rotate-90' style='color: #007c0c'></i>
					</div>
					<h4>
						<a href="infoDetail.do?id=2360858">#팔공산</a>
					</h4>
					<p></p>
				</div>
			</div>

			<div
				class="col-lg-2 col-md-6 col-sm-4 d-flex align-items-stretch mt-4 mt-md-0">
				<div class="icon-box">
					<div class="icon">
						<i class='bx bx-happy-heart-eyes bx-tada bx-rotate-180'
							style='color: #ffbe00'></i>
					</div>
					<h4>
						<a href="infoDetail.do?id=128627">#이월드</a>
					</h4>
					<p></p>
				</div>
			</div>

			<div
				class="col-lg-2 col-md-6 col-sm-4 d-flex align-items-stretch mt-4 mt-lg-0">
				<div class="icon-box">
					<div class="icon">
						<i class='bx bx-walk bx-rotate-180 bx-tada' style='color: #0088ff'></i>
					</div>
					<h4>
						<a href="infoDetail.do?id=2599899">#동성로</a>
					</h4>
					<p></p>
				</div>
			</div>
			<div
				class="col-lg-2 col-md-6 col-sm-4 d-flex align-items-stretch mt-4 mt-lg-0">
				<div class="icon-box">
					<div class="icon">
						<i class='bx bxs-florist bx-tada bx-rotate-270'
							style='color: #ff71c1'></i>
					</div>
					<h4>
						<a href="infoDetail.do?id=2470053">#강정보</a>
					</h4>
					<p></p>
				</div>
			</div>

			<div
				class="col-lg-2 col-md-6 col-sm-4 d-flex align-items-stretch mt-4 mt-lg-0">
				<div class="icon-box">
					<div class="icon">
						<i class='bx bxs-directions bx-tada bx-rotate-270'
							style='color: #b1933c'></i>
					</div>
					<h4>
						<a href="infoDetail.do?id=2377728">#옻골마을</a>
					</h4>
					<p></p>
				</div>
			</div>
			<div
				class="col-lg-2 col-md-6 col-sm-4 d-flex align-items-stretch mt-4 mt-lg-0">
				<div class="icon-box">
					<div class="icon">
						<i class='bx bxs-ship bx-tada' style='color: #03a38d'></i>
					</div>
					<h4>
						<a href="infoDetail.do?id=1115613">#수성못</a>
					</h4>
					<p></p>
				</div>
			</div>
		</div>
	</div>
</section>
<!--  Section -->

<!-- map js -->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function regional_map_on(local) {
		document.getElementById('regional_map').src = 'views/mainmap/img/DAEGU_'
				+ local + '.png'
	}
	function regional_map() {
		document.getElementById("regional_map").src = "views/mainmap/img/DAEGU_Map.png";
	}

	$(document).ready(function() {
		$("#loc_ul").hover(function() {
			$('#regional_map').attr("src", 'views/mainmap/img/DAEGU_Bukgu.png')

		}, function() {
			$('#regional_map').attr("src", 'views/mainmap/img/DAEGU_Map.png')

		});
	});
</script>

<div id="contents">
	<div class="row">
		<div class="col-lg-6 col-md-12">
			<!-- map -->
			<img src="views/mainmap/img/DAEGU_Map.png" width="370" height="426"
				usemap="#Map" border="0" id="regional_map" />
			<map name="Map" id="Map">
				<area shape="poly"
					coords="156,58,154,69,155,77,160,87,163,101,158,112,148,115,141,123,137,133,138,145,148,142,157,145,166,145,169,139,176,142,195,148,204,158,221,155,225,144,237,146,238,138,234,133,235,127,235,116,244,113,234,99,232,91,231,69,223,58,213,50,203,57,188,60,178,67,174,73"
					href="bukgu.cate" alt="북구" id="loc_ul" />
				<area shape="poly"
					coords="113,198,113,179,113,171,128,167,135,171,146,170,155,167,162,167,170,176,180,171,193,172,195,176,189,190,190,207,205,220,206,230,196,233,195,238,197,256,184,256,183,260,175,260,173,250,171,249,163,247,158,237,148,233,145,224,133,219,121,218,114,218,117,210"
					href="dalseogu.cate" alt="달서구"
					onmouseover="regional_map_on('Dalseogu');"
					onmouseout="regional_map();" />
				<area shape="poly"
					coords="37,415,47,417,52,414,55,413,67,408,73,408,82,400,92,395,99,392,107,385,118,391,126,384,136,386,147,382,149,373,146,358,148,350,154,349,159,346,166,340,166,330,169,324,165,316,164,310,168,310,186,292,195,294,203,295,213,298,220,290,225,290,225,300,224,309,230,322,242,322,246,320,250,320,268,309,273,309,279,307,293,297,288,288,291,276,292,262,283,249,282,240,269,231,257,226,248,228,238,224,222,225,210,223,205,222,201,226,191,232,195,250,188,251,183,254,178,260,178,252,175,248,175,243,164,244,154,234,148,229,145,220,128,215,119,215,119,208,115,195,115,176,120,171,125,172,141,172,153,168,152,155,148,155,152,148,146,142,137,142,124,139,116,136,113,127,118,122,119,113,117,109,121,102,112,93,107,94,97,95,90,98,85,105,77,107,71,116,67,121,61,126,60,136,58,142,58,150,51,158,44,169,43,177,48,188,58,189,78,189,100,192,108,197,112,203,111,216,105,221,97,221,91,218,84,219,70,219,66,226,59,236,60,242,57,247,49,260,46,265,45,278,53,287,54,287,59,287,67,294,73,293,78,300,85,303,88,309,86,320,78,327,64,326,52,323,48,321,40,323,29,319,21,322,19,340,27,350,36,360,46,370,60,381,62,392,53,399,41,406,36,411"
					href="dalseonggun.cate" alt="달성군"
					onmouseover="regional_map_on('Dalseonggun');"
					onmouseout="regional_map();" />
				<area shape="poly"
					coords="213,49,231,69,231,87,232,99,236,112,233,118,234,126,231,134,236,142,234,144,225,142,220,154,225,162,234,164,240,165,251,156,259,156,265,162,273,160,280,168,283,176,292,175,298,171,306,169,312,175,320,177,332,176,337,167,341,159,337,152,343,144,341,135,333,130,340,121,333,112,330,118,323,102,327,86,320,78,328,72,324,62,318,50,318,39,282,22,275,23,263,24,257,24,250,32,242,24,232,29,220,37,211,48"
					href="dongu.cate" alt="동구" onmouseover="regional_map_on('Donggu');"
					onmouseout="regional_map();" />
				<area shape="poly"
					coords="194,153,195,167,191,171,202,175,220,177,225,160,222,157,208,157,193,153"
					href="jungu.cate" alt="중구" onmouseover="regional_map_on('Junggu');"
					onmouseout="regional_map();" />
				<area shape="poly"
					coords="194,171,203,174,218,174,221,180,221,207,208,218,205,224,188,207,184,198,185,191,192,183,194,172"
					href="namgu.cate" alt="남구" onmouseover="regional_map_on('Namgu');"
					onmouseout="regional_map();" />
				<area shape="poly"
					coords="147,153,152,146,167,145,172,141,175,140,181,141,193,148,198,164,181,179,166,178,159,168,152,167,145,152"
					href="seogu.cate" alt="서구" onmouseover="regional_map_on('Seogu');"
					onmouseout="regional_map();" />
				<area shape="poly"
					coords="206,220,219,208,220,178,221,172,226,159,240,164,247,154,260,153,266,157,270,158,280,166,281,168,290,174,298,171,303,169,312,173,308,179,315,186,302,202,305,210,306,216,282,237,256,227,252,228,240,223,230,226,220,226"
					href="suseonggu.cate" alt="수성구"
					onmouseover="regional_map_on('Suseonggu');"
					onmouseout="regional_map();" />
			</map>
			<!--// map -->

			<!-- weather widget start -->
			<div id="m-booked-small-t3-68215">
				<div class="booked-weather-160x36 w160x36-18"
					style="color: #333333; border-radius: 4px; -moz-border-radius: 4px; border: none">
					<a target="_blank" style="color: #08488D;"
						href="https://booked.kr/weather/daegu-17943"
						class="booked-weather-160x36-city">대구광역시</a> <a target="_blank"
						class="booked-weather-160x36-right" href="https://www.booked.net/"><img
						src="//s.bookcdn.com/images/letter/s5.gif"
						alt="https://www.booked.net/" /></a>
					<div class="booked-weather-160x36-degree">
						<span class="plus">+</span>12&deg;<span>C</span>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var css_file = document.createElement("link");
				css_file.setAttribute("rel", "stylesheet");
				css_file.setAttribute("type", "text/css");
				css_file.setAttribute("href",
						'https://s.bookcdn.com/css/w/bw-160-36.css?v=0.0.1');
				document.getElementsByTagName("head")[0].appendChild(css_file);
				function setWidgetData(data) {
					if (typeof (data) != 'undefined' && data.results.length > 0) {
						for (var i = 0; i < data.results.length; ++i) {
							var objMainBlock = document
									.getElementById('m-booked-small-t3-68215');
							if (objMainBlock !== null) {
								var copyBlock = document
										.getElementById('m-bookew-weather-copy-'
												+ data.results[i].widget_type);
								objMainBlock.innerHTML = data.results[i].html_code;
								if (copyBlock !== null)
									objMainBlock.appendChild(copyBlock);
							}
						}
					} else {
						alert('data=undefined||data.results is empty');
					}
				}
			</script>
			<script type="text/javascript" charset="UTF-8"
				src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=17943&type=13&scode=2&ltid=3457&domid=593&anc_id=69666&cmetric=1&wlangID=24&color=fff5d9&wwidth=158&header_color=fff5d9&text_color=333333&link_color=08488D&border_form=3&footer_color=fff5d9&footer_text_color=333333&transparent=1"></script>
			<!-- weather widget end -->




			<!-- 카드시작 -->
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="container-fluid">
				<div class="row">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="card-box bg-blue">
								<div class="inner">
									<h3>가족과함께</h3>
									<p>주말은 가족과 함께지!</p>
								</div>
								<div class="icon">
									<i class="bx bxs-heart" aria-hidden="true"></i>
								</div>
								<a href="family.cate" class="card-box-footer">자세히보기 <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="card-box bg-green">
								<div class="inner">
									<h3>나혼자</h3>
									<p>나혼자~이길을걷고~</p>
								</div>
								<div class="icon">
									<i class="bx bx-walk" aria-hidden="true"></i>
								</div>
								<a href="alone.cate" class="card-box-footer">View More <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="card-box bg-orange">
								<div class="inner">
									<h3>역사좀아니?</h3>
									<p>역사속으로</p>
								</div>
								<div class="icon">
									<i class="bx bx-arch" aria-hidden="true"></i>
								</div>
								<a href="history.cate" class="card-box-footer">View More <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="card-box bg-red">
								<div class="inner">
									<h3>대구축제</h3>
									<p>다이나믹한 대구여행!</p>
								</div>
								<div class="icon">
									<i class="bx bxs-like"> </i>
								</div>
								<a href="festival.cate" class="card-box-footer">View More <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 카드끝 -->

<!-- ======= review Section ======= -->
<section id="testimonials" class="testimonials">
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