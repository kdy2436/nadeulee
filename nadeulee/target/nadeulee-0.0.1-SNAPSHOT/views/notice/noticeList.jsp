<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<style>
#portfolio {
	margin-top: 3rem
}

#paging {
	position: relative;
}

#paging .pagination {
	position: absolute;
	transform: translateX(-50%);
	left: 50%;
}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="section-title">
	<h2>공지사항</h2>
</div>
<div align="center">
	<div class="container">
		<form id="frm" name="frm" action="#" method="post">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="50">글번호</th>
						<th width="200">제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty noticeList}">
							<tr>
								<td colspan="4" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="notice" items="${noticeList}">
								<tr
									onclick="location.href='noticedetail.do?n_no=${notice.n_no}'"
									style="cursor: pointer">
									<td>${notice.n_no}</td>
									<td>${notice.title}</td>
									<td>${notice.nickname}</td>
									<td>${notice.ndate}</td>

								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</form>
		<br>
		<c:choose>
			<c:when test="${not empty email}">
				<c:if test="${auth == 'A' }">
					<button type="button" id="buttonbtn"
						class="btn btn-outline-primary"
						onclick="location.href='noticewrite.do'">글등록</button>
				</c:if>
			</c:when>
		</c:choose>
	</div>
	<my:paging paging="${requestScope.page}" jsfunc="gopage" />
</div>
<script>
	function gopage(p) {
		location.href = window.location.pathname + "?page=" + p;
	}
</script>