<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ======= Portfolio Section ======= -->
<div>
	<br> <br> <br>
	<section id="portfolio" class="portfolio">
		<div class="container">
			<div class="section-title">
				<h2>대구관광지</h2>
				<p>대구는 좋습니다 좋아요 덥고 아주 좋아</p>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<ul id="portfolio-flters">
						<li data-filter="*" class="filter-active" data-toggle="collapse"
							data-target="#demo">지역</li>
						<li data-filter=".filter-app" data-target="#de"
							data-toggle="collapse">테마</li>
						<div id="demo" class="collapse">
							<li class="filter-active">전체</li>
							<li data-filter=".filter-card">중구</li>
							<li data-filter=".filter-card">동구</li>
							<li data-filter=".filter-card">서구</li>
						</div>

						<div id="de" class="collapse">
							<li data-filter=".filter-card">가족과함께</li>
							<li data-filter=".filter-card">야경</li>
							<li data-filter=".filter-card">역사속으로</li>
							<li data-filter=".filter-card">인생샷</li>
						</div>
					</ul>
				</div>
			</div> 
			${infoList[1]}
			<div class="row portfolio-container">
				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<img src="${infoList[1].image}" class="img-fluid" alt="">
							<a href="${infoList[1].image}" data-gall="portfolioGallery"
								class="link-preview venobox" title="Preview"><i
								class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">${tour[1].title}</a>
							</h4>
							<p>App = ${tour[1].title}</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-2.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-2.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">Web 3</a>
							</h4>
							<p>Web</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp"
					data-wow-delay="0.2s">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-3.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-3.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">App 2</a>
							</h4>
							<p>App</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-4.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-4.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">Card 2</a>
							</h4>
							<p>Card</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-5.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-5.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">Web 2</a>
							</h4>
							<p>Web</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp"
					data-wow-delay="0.2s">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-6.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-6.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">App 3</a>
							</h4>
							<p>App</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-7.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-7.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">Card 1</a>
							</h4>
							<p>Card</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-wrap">
						<figure>
							<img src="../../assets/img/portfolio/portfolio-8.jpg"
								class="img-fluid" alt="">
							<a href="../../assets/img/portfolio/portfolio-8.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">Card 3</a>
							</h4>
							<p>Card</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp"
					data-wow-delay="0.2s">
					<div class="portfolio-wrap">
						<figure>
							<img src="../assets/img/portfolio/portfolio-9.jpg"
								class="img-fluid" alt="">
							<a href="../assets/img/portfolio/portfolio-9.jpg"
								class="link-preview venobox" data-gall="portfolioGallery"
								title="Preview"><i class="bx bx-plus"></i></a>
							<a href="portfolio-details.html" class="link-details"
								title="More Details"><i class="bx bx-link"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="portfolio-details.html">Web 1</a>
							</h4>
							<p>Web</p>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
</div>
<table>
	<c:choose>
		<c:when test="${empty infoList}">
							데이터가 없습니다.
												</c:when>
		<c:otherwise>
			<c:forEach var="tour" items="${infoList}">
				<tr>
					<td><img src="${tour.image}"></td>
					<td>${tour.title}</td>
					<td>${tour.overview}</td>
				</tr>


			</c:forEach>


		</c:otherwise>
	</c:choose>
</table>

<!-- End Portfolio Section -->