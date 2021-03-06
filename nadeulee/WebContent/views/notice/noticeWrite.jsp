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

div>h2 {
	padding-bottom: 10px;
	margin-top: 10px;
	font-weight: normal;
}
</style>

<br>
<br>
<br>
<br>
<section id="contact" class="contact">
	<div class="container">
		<div class="section-title">
			<h2>공지사항 등록</h2>
		</div>
		<!-- 폼양식 바로 바깥 큰 박스시작 -->
		<div class="col-lg-10" id="centerDiv">
			<!--  폼양식 액션 추가 -->
			<form id="frm" name="frm" action="noticeinsert.do" method="post"
				enctype="multipart/form-data">
				<div class="form-row"></div>
				<!--  제목 시작 -->
				<div class="form-group">
					<input type="text" class="form-control" name="title" id="title"
						placeholder="Title" data-rule="minlen:4" required />
					<div class="validate"></div>
				</div>
				<!--  제목 끝 -->
				<!--  컨텐츠 시작 -->
				<div class="form-group">
					<textarea class="form-control" id="content" name="content"
						rows="25" data-rule="required" placeholder="Contents" required></textarea>
				</div>
				<!--  컨텐츠 끝 -->
				<!--  파일 -->
				<div class="form-group">
					<input type="file" class="form-control" id="n_photo" name="n_photo">
				</div>
				<!--  파일 끝 -->


				<!--   버튼 button submit  -->
				<div class="text-center">
					<button type="submit" id="btnSave" class="btn btn-danger">저장</button>
					<button type="button" id="btnCancel" class="btn btn-dark"
						onclick="location.href='noticelist.do'">취소</button>
				</div>
			</form>
		</div>
		<!--  폼 바깥 박스 -->
	</div>
	<!--  전체 컨테이너 -->
</section>
