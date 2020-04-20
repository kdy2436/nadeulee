<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- fontawesome 댓글,좋아요 모양 구현-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
<style>
#centerDiv {
	/* margin : 0 auto; */
	
}

#btnSave, #btnCancel, #btnHome, #btnDelete {
	width: 90px;
	height: 40px;
}

#btnUpload {
	width: 140px;
	height: 40px;
}

#viewProfile {
	width: 230px;
	height: 270px;
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
		<div class="row align-items-center">
			<div class="col-xl-4 col-md-12 col-sm-12" align="center">
				<form id="frmProfile" name="frmProfile"
					action="memberProfileUpdate.do" method="post"
					enctype="multipart/form-data">
					<h2>프로필 사진</h2>
					<br> <img src="uploadProfile/${view.profile }"
						id="viewProfile">
					<div></div>
					<div class="form-group">
						<label for="profile"></label> <input type="file"
							class="form-control" id="profile" name="profile">
					</div>
					<button type="submit" id="btnUpload"
						class="btn btn-outline-secondary">사진등록/초기화</button>
				</form>
			</div>
			<div class="col-xl-6 col-md-12 col-sm-12" id="centerDiv">
				<!-- 폼양식 액션추가 -->
				<form id="frm" name="frm" action="memberInfoUpdate.do" method="post">
					<!--  이메일e mail 시작 -->
					<div class="form-group">
						<label for="name">이메일<font color="red"> &nbsp;*변경불가
						</font></label> <input type=email class="form-control" id="email" name="email"
							value="${view.email }" readonly>
						<div id="check"></div>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호<font color="red"> </font></label> <input
							type="password" class="form-control" id="pw" name="pw"
							placeholder="변경 할 비밀번호를 입력 해 주세요">
					</div>
					<div class="form-group">
						<label for="pwc">비밀번호 확인<font color="red"> </font></label> <input
							type="password" class="form-control" id="pwc" name="pwc"
							placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
					</div>
					<div class="form-group">
						<label for="nickName">닉네임<font color="red"> </font></label> <input
							type="text" class="form-control" id="nickName" name="nickName"
							value="${view.nickname }" placeholder="">
						<div id="nickCheck"></div>
					</div>
					<!--  성별gender  시작 -->
					<div class="form-group">
						<label for="gender">성별<font color="red">
								&nbsp;*변경불가</font></label><br />

						<c:choose>
							<c:when test="${view.gender == '여자'}">
								<label><input type="radio" id="male" name="gender"
									value="남자" onclick="return(false);">남자</label>&nbsp; 
                        <label><input type="radio" id="female"
									name="gender" value="여자" checked onclick="return(false);">여자</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" id="male" name="gender"
									value="남자" checked onclick="return(false);">남자</label>&nbsp; 
                        <label><input type="radio" id="female"
									name="gender" value="여자" onclick="return(false);">여자</label>
							</c:otherwise>
						</c:choose>

					</div>
					<!--  성별 끝 -->
					<!--  프로필 사진 -->

					<!-- <div class="form-group">
                  <label for="profile">프로필</label> <input type="file"
                     class="form-control" id="profile" name="profile">
               </div> -->

					<!--  프로필 사진 끝-->
					<!--  버튼메뉴 -->
					<div class="text-center">
						<button type="submit" id="btnSave" class="btn btn-outline-danger">
							수정하기</button>
						&nbsp;&nbsp;
						<button type="reset" id="btnCancel" class="btn btn-outline-info"
							onclick="location.href=' # ' ">다시작성</button>
						&nbsp;&nbsp;
						<button type="button" id="btnDelete" class="btn btn-outline-dark"
							onclick="checkDelete()">회원탈퇴</button>
						&nbsp;&nbsp;
						<button type="button" id="btnHome" class="btn btn-outline-success"
							onClick="location.href='home.do' ">홈</button>
					</div>
					<!--  버튼메뉴 끝 -->
				</form>
			</div>
		</div>
		<!--  입력양식 끝 -->
		<!--  활동이력 리스트 섹션 -->
		<div>
			<br />
		</div>
		<div>
			<br />
		</div>
		<!--   <div class="row align-items-center" >
           <div class="col-xl-4 col-md-12 col-sm-12" align="center">
              <h2>내가 작성한 글</h2>
           </div> -->
		<!--  작성글 불러오는 섹션 -->
		<!-- *작성한 글 불러오기 -->
		<div class="section-title">
			<h2>작성한 글</h2>
		</div>
		<div class="container">
			<!-- <form id="kjh" name="kjh" action="reviewDelete.do" method="post"> -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="30">작성일</th>
						<th width="50">닉네임</th>
						<th width="300">내용</th>
						<th width="30">좋아요</th>
						<th width="50"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boards}">
							<tr>
								<td colspan="4" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boards}">



								<tr>
									<td>${board.rdate}</td>
									<td>${board.nickname}</td>
									<td>${board.rcontent}</td>
									<td>${board.likes}</td>
									<td><a href="reviewDelete.do?r_no=${board.rno }"><i
											class="far fa-trash-alt"></i> 삭제</a></td>
								</tr>


							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<br>

		</div>


		<!--  작성글 불러오기 끝 -->

		<div>
			<br />
		</div>
		<div>
			<br />
		</div>
		<!-- *작성한 댓글 불러오기 -->
		<div class="section-title">
			<h2>작성한 댓글</h2>
		</div>
		<div class="container">
			<!-- <form id="kjh" name="kjh" action="reviewDelete.do" method="post"> -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="50">후기글번호</th>
						<th width="30">작성일</th>
						<th width="300">내용</th>
						<th width="50"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boards}">
							<tr>
								<td colspan="4" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="comment" items="${comments}">



								<tr>
									<td>${comment.rno}</td>
									<td>${comment.cdate}</td>
									<td>${comment.ccontent}</td>
									<td><a href="commentDelete.do?c_no=${comment.cno }"><i
											class="far fa-trash-alt"></i> 삭제</a></td>
								</tr>


							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<br>

		</div>









	</div>

</section>

<script>
   //회원탈퇴 재확인 
   function checkDelete() {
      if (confirm("정말 탈퇴 하시겠습니까??") == true){    //확인
         location.href="memberDelete.do";
      }else{   //취소
          return;
      }
   }

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
                document.getElementById('btnSave').disabled=false;
             }
          }
        };
        
        xhp.send("name="+nickName);
    })

    function kjh(){
      var form = document.kjh;
      form.submit();
   }
 
    
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
                document.getElementById('btnSave').disabled=false;
             }
          }
        };
        
        xhp.send("email="+email);
    }) */
   
</script>

</body>
</html>