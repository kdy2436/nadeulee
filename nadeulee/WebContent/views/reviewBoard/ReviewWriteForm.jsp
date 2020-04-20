<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#centerDiv {
	margin: 0 auto;
}

#btnSave, #btnCancel {
	width: 80px;
	height: 40px;
}
</style>

<section id="contact" class="contact">
	<div class="container">

		<div class="section-title">
			<h2>후기작성</h2>
			<p>여러분의 소중한 추억을 공유해 주세요</p>
		</div>
		<!-- 폼양식 바로 바깥 큰 박스시작 -->
		<div class="col-lg-10" id="centerDiv">
			<!--  폼양식 액션 추가 -->
			<form id="frm" name="frm" action="" method="post" role="form"
				class="php-email-form">
				<div class="form-row">
					<!--  닉네임 시작 -->
					<div class="col-md-6 form-group">
						<input type="text" name="name" class="form-control" id="name"
							placeholder="Your NickName" data-rule="minlen:4" required />
						<div class="validate"></div>
					</div>
					<!--  닉네임 끝 -->
					<!--  이메일 시작 -->
					<div class="col-md-6 form-group">
						<input type="email" class="form-control" name="email" id="email"
							placeholder="Your Email" data-rule="email" required />
						<div class="validate"></div>
					</div>
					<!--  이메일 끝 -->
				</div>
				<!--  가로 두칸 끝 -->
				<!--  제목 시작 -->
				<div class="form-group">
					<input type="text" class="form-control" name="subject" id="subject"
						placeholder="Subject" data-rule="minlen:4" required />
					<div class="validate"></div>
				</div>
				<!--  제목 끝 -->
				<!--  컨텐츠 시작 -->
				<div class="form-group">
					<textarea class="form-control" id="contents" name="contents"
						rows="10" data-rule="required" placeholder="contents" required></textarea>
				</div>
				<!--  컨텐츠 끝 -->
				<!--  첨부파일 시작 -->
				<div class="form-group">
					<input type="file" class="form-control" name="addFile" id="addFile"
						placeholder="파일첨부" data-rule="minlen:4" />
					<div class="validate"></div>
				</div>
				<!--  첨부파일 끝 -->
				<!--   버튼 button submit  -->
				<div class="text-center">
					<button type="submit" id="btnSave" class="btn btn-danger">저장</button>
					<button type="button" id="btnCancel" class="btn btn-dark"
						onclick="location.href=' # ' ">취소</button>
				</div>
			</form>
		</div>
		<!--  폼 바깥 박스 -->
	</div>
	<!--  전체 컨테이너 -->
</section>
