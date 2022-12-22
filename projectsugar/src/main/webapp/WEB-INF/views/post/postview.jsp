<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<<<<<<< HEAD
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
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYeFHo_i34CbGLC4ZmZyjA3V8XSK_sUHWE7A&usqp=CAU" alt="로고">
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
    <a href="http://localhost:8084/tae/login">
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
                <li><a href="https://www.10000recipe.com/recipe/list.html">나만의 레시피</a>
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
						<img src="/profile/${dto.profile}" width="36" height="36">
						<div class="profile_area">
							<div class="profile_info">
								<div class="nick_box">
								${dto.userid}
								</div>
							</div>
							<div class="article_info">
							<span class="date">${dto.ptime}</span>
							<span class="count">${dto.pview}</span>
							</div>
						</div>						
					</div>
				</div>
			</div>
				<div class="article_container"><br>
					<div class="aricle_viewer">
					${dto.ptext}
					</div>
					<div class="ReplyBox">
						<div class="box_left">
						댓글 ${i}
						</div>
						<div class="box_right">
							<div class="report_article">
							<a href="#" class="button_report">신고</a>
							</div>
						</div>
					</div>
					<div class="CommentBox">
						<div class="comment_option">
						<h3 class="comment_title">댓글</h3>
							<div class="comment_tab">
								<ul class="comment_tab_list">
									<li class="comment_tab_item">등록순</li>						
								</ul>
							</div>
								<ul class="comment_list">
								<li id="${cno}" class="CommentItem">
								<div class="comment_area">
									<img src="/profile/${profile}">
									<div class="comment_box">
										<div class="comment_nick_box">
										${userid}
										</div>
									</div>
									<div class="comment_text_box">
									<p class="comment_text_view">
									<span class="text_comment">${content}</span>
									</div>
									<div class="comment_info_box">
									<span class="comment_info_date">${ctime}</span>
									<a href="#" role="button" class="comment_info_button">답글쓰기</a>
									</div>
									<ul class="layer_list">
										<li class="layer_item">
											<a href="#" role="button" class="layer_button">신고</a>
										</li>
									</ul>			
									</div>
								</li>
								</ul>
								<div class="CommentWriter">
									<em class="comment_inbox_name">
									${user.nickname}
									</em>
									<textarea placeholder="댓글을 남겨보세요" rows="" class="comment_inbox_text" style="overflow:hidden;overflow-wrap: break-word; height: 17px;"></textarea>
								</div>
						</div>
					</div>				
				</div>
			</div>
		<button type="button" onclick="location.href='/post/postlist'">목록으로</button>
	</div>
</div>
<!--  
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${dto.ptitle}</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${dto.userid}                     작성일 : ${dto.ptime}      조회수 : ${dto.pview}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${dto.ptext}
</td>
</tr>

</table>
</form>
      <a href="/community/community_update/${dto.pno}">글 수정 </a> 
      <a id="${dto.pno}" href="#">글 삭제</a>
      <button type="button" onclick="location.href='/community/community_list'">목록으로</button>
-->
=======

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>
   #chooseFile {
       visibility: hidden;
   }
   table {
      width: 800px;
      height: 400px;
      margin-left: 50px;
   }
   img-button {
      width:20;
      height:20;
   
   }
   textarea {
      width:100%;
      height:100%;
      border: 0;
      resize: none;
   }
</style>
</head>
<body>

<div id = "title">
   <a href="/community/community_list" class="community_list">커뮤니티</a>    
</div>
<hr>
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${dto.ptitle}</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${dto.userid}                     작성일 : ${dto.ptime}      조회수 : ${dto.pview}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${dto.ptext}
</td>
</tr>

</table>
</form>
      <a href="/community/community_update/${dto.pno}">글 수정 </a> 
      <a id="${dto.pno}" href="#">글 삭제</a>
      <button type="button" onclick="location.href='/community/community_list'">목록으로</button>
>>>>>>> branch 'master' of https://github.com/bread06053/team4.git
</body>
</html>