<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>후기 작성</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../../assets/img/favicon.png" rel="icon">
<link href="../../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../../assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="../../assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="../../assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="../../assets/vendor/owl.carousel/../../assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../../assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Lumia - v2.0.0
  * Template URL: https://bootstrapmade.com/lumia-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  <style>
  #centerDiv {
  	margin: 0 auto;
  }
  #btnSave, #btnCancel {
  	width : 80px;
  	height: 40px;
  }
 div>h2{
  	padding-bottom:10px;
  	margin-top:10px;
  	font-weight:normal;
  	
  }
  </style>
</head>
<body>
  
  <section id="contact" class="contact section-bg">
      <div class="container">
        	
        <div class="text-center" style="border-bottom:1px #6495ED;">
          <h2>공지사항</h2>
        </div>
        <!-- 폼양식 바로 바깥 큰 박스시작 -->
          <div class="col-lg-10" id="centerDiv">
          <!--  폼양식 액션 추가 -->
            <form id="frm" name="frm" action="" method="post" role="form" class="php-email-form">
              <div class="form-row">
              </div>	
              <!--  제목 시작 -->
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4"  required/>
                <div class="validate"></div>
              </div>
              <!--  제목 끝 -->
              <!--  컨텐츠 시작 -->
              <div class="form-group">
                <textarea class="form-control" id="contents" name="contents" rows="25" data-rule="required"  placeholder="contents" required></textarea>
              </div>
              <!--  컨텐츠 끝 -->
            
              <!--   버튼 button submit  -->
              <div class="text-center">
              	<button type="submit" id="btnSave" class="btn btn-danger">저장</button>
              	<button type="button" id="btnCancel" class="btn btn-dark" onclick="location.href=' # ' ">취소</button>
              </div>
            </form>
          </div>  <!--  폼 바깥 박스 -->
        </div>	<!--  전체 컨테이너 -->
  </section>

</body>
</html>