<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- fontawesome 댓글,좋아요 모양 구현-->
	<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
	
	<!-- 타임라인 CSS 목록 -->
	<style>
	.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
	}
	

	
	
	body{
	    margin-top:20px;
	    background:#eee;
	}

	.timeline {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    position: relative
	}

	.timeline:before {
	    content: '';
	    position: absolute;
	    top: 5px;
	    bottom: 5px;
	    width: 5px;
	    background: #2d353c;
	    left: 20%;
	    margin-left: -2.5px
	}

	.timeline>li {
	    position: relative;
	    min-height: 50px;
	    padding: 20px 0
	}

	.timeline .timeline-time {
	    position: absolute;
	    left: 0;
	    width: 18%;
	    text-align: right;
	    top: 30px
	}

	.timeline .timeline-time .date,
	.timeline .timeline-time .time {
	    display: block;
	    font-weight: 600
	}

	.timeline .timeline-time .date {
	    line-height: 16px;
	    font-size: 12px
	}

	.timeline .timeline-time .time {
	    line-height: 24px;
	    font-size: 20px;
	    color: #242a30
	}

	.timeline .timeline-icon {
	    left: 15%;
	    position: absolute;
	    width: 10%;
	    text-align: center;
	    top: 40px
	}

	.timeline .timeline-icon a {
	    text-decoration: none;
	    width: 20px;
	    height: 20px;
	    display: inline-block;
	    border-radius: 20px;
	    background: #d9e0e7;
	    line-height: 10px;
	    color: #fff;
	    font-size: 14px;
	    border: 5px solid #2d353c;
	    transition: border-color .2s linear
	}

	.timeline .timeline-body {
	    margin-left: 23%;
	    margin-right: 17%;
	    background: #fff;
	    position: relative;
	    padding: 20px 25px;
	    border-radius: 6px
	}

	.timeline .timeline-body:before {
	    content: '';
	    display: block;
	    position: absolute;
	    border: 10px solid transparent;
	    border-right-color: #fff;
	    left: -20px;
	    top: 20px
	}

	.timeline .timeline-body>div+div {
	    margin-top: 15px
	}

	.timeline .timeline-body>div+div:last-child {
	    margin-bottom: -20px;
	    padding-bottom: 20px;
	    border-radius: 0 0 6px 6px
	}

	.timeline-header {
	    padding-bottom: 10px;
	    border-bottom: 1px solid #e2e7eb;
	    line-height: 30px
	}

	.timeline-header .userimage {
	    float: left;
	    width: 34px;
	    height: 34px;
	    border-radius: 40px;
	    overflow: hidden;
	    margin: -2px 10px -2px 0
	}

	.timeline-header .username {
	    font-size: 16px;
	    font-weight: 600
	}

	.timeline-header .username,
	.timeline-header .username a {
	    color: #2d353c
	}

	.timeline img {
	    max-width: 100%;
	    display: block
	}

	.timeline-content {
	    letter-spacing: .25px;
	    line-height: 18px;
	    font-size: 13px
	}

	.timeline-content:after,
	.timeline-content:before {
	    content: '';
	    display: table;
	    clear: both
	}

	.timeline-title {
	    margin-top: 0
	}

	.timeline-footer {
	    background: #fff;
	    border-top: 1px solid #e2e7ec;
	    padding-top: 15px
	}

	.timeline-footer a:not(.btn) {
	    color: #575d63
	}

	.timeline-footer a:not(.btn):focus,
	.timeline-footer a:not(.btn):hover {
	    color: #2d353c
	}

	.timeline-likes {
	    color: #6d767f;
	    font-weight: 600;
	    font-size: 12px
	}

	.timeline-likes .stats-right {
	    float: right
	}

	.timeline-likes .stats-total {
	    display: inline-block;
	    line-height: 20px
	}

	.timeline-likes .stats-icon {
	    float: left;
	    margin-right: 5px;
	    font-size: 9px
	}

	.timeline-likes .stats-icon+.stats-icon {
	    margin-left: -2px
	}

	.timeline-likes .stats-text {
	    line-height: 20px
	}

	.timeline-likes .stats-text+.stats-text {
	    margin-left: 15px
	}

	.timeline-comment-box {
	    background: #f2f3f4;
	    margin-left: -25px;
	    margin-right: -25px;
	    padding: 20px 25px;
	    font-size: 14px;
	    font-weight: 300;
	    line-height: 1.4; 
	}

	.timeline-comment-box .user {
	    float: left;
	    width: 34px;
	    height: 34px;
	    overflow: hidden;
	    border-radius: 30px
	}
	
	.timeline-comment-box .username {
		font-size: 16px;
	    font-weight: 600;
	    color: #2d353c;
	
	}
	

	.timeline-comment-box .user img {
	    max-width: 100%;
	    max-height: 100%
	}

	.timeline-comment-box .user+.input {
	    margin-left: 44px
	}

	.lead {
	    margin-bottom: 20px;
	    font-size: 16px;
	    font-weight: 300;
	    line-height: 1.4;
	}

	.text-danger, .text-red {
	    color: #ff5b57!important;
	}
	</style>
