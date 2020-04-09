<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
   #btnSave, #btnCancel, #btnHome {
  	width : 80px;
  	height: 40px;
  }
  </style>
  <script type="text/javascript">
  //이메일 등록가능 DB 확인
  /* function dupCheck() {
		  var xhttp = new XMLHttpRequest();
		
		  xhttp.onreadystatechange = function() {			
		    if (this.readyState == 4) {		
		    	if(this.status == 200) {		
		     document.getElementById("result").innerHTML = this.responseText; 
		    	} else {
		    		document.getElementById("result").innerHTML = this.statusText;
		    	}
		    }	 
		  };	
		  
		  ////////url 수정
		  var param ="id=" + frm.id.value;		
		  xhttp.open("post", "URL?", true);		
		  
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send(param);	
		} */
		function searchEmp() {
			$.ajax({
				type: "post",
				url: "../server/findName.jsp",
				data: { id : $("#empNo").val() },
				success: function(datas) {
					 if($.trim(data) == 0) {
						$("#result").html("<p style='color:blue'>사용 가능</p>");
					} else {
						$("#result").html("<p style='color:red'>사용 불가능</p>");
					}
//					$("#result").html(datas);
					$("#result").html(data.first_name + " : " + data.last_name);
				}
			});
		};
  </script>
  
</head>
<body>

  
  <section id="contact" class="contact section-bg">
      <div class="container">
        	
        <div class="section-title">
          <h2>회원가입</h2>
          <p>환영합니다</p>
        </div>
          <div class="col-lg-10" id="centerDiv">
          <!-- 폼양식 액션추가 -->
            <form id="frm" name="frm" action="" method="post" role="form" class="php-email-form" >
            	 <!--  이메일e mail 시작 -->
              <div class="form-group">
                        <label for="name">이메일<font color="red"> &nbsp;*</font></label>
                        <input type=email class="form-control" id="email" name="email" placeholder="이메일을 입력해 주세요" onchange="dupCheck()" required>
                        <span id="result"></span>
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호<font color="red"> &nbsp;*</font></label>
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>
                    </div>
                    <div class="form-group">
                        <label for="pwc">비밀번호 확인<font color="red"> &nbsp;*</font></label>
                        <input type="password" class="form-control" id="pwc" name="pwc" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required>
                    </div>
                    <!--  성별gender  시작 -->
                    <div class="form-group">
                        <label for="gender">성별<font color="red"> &nbsp;*</font></label><br/>
	                        <label><input type="radio" id="male" name="gender" value="남자" >남자</label>&nbsp;
							<label><input type="radio" id="female" name="gender" value="여자" checked>여자</label>
                    </div>
                    <!--  성별 끝 -->
                    <!--  프로필 사진 -->
              		<div class="form-group">
                        <label for="profile">프로필</label>
                        <input type="file" class="form-control" id="profile" name="profile" >
                    </div>
                    <!--  프로필 사진 끝-->
                    <!--  버튼메뉴 -->
					<div class="text-center">
		              	<button type="submit" id="btnSave" class="btn btn-danger">가입</button>
		              	<button type="reset" id="btnCancel" class="btn btn-danger" onclick="location.href=' # ' ">초기화</button>
		              	<button type="button" id="btnHome" class="btn btn-success" onClick="location.href=' # ' ">홈</button>
          		    </div>
					<!--  버튼메뉴 끝 -->
            </form>
          </div>

        </div>
       
       
  </section>


</body>
</html>