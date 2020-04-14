<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
	#centerDiv {
		/* margin : 0 auto; */
	}
	#btnJoin, #btnCancel, #btnHome, #btnDelete {
		width: 90px;
		height: 40px;
	}

</style>
	
<div>
	<br />
</div>
<section id="contact" class="contact section-bg">
	<div class="container">

		<div class="section-title">
			<h2>내 정보</h2>
		</div>
		<div class="row align-items-center" >
		<div class="col-xl-4 col-md-12 col-sm-12" align="center">
			<h2>프로필 사진</h2><br>
			*프로필 사진 뷰
		</div>
		<div class="col-xl-6 col-md-12 col-sm-12" id="centerDiv" >
			<!-- 폼양식 액션추가 -->
			<form id="frm" name="frm" action="memberInsert.do" method="post"
				role="form" class="php-email-form" >
				<!--  이메일e mail 시작 -->
				<div class="form-group">
					<label for="name">이메일<font color="red"> </font></label> <input
						type=email class="form-control" id="email" name="email"  value="" readonly>
					<div id="check"></div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호<font color="red"> </font></label> <input
						type="password" class="form-control" id="pw" name="pw"
						placeholder="변경을 원할 시 비밀번호를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="pwc">비밀번호 확인<font color="red"> </font></label> <input
						type="password" class="form-control" id="pwc" name="pwc"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" >
				</div>
				<div class="form-group">
					<label for="nickName">닉네임<font color="red"> </font></label>
					<input type="text" class="form-control" id="nickName"
						name="nickName" placeholder="변경을 원할 시 닉네임을 입력해주세요" >
					<div id="nickCheck"></div>
				</div>
				<!--  성별gender  시작 -->
				<div class="form-group">
					<label for="gender">성별<font color="red"></font></label><br />
					<label><input type="radio" id="male" name="gender" value="남자" onclick="return(false);">남자</label>&nbsp; 
					<label><input type="radio" id="female" name="gender" value="여자" checked onclick="return(false);">여자</label>
				</div>
				<!--  성별 끝 -->
				<!--  프로필 사진 -->
				<div class="form-group">
					<label for="profile">프로필</label> <input type="file"
						class="form-control" id="profile" name="profile">
				</div>
				<!--  프로필 사진 끝-->
				<!--  버튼메뉴 -->
				<div class="text-center">
					<button type="submit" id="btnJoin" class="btn btn-outline-danger"
						onclick=" # ">수정하기</button>&nbsp;&nbsp;
					<button type="reset" id="btnCancel" class="btn btn-outline-info"
						onclick="location.href=' # ' ">다시작성</button>&nbsp;&nbsp;
					<button type="button" id="btnDelete" class="btn btn-outline-dark"
						onclick="location.href=' # ' ">회원탈퇴</button>&nbsp;&nbsp;
					<button type="button" id="btnHome" class="btn btn-outline-success"
						onClick="location.href='home.do' ">홈</button>
				</div>
				<!--  버튼메뉴 끝 -->
			</form>
		</div>
      </div>
      <!--  입력양식 끝 -->
	  <!--  활동이력 리스트 섹션 -->
	  <div><br/></div>
	  <div><br/></div>
	  <div class="row align-items-center" >
	  		<div class="col-xl-4 col-md-12 col-sm-12" align="center">
	  			<h2>내가 작성한 글</h2>
	  		</div>
	  		<!--  작성글 불러오는 섹션 -->
	  		<div class="php-email-form">
	  		
	  				*작성한 글 불러오기
	  		
	  		</div>
	  		<!--  작성글 불러오기 끝 -->
	  </div>
	  
	</div>

</section>

<script>
	//비밀번호 중복확인을 위한 함수
	document.getElementById('pwc').addEventListener('change',(event)=>{

        //비밀번호 값을 가져온다
        var pw = document.frm.pwc.value;
        var pwc = document.frm.pw.value;

        //유효성 체크
        if(pw != pwc){
            alert('비밀번호가 틀립니다. \n비밀번호를 다시 확인해주세요.')
            event.target.focus();
        }

    })

    //닉네임 중복체크
    document.getElementById('nickName').addEventListener('change',()=>{
        //XMLHttpRequest객체를 가져온다.
        var xhp = new XMLHttpRequest();

        var nickName = document.frm.nickName.value;

        xhp.open('post','nameCheck.do',true);
        //데이터를 id=id형식으로 넘겨줌.
        xhp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        xhp.onreadystatechange = function(){
        	
        	if(xhp.readyState == 4 && xhp.status == 200){
  			  var result = JSON.parse(xhp.responseText);
  			  
  			  document.getElementById('nickCheck').innerHTML=result.msg;
  			  
  			  //아이디가 중복되면 버튼을 disabled한다.
  			  if(result.able =='disabled'){
  				  document.getElementById('btnJoin').disabled=false;
  			  }
  		  }
        };
        
        xhp.send("name="+nickName);
    })
    
    //아이디 중복체크
    /* document.getElementById('email').addEventListener('change',()=>{
        //XMLHttpRequest객체를 가져온다.
        var xhp = new XMLHttpRequest();

        var email = document.frm.email.value;

        xhp.open('post','idCheck.do',true);
        //데이터를 id=id형식으로 넘겨줌.
        xhp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        xhp.onreadystatechange = function(){
        	
        	if(xhp.readyState == 4 && xhp.status == 200){
  			  var result = JSON.parse(xhp.responseText);
  			  
  			  document.getElementById('check').innerHTML=result.msg;
  			  
  			  //아이디가 중복되면 버튼을 disabled한다.
  			  if(result.able =='disabled'){
  				  document.getElementById('btnJoin').disabled=false;
  			  }
  		  }
        };
        
        xhp.send("email="+email);
    }) */
	
</script>

</body>
</html>