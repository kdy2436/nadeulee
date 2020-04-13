<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.reviewImg{
		width:80%;
		height:200px;
	}
</style>

<main id="main">

	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs ">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center" style="margin-top:10rem;">
				<h2>${vo.title}</h2>
				<ol>
					<li><a href="home.do">Home</a></li>
					<li>Information Details</li>
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



<!-- 날씨 위젯 -->


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
				<table cellpadding="0" cellspacing="0" class="booked-wzs-table-250">
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

<!-- ======= Footer ======= -->
<footer id="footer">

	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-6 ">
					<img class="reviewImg" src="/nadeulee/assets/img/test/여행1.jpg"
						alt="여행리뷰 사진">
					<div class="text">후기가 들어갈 자리</div>
				</div>
				<div class="col-lg-3 col-md-6 ">
					<img class="reviewImg" src="/nadeulee/assets/img/test/여행2.jpg"
						alt="여행리뷰 사진">
					<div class="text">후기가 들어갈 자리</div>
				</div>
				<div class="col-lg-3 col-md-6 ">
					<img class="reviewImg" src="/nadeulee/assets/img/test/여행3.jpg"
						alt="여행리뷰 사진">
					<div class="text">후기가 들어갈 자리</div>
				</div>
				<div class="col-lg-3 col-md-6 ">
					<img class="reviewImg" src="/nadeulee/assets/img/test/여행4.jpg"
						alt="여행리뷰 사진">
					<div class="text">후기가 들어갈 자리</div>
				</div>

			</div>
		</div>
	</div>

	<div class="container d-md-flex py-4">

		<div class="mr-md-auto text-center text-md-left">
			<div class="copyright">
				&copy; Copyright <strong><span>Lumia</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/lumia-bootstrap-business-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
		<div class="social-links text-center text-md-right pt-3 pt-md-0">
			<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
				href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
				href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
				href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
				href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
		</div>
	</div>
</footer>
<!-- End Footer -->

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

</body>

</html>