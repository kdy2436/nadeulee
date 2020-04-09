<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="contact" class="contact section-bg">
	<div class="container">

		<div class="section-title">
			<h2>회원가입</h2>
			<p>환영합니다</p>
		</div>
		<div class="col-lg-10" id="centerDiv">
			<form id="frm" name="frm" action="" method="post" role="form"
				class="php-email-form">
				<div class="form-row">
					<div class="col-md-6 form-group">
						<input type="text" name="name" class="form-control" id="name"
							placeholder="Your NickName" data-rule="minlen:4"
							data-msg="Please enter at least 4 chars" />
						<div class="validate"></div>
					</div>
					<div class="col-md-6 form-group">
						<input type="email" class="form-control" name="email" id="email"
							placeholder="Your Email" data-rule="email"
							data-msg="Please enter a valid email" />
						<div class="validate"></div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="subject" id="subject"
						placeholder="Subject" data-rule="minlen:4"
						data-msg="Please enter at least 8 chars of subject" />
					<div class="validate"></div>
				</div>
				<div class="form-group">
					<textarea class="form-control" name="message" rows="5"
						data-rule="required" data-msg="Please write something for us"
						placeholder="Message"></textarea>
				</div>
				<!--  첨부파일 시작 -->
				<div class="form-group">
					<input type="file" class="form-control" name="addFile" id="addFile"
						placeholder="파일첨부" data-rule="minlen:4"
						data-msg="Please enter at least 8 chars of subject" />
					<div class="validate"></div>
				</div>
				<!--  첨부파일 끝 -->
				<div class="mb-3"></div>
				<div class="text-right">
					<button type="submit">Send Message</button>
				</div>
			</form>
		</div>
	</div>
</section>