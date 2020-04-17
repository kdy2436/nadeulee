<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ======= Header ======= -->
<div>
	<header id="header" class="fixed-top d-flex align-items-center">
		<div class="container d-flex align-items-center">
			<div class="logo mr-auto">
				<h1>
					<a href="home.do">Let's Pic <font size="4">in daegu</font></a>
				</h1>
			</div>


			<nav class="nav-menu d-none d-lg-block">

				<ul>
					<li><a href="noticelist.do">공지사항</a></li>
					<li class="drop-down"><a href="allList.cate">여행지</a>
						<ul>
							<li class="drop-down"><a href="">지역</a>
								<ul>
									<li><a href="allList.cate">전체</a></li>
									<li><a href="jungu.cate">중구</a></li>
									<li><a href="suseonggu.cate">수성구</a></li>
									<li><a href="seogu.cate">서구</a></li>
									<li><a href="namgu.cate">남구</a></li>
									<li><a href="dongu.cate">동구</a></li>
									<li><a href="bukgu.cate">북구</a></li>
									<li><a href="dalseogu.cate">달서구</a></li>
									<li><a href="dalseonggun.cate">달성군</a></li>
								</ul></li>
							<li class="drop-down"><a href="">테마</a>
								<ul>
									<li><a href="alone.cate">나홀로</a></li>
									<li><a href="family.cate">가족끼리</a></li>
									<li><a href="healing.cate">힐링</a></li>
									<li><a href="festival.cate">축제</a></li>
									<li><a href="history.cate">역사</a></li>
								</ul></li>
						</ul></li>
					<li><a href="reviewList.do">여행후기</a></li>


					<c:choose>
						<c:when test="${not empty auth}">
							<li class="drop-down"><a href="#">${nickname}님<font
									color=red>♥</font></a>
								<ul>
									<li><a href="memberInfoView.do">마이페이지</a></li>
								</ul></li>

							<button type="button" id="buttonbtn"
								class="btn btn-outline-primary"
								onclick="location.href='logout.do'">로그아웃</button>
						</c:when>


						<c:otherwise>
							<!-- login -->
							<li><a href="memberjoin.do">회원가입</a></li>
							<button type="button" id="buttonbtn"
								class="btn btn-outline-primary"
								onclick="location.href='login.do'">로그인</button>

						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
</div>
<!-- End Header -->