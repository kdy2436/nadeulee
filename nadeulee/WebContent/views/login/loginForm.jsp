<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#btnLogin, #btnJoin, #btnHome {
	width: 90px;
	height: 40px;
}
</style>
<c:if test="${sessionID != null }">
	<script>
		alert("이미 로그인 중입니다.");
		location.href = "home.do";
	</script>
</c:if>
<c:if test="${ loginResult == -1 || loginResult == 0 }">
	<script>
		alert("아이디 혹은 비밀번호가 틀렸습니다.");
	</script>
</c:if>
<div>
	<div>
		<br /> <br /> <br /> <br /> <br />
	</div>
	<section id="contact">
		<div class="container">
			<div class="section-title">
				<h2>로그인</h2>
			</div>
			<form id="frm" name="frm" action="logincheck.do" method="post"
				class="loginform">
				<div class="form-group">
					<label for="email">ID:</label> <input type="text"
						class="form-control" id="email" placeholder="Enter ID"
						name="email" required>
				</div>
				<div class="form-group">
					<label for="pw">Password:</label> <input type="password"
						class="form-control" id="pw" placeholder="Enter password"
						name="pw" required>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" name="remember">
						Remember me
					</label>
				</div>
				<div align="center">
					<button type="submit" class="btn btn-outline-primary" id="btnLogin">로그인</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-danger" id="btnJoin"
						onclick="location.href='memberjoin.do'">회원가입</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-success" id="btnHome"
						onclick="location.href='home.do'">홈</button>
				</div>
			</form>
		</div>
	</section>
	<div>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br />
	</div>
</div>