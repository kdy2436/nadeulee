<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<div id="base" class="container col-md-8">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title mb-3">${detail.title }</h4>
			<h6 class="card-subtitle text-muted mb-4">
				<i class="far fa-user"></i> ${detail.nickname} · <i
					class="far fa-clock"></i> ${detail.ndate}
			</h6>
			<div style="white-space: pre;">
				<c:out value="${content}" />
				<p class="card-text">${detail.content}
					<br> <img src="/nadeulee/Image/${detail.n_photo}" id="n_photo">
				</p>
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty email}">
				<c:if test="${auth == 'A' }">
					<div class="card-body">
						<a href="noticeupdate.do?n_no=${detail.n_no}"
							class="btn btn-outline-secondary btn-sm" role="button">수정</a> <a
							href="noticedelete.do?n_no=${detail.n_no}"
							class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
					</div>
				</c:if>
			</c:when>
		</c:choose>
		<div class="card-body">
			<button type="button" class="btn btn-info"
				onclick="location.href='noticelist.do'">목록으로</button>
		</div>
	</div>
</div>

<br>
<br>