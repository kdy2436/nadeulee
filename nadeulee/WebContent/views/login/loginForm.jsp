<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>
   #btnLogin, #btnJoin, #btnHome {
  	width : 90px;
  	height: 40px;
  }
  </style>
</head>
<body>
<div>
	<div><br /></div>
	<section id="contact" class="contact section-bg">
		<div class="container">
        <div class="section-title">
          <h2>로그인</h2>
        </div>
			<form id="frm" name="frm" action="" method="post">
				<div class="form-group">
					<label for="id">ID:</label> <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id" required>
				</div>
				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" required>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" name="remember">
						Remember me
					</label>
				</div >
				<div align="center">
				<button type="submit" class="btn btn-outline-primary" id="btnLogin">로그인</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-danger" id="btnJoin" onclick="location.href='memberJoin.do'">회원가입</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-success" id="btnHome" onclick="location.href='home.do'">홈</button>
				</div>
			</form>
		</div>
		</section>
		<div><br /></div>
</div>
</body>
</html>