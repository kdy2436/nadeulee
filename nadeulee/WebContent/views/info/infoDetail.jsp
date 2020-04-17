<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.reviewImg {
	width: 80%;
	height: 200px;
}

.middle {
	
}
</style>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
<main id="main">

	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs ">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center"
				style="margin-top: 10rem;">
				<h2>${vo.title}</h2>
				<ol>
					<li><a href="home.do">홈으로가기</a></li>
					<li><a href="javascript:goBack()">이전으로가기</a></li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs -->

	<!-- ======= Portfolio Details Section ======= -->
	<section id="portfolio-details" class="portfolio-details">
		<div class="container">

			<div class="portfolio-details-container">

				<div class="container">
					<img alt="" src="${vo.image }">
				</div>

				<div class="portfolio-info">
					<h3 align="center">Information</h3>
					<ul>
						<li><strong>주소</strong>:${vo.addr}</li>
						<li><strong>Tel</strong>:${vo.tel}</li>

						<li><strong>운영시간</strong>:${vo.time}</li>
						<li><strong>주차여부</strong>:${vo.parking}</li>
						<li><strong>이용요금</strong>:${vo.pay}</li>
					</ul>
				</div>

			</div>

			<div class="portfolio-description">

				<p class="mt-3">
					${vo.overview}<br>
				</p>
			</div>

		</div>
	</section>
	<!-- End Portfolio Details Section -->

</main>
<!-- End #main -->
<div class="row align-items-center">
	<div class="col-xl-6 col-md-12 middle" align="right">
		<jsp:include page="../map/googleMap.jsp"></jsp:include>
	</div>

	<!-- 날씨 위젯 -->
	<div class="col-xl-6 col-md-12 middle" align="left">
		<!-- weather widget start -->
		<div id="m-booked-weather-bl250-3123">
			<div class="booked-wzs-250-175 weather-customize"
				style="background-color: #2c88eb; width: 430px;" id="width3">
				<div class="booked-wzs-250-175_in">
					<div class="booked-wzs-250-175-data">
						<div class="booked-wzs-250-175-left-img wrz-03">
							<a target="_blank" href="https://www.booked.net/"> <img
								src="//s.bookcdn.com/images/letter/logo.gif" alt="booked.net" />
							</a>
						</div>
						<div class="booked-wzs-250-175-right">
							<div class="booked-wzs-day-deck">
								<div class="booked-wzs-day-val">
									<div class="booked-wzs-day-number">
										<span class="plus">+</span>10
									</div>
									<div class="booked-wzs-day-dergee">
										<div class="booked-wzs-day-dergee-val">&deg;</div>
										<div class="booked-wzs-day-dergee-name">C</div>
									</div>
								</div>
								<div class="booked-wzs-day">
									<div class="booked-wzs-day-d">
										H: <span class="plus">+</span>14&deg;
									</div>
									<div class="booked-wzs-day-n">
										L: <span class="plus">+</span>6&deg;
									</div>
								</div>
							</div>
							<div class="booked-wzs-250-175-info">
								<div class="booked-wzs-250-175-city">대구광역시</div>
								<div class="booked-wzs-250-175-date">금요일, 10 4월</div>
								<div class="booked-wzs-left">
									<span class="booked-wzs-bottom-l">7일 예보 보기</span>
								</div>
							</div>
						</div>
					</div>
					<a target="_blank" href="https://booked.kr/weather/daegu-17943">
						<table cellpadding="0" cellspacing="0"
							class="booked-wzs-table-250">
							<tr>
								<td>목</td>
								<td>토</td>
								<td>일</td>
								<td>월</td>
								<td>화</td>
								<td>수</td>
							</tr>
							<tr>
								<td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td>
								<td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td>
								<td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td>
								<td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td>
								<td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td>
								<td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td>
							</tr>
							<tr>
								<td class="week-day-val"><span class="plus">+</span>10&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>17&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>15&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>15&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>22&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>23&deg;</td>
							</tr>
							<tr>
								<td class="week-day-val"><span class="plus">+</span>8&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>7&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>6&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>5&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>6&deg;</td>
								<td class="week-day-val"><span class="plus">+</span>9&deg;</td>
							</tr>
						</table>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 날씨 위젯 관련 스크립트문 -->
<script type="text/javascript">
	var css_file = document.createElement("link");
	css_file.setAttribute("rel", "stylesheet");
	css_file.setAttribute("type", "text/css");
	css_file.setAttribute("href",
			'https://s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1');
	document.getElementsByTagName("head")[0].appendChild(css_file);
	function setWidgetData(data) {
		if (typeof (data) != 'undefined' && data.results.length > 0) {
			for (var i = 0; i < data.results.length; ++i) {
				var objMainBlock = document
						.getElementById('m-booked-weather-bl250-3123');
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
	src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=17943&type=3&scode=2&ltid=3458&domid=593&anc_id=27391&cmetric=1&wlangID=24&color=2c88eb&wwidth=430&header_color=ffffff&text_color=333333&link_color=08488D&border_form=1&footer_color=ffffff&footer_text_color=333333&transparent=0"></script>
<!-- weather widget end -->


<!-- 날씨 끝 -->
<br>
<br>
<!-- ======= review Section ======= -->
<section id="testimonials" class="testimonials">
	<div class="container">
		<div class="section-title">
			<h2>베스트 후기</h2>
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