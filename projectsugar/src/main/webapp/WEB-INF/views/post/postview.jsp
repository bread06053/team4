<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/postview.css"/>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
</head>
<body>
<div class="yoyo_top_wrap">
	<div class="yoyo_top">
	<h1>
	<a href="http://localhost:8084/chan/main">
	<img id = "sugarimg" src="/style/${all}" alt="로고">
	</a>
	</h1>
	<div class="yoyo_search">
	<form id="yoyoSearch" method="post" action="/tae/searchpage">
		<div class="input-group">


      <input id="yoyoText" name="q" type="text" class="form-control ui-autocmplete-input" placeholder values="" style="ime-mode:active;" autocomplete="off">   
      <span class="input-group-btn">
      <button class="btn btn-default" type="submit" style="padding-bottom: 8px;">
         <span class="glyphicon glyphicon-search">
         ::검색
         </span>
      </button>   
      </span>
      </div>
   </form>   
</div> 
<div id = goodtaehun></div>
<div class="yoyoRight" style="position:relative">
   <div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none; margin:10;">
         <span style="margin: 10; padding: 10; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="http://localhost:8084/chan/mypage">
    <sec:authentication property = "principal.user.userid"></sec:authentication>님 안녕하세요!<br>
    <sec:authorize access = "!isAuthenticated()"/>
    <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
    </a>
</div>
</div>
</div>
<div class="yoyo_navi">
            <ul class="yoyoNavi">
                <li><a href="/chan/bestRcp">Best 레시피</a>
                </li>
                <li><a href="/chan/myRcp">나만의 레시피</a>
                </li>
                <li><a href="/post/postlist">커뮤니티</a>
                </li>
            </ul>
        </div>

<div class="Article layout_content">
   <div class="article_warp">
      <div class="ArticleContentBox">
         <div class="article_header">
            <div class="ArticleTitle">
               <div class="title_area">
               <h3 class="title_text"> ${dto.ptitle}</h3>
               </div>
               <div class="WriterInfo">
               <c:if test = "${profile == null}">
               <img src = "/style/goguma1.jpeg">
               </c:if>
               <c:if test = "${profile != null }">
                  <img src="/profile/${dto.profile}" width="36" height="36">
                  </c:if>
                  <div class="profile_area">
                     <div class="profile_info">
                        <div class="nick_box">
                        ${dto.userid}
                        </div>
                     </div>
                     <div class="article_info">
                     <span class="date">${dto.ptime}</span>
                     <span class="count"> 조회수:${dto.pview}</span>
                     </div>
                  </div>      
                  <c:if test = "${dto.userid == id }">
                  <button class='up' onclick = "location.href = '/post/postupdate/${pno}'" style="float: right;"> 글 수정</button>            
              		</c:if>
               </div>
                                 
            </div>
         </div>
         <div class="article_container"><br>
               <div class="aricle_viewer">
               ${dto.ptext}
               <input type="hidden" name = "pno" id = "pno" value="${dto.pno}">
               </div>
               <div class="ReplyBox">
                  <div class="box_left">
                  댓글 ${i}
                  </div>
                  <div class="box_right">
                     <div class="report_article">
                     <a class="layer_button" id = "btn_rep" type = "submit">신고하기</a>
                     </div>
                  </div>
               </div>
               <div class="CommentBox">
				<h3 class="comment_title">댓글</h3>
				<ul class="comment_list">
				<c:forEach var="i" items="${info}">
				<li class="CommentItem">
				<div class="comment_area">
					<img src="/profile/${i.profile}">
					<div class="comment_box">
						<div class="comment_nick_box">
							<div class="comment_nick_info">
							${i.nickname}
							</div>
							<i class="LevelIcon icon_level" style="background-image:url(/levelimg/${i.badge})"></i></div>
							<div class="comment_text_box">
								<p class="comment_text_view">
									${i.ctext } 
								</p>
							</div>
							<div class="comment_info_box">
							<span class="comment_info_date">
								${i.ctime}
							</span><c:if test = "${ i.userid == id }">
            <button onclick = "location.href='/post/postview1/${i.cno}/${i.pno}'">댓글 삭제</button>
            </c:if>
							</div>					
					</div>
				</div>
				</li>
				</c:forEach>
				</ul>
				<div class="CommentWriter">
					<div class="comment_inbox">
					<form method = "post" action = "/post/postview">
					<em class="comment_inbox_name">${id}</em>
					<input type = "hidden" name = "userid" value= "${id }">
					<input type = "hidden" name = "pno" value= "${dto.pno}"> 
					<textarea name="ctext" placeholder="댓글을 남겨보아요" class="comment_inbox_text" style="overflow:hidden; overflow-wrap:break-word;">
					</textarea>
					<button type = "submit">댓글 등록</button>
				</form>
					</div>
				</div>
				</div>
				</div>
		<button type="button" onclick="location.href='/post/postlist'"style=" margin-bottom: 10px; margin-left: 750px;">목록으로</button>
	</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$("#btn_rep").click(function(){
            
            window.open('/post/rpopup/${dto.pno}', 'pop01', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
})

</script>
</body>
</html>