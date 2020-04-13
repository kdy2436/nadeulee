<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container col-md-6">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title mb-3">${detail.title }</h4>
			<h6 class="card-subtitle text-muted mb-4">
				<i class="far fa-user"></i> ${detail.nickname} · <i
					class="far fa-clock"></i> ${detail.ndate}
			</h6>
			<p class="card-text">${detail.content}</p>
		</div>
		<div class="card-body">
			<a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
			<a href="#" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
		</div>
		<div class="card-body">
			<button type="button" class="btn btn-info"
				onclick="location.href='noticelist.do'">목록으로</button>
		</div>
	</div>
</div>
