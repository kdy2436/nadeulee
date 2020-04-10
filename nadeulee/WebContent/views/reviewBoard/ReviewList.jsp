<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
	
	<!-- fontawesome 댓글,좋아요 모양 구현-->
	<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
	
	<!-- 타임라인 CSS 목록 -->
	<style>
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

<br/><br/><br/>






<div class="container">
   <ul class="timeline">
      <li>
         <!-- begin timeline-time -->
       	 <!-- end timeline-time -->
         <!-- begin timeline-icon -->
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
         <!-- end timeline-icon -->
         <!-- begin timeline-body -->
         <div class="timeline-body">
            <div class="timeline-content">
               <textarea class="form-control" id="message" rows="6" placeholder="What are you thinking?"></textarea>
            <div class="timeline-likes">
               <div class="stats-right">
                  <label><input type="file" class="custom-file-input" id="customFile"><i class="far fa-image fa-fw fa-lg m-r-3"></i>image</label>
                  &nbsp;
                  <button class="btn btn-primary f-s-12 rounded-corner" type="button">Submit</button>
               </div>
            </div>
            </div>
         </div>
         <!-- end timeline-body -->
      </li>
      
      
      
      <li>
         <!-- begin timeline-time -->
         <div class="timeline-time">
            <span class="date">today</span>
            <span class="time">04:20</span>
         </div>
         <!-- end timeline-time -->
         <!-- begin timeline-icon -->
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
         <!-- end timeline-icon -->
         <!-- begin timeline-body -->
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""></span>
               <span class="username"><a href="javascript:;">이기자</a> <small></small></span>
               <span class="pull-right text-muted">123 Views</span>
            </div>
            <div class="timeline-content">
               <p class="lead">첫번째 글내용</p>
               <p class="m-t-20"><img src="" alt=""></p>
            </div>
            <div class="timeline-likes">
               <div class="stats-right">
                  <span class="stats-text">123 Likes</span>
                  <span class="stats-text">123 Comments</span>
               </div>
            </div>
            <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:cDetails();" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a>
            </div>
           <details id="cDetails">
           <summary></summary>
            <div class="timeline-comment-box">
            	<div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar6.png"></div>
            	 <div><span class="username">홍길동</span>
         		 <span class="pull-right text-muted">8:03 PM Today</span>
         		 <p>첫번째 글의 댓글내용</p>
            	</div>
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
        </details>
         </div>
         <!-- end timeline-body -->
      </li>
      
      
	<li>
         <!-- begin timeline-time -->
         <div class="timeline-time">
            <span class="date">today</span>
            <span class="time">03:00</span>
         </div>
         <!-- end timeline-time -->
         <!-- begin timeline-icon -->
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
         <!-- end timeline-icon -->
         <!-- begin timeline-body -->
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt=""></span>
               <span class="username"><a href="javascript:;">김치국</a> <small></small></span>
               <span class="pull-right text-muted">456 Views</span>
            </div>
            <div class="timeline-content">
               <p class="lead">두번째 글내용</p>
               <p class="m-t-20"><img src="" alt=""></p>
            </div>
            <div class="timeline-likes">
               <div class="stats-right">
                  <span class="stats-text">456 Likes</span>
                  <span class="stats-text">456 Comments</span>
               </div>
            </div>
            <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
            </div>
            <div class="timeline-comment-box">
            	<div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar6.png"></div>
            	 <div><span class="username">홍길동</span>
         		 <span class="pull-right text-muted">8:03 PM Today</span>
         		 <p>두번째 글의 댓글내용</p>
            	</div>
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
         </div>
         <!-- end timeline-body -->
     </li>
     
     
     <li>
         <!-- begin timeline-time -->
         <div class="timeline-time">
            <span class="date">lastday</span>
            <span class="time">05:00</span>
         </div>
         <!-- end timeline-time -->
         <!-- begin timeline-icon -->
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
         <!-- end timeline-icon -->
         <!-- begin timeline-body -->
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username"><a href="javascript:;">박승리</a> <small></small></span>
               <span class="pull-right text-muted">789 Views</span>
            </div>
            <div class="timeline-content">
               <p class="lead">세번째 글내용</p>
               <p class="m-t-20"><img src="assets/img/3.jpg" alt=""></p>
            </div>
            <div class="timeline-likes">
               <div class="stats-right">
                  <span class="stats-text">789 Likes</span>
                  <span class="stats-text">789 Comments</span>
               </div>
            </div>
            <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
            </div>
            <div class="timeline-comment-box">
            	<div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar6.png"></div>
            	 <div><span class="username">홍길동</span>
         		 <span class="pull-right text-muted">8:03 PM Today</span>
         		 <p>세번째 글의 댓글내용</p>
            	</div>
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
         </div>
         <!-- end timeline-body -->
     </li>
     

      <li>
         <!-- begin timeline-icon -->
         <div class="timeline-icon">
            <a href="javascript:;">&nbsp;</a>
         </div>
         <!-- end timeline-icon -->
         <!-- begin timeline-body -->
         <div class="timeline-body"></div>
         <!-- begin timeline-body -->
      </li>
   </ul>
</div>


















































	<!-- details 펑션 구현  -->
	<script>
		function cDetails() {
			document.getElementById("cDetails").open = true
		}
	</script>

	