</head>
<body>
<br/><br/><br/>






<div class="container">
   <ul class="timeline">
     <li><!-- 리뷰를 작성하는 영역 -->
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
       
         <form id="frm" name="frm" enctype="multipart/form-data" method="post" action="reviewWrite.do">
         <div class="timeline-body">
         	<div class="timeline-header d-flex">
         	
         		<input id="searchText" placeholder="Where have you been?">
         		<a id="searchBtn" href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fas fa-search fa-fw fa-lg m-r-3"></i></a>
         		<select class="form-control ml-1 " id="searchResult" name="searchResult">
         			<option>여행지를 선택해주세요</option>
         		</select>
         	</div>
            <div class="timeline-content">
               <textarea class="form-control" id="message" name ="message" rows="6" placeholder="What are you thinking?"></textarea>
            <div class="timeline-likes">
               <div class="stats-right d-flex">
                  <label>
	                  <input type="file" class="custom-file-input" id="customFile1" name="customFile1">
	                  <i class="far fa-image fa-fw fa-lg m-r-3"></i>
	                  image
                  </label>
                    <label>
	                  <input type="file" class="custom-file-input" id="customFile1" name="customFile1">
	                  <i class="far fa-image fa-fw fa-lg m-r-3"></i>
	                  image
                  </label>
                    <label>
	                  <input type="file" class="custom-file-input" id="customFile1" name="customFile1">
	                  <i class="far fa-image fa-fw fa-lg m-r-3"></i>
	                  image
                  </label>
                  &nbsp;
                  
               </div>
               <button class="btn btn-primary f-s-12 rounded-corner" type="submit">Submit</button>
            </div>
            </div>
         </div>
         </form>
      </li>
      <!-- 리뷰를 작성하는 영역 -->
      
      
<%-- <c:choose>
	<c:when test="${empty boards }">
		<h2>데이터(후기)가 없습니다.</h2>
	</c:when>
	<c:otherwise> --%>
		<c:forEach var="board" items="${boards }">
		
      <li>	
         <!-- begin timeline-time -->
         <div class="timeline-time">
            <span class="date">${board.rdate }</span>
            <span class="time">No. ${board.rno}</span>
         </div>
         
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
         <!-- end timeline-icon -->
         <!-- begin timeline-body -->
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""></span>
               <span class="username"><a href="javascript:;">${board.rnickname }</a> <small></small></span>
               <span class="pull-right text-muted">123 Views</span>
            </div>
            
            <div class="timeline-content">
               <p class="lead">${board.rcontent }</p>
               <p class="m-t-20"><img src="" alt=""></p>
            </div>
            <div class="timeline-likes">
               <div class="stats-right">
				<span class="stats-text">${board.title}</span>
				<span class="stats-text">${board.likes } likes</span>
                <span class="stats-text">Comments</span>
               </div>
            </div>
            <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter" onclick="kjh()"><i class="fa fa-comments fa-fw fa-lg m-r-3" ></i> Comment</a>
            </div>
            
   			<c:forEach var="comment" items="${comments }">
            <c:if test="${board.rno eq comment.crno}">
     		
     		<div class="timeline-comment-box" style="">
            	
            	<div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar6.png"></div>
            	 <div><span class="username">${comment.nickname }</span>
         		 <span class="pull-right text-muted">${comment.cdate }</span>
         		 <p>${comment.ccontent }</p>
            	</div>
         		</div> 
            </c:if>
            	</c:forEach>
            	
            	 <div class="timeline-comment-box">
               <div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar6.png"></div>
               <div class="input">
                  <form action="">
                     <div class="input-group">
                        <input type="text" class="form-control rounded-corner" placeholder="Write a comment...">
                        <span class="input-group-btn p-l-10">
                        <button class="btn btn-primary f-s-12 rounded-corner" type="button">Comment</button>
                        </span>
                     </div>
                  </form>
               </div>
            </div>
            	
            	
            	
            	
            	
            	
            	
            	
            	</div>
          </c:forEach></ul>
         
        
          
          
          
          
          </div>
          
          <script>

//리뷰작성시 이름으로 다녀온 관광지를 검색하는 기능
document.getElementById("searchBtn").addEventListener('click',function(){
	
	// 필요한 변수들을 정희해준다.
	var val = document.getElementById("searchText").value;
	var xhp = new XMLHttpRequest();
	var select = document.getElementById('searchResult');
	
	xhp.open('get','searchTour.do?title='+val,true);
	xhp.onreadystatechange = function(){
		if(xhp.readyState == 4 && xhp.status == 200){
			var result = JSON.parse(xhp.responseText); //제이슨으로 받아온다.
			
			var option = "";
			for(i in result){
				
				//옵션태그를 만든다.
				option += '<option id=' + '"'+ result[i].title+ '" ' +' value=' + '"'+ result[i].content_id +'"'+'>'
							+result[i].title+'</option>'
				
			}
			//옵션태그를 추가하는 영역.
			select.innerHTML=option;
		}
	}
	xhp.send(null);
	
});

</script>        
          
            </body>
</html>
