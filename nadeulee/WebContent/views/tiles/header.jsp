<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ======= Header ======= -->
<div>
	<header id="header" class="fixed-top d-flex align-items-center">
		<div class="container d-flex align-items-center">

			<div class="logo mr-auto">
				<h1>
					<a href="home.do">나들이 갈까요</a>
				</h1>
			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="drop-down"><a href="noticelist.do">공지사항</a>
						<ul>
							<li><a href="#about">이벤트</a></li>
							<li><a href="noticelist.do">공지사항</a></li>
						</ul></li>
					<li class="drop-down"><a href="infoList.do">여행지</a>
						<ul>
							<li class="drop-down"><a href="">지역</a>
								<ul>
									<li><a href="">전체</a></li>
									<li><a href="">중구</a></li>
									<li><a href="">동구</a></li>
									<li><a href="">서구</a></li>
									<li><a href="">남구</a></li>
									<li><a href="">수성구</a></li>
									<li><a href="">달서구</a></li>
									<li><a href="">달성군</a></li>
								</ul></li>
							<li class="drop-down"><a href="">테마</a>
								<ul>
									<li><a href="">가족과 함께</a></li>
									<li><a href="">야경</a></li>
									<li><a href="">역사속으로</a></li>
									<li><a href="">4</a></li>
									<li><a href="">5</a></li>
								</ul></li>
						</ul></li>
					<li><a href="reviewList.do">여행후기</a></li>
					<li><a href="memberjoin.do">회원가입</a></li>

				</ul>
			</nav>

			<!-- login -->
			<button type="button" class="btn btn-outline-primary"
				onclick="location.href='login.do' ">로그인</button>

		</div>
	</header>
</div>
<!-- End Header -->