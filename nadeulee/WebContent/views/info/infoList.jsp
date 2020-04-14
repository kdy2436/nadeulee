<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<style>
#portfolio {
	margin-top: 3rem
}

#paging {
	position: relative;
	left: 25%;
}
</style>
<!-- ======= infoList Section ======= -->
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
						data-target="#area">지역</li>
					<li data-filter="*" class="filter-active" data-target="#thema"
						data-toggle="collapse">테마</li>
					<div id="area" class="collapse">
						<li><a href="allList.cate">전체</a></li>
						<li><a href="jungu.cate">중구</a></li>
						<li><a href="suseonggu.cate">수성구</a></li>
						<li><a href="seogu.cate">서구</a></li>
						<li><a href="namgu.cate">남구</a></li>
						<li><a href="bukgu.cate">북구</a></li>
						<li><a href="dalseogu.cate">달서구</a></li>
						<li><a href="dalseonggun.cate">달성군</a></li>
					</div>

					<div id="thema" class="collapse">
						<li><a href="alone.cate">나홀로</a></li>
						<li><a href="family.cate">가족끼리</a></li>
						<li><a href="healing.cate">힐링</a></li>
						<li><a href="festival.cate">축제</a></li>
						<li><a href="history.cate">역사</a></li>
					</div>
				</ul>
			</div>
		</div>


		<div class="row portfolio-container">
			<!-- 리스트 폼 시작 -->
			<c:forEach items="${list}" var="infoList">
				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<c:if test="${empty infoList.image}">
								<a href="infoDetail.do?id=${infoList.content_id}">노이미지</a>
							</c:if>
							<c:if test="${!empty infoList.image}">
								<a href="infoDetail.do?id=${infoList.content_id}"><img
									src="${infoList.image}" class="img-fluid" alt=""></a>
							</c:if>

						</figure>

						<div class="portfolio-info">
							<h4>
								<a class="h5" href="infoDetail.do?id=${infoList.content_id}">${infoList.title}</a>
							</h4>
						</div>
					</div>
				</div>
				<!-- 리스트 폼 끝 -->
			</c:forEach>
		</div>


		<my:paging paging="${requestScope.page}" jsfunc="gopage" />
	</div>

</section>

<script>
	function gopage(p) {
		location.href = window.location.pathname + "?page=" + p;
	}
</script>

<!-- End infoList Section -->