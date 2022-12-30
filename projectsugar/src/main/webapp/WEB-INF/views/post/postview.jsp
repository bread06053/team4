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
                     <span class="count">${dto.pview}</span>
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
            댓글
            <c:forEach var="i" items="${info}">
            
            작성자 :${i.userid }<br>
            댓글 : ${i.ctext }     <!-- 날짜값 태그 주고 화면 오른쪽으로 나오면 이쁠듯 -->   <fmt:formatDate value="${i.ctime}" pattern="MM/dd"/>  <br>
         
            <c:if test = "${ i.userid == id }">
            <button onclick = "location.href='/post/postview1/${i.cno}/${i.pno}'">댓글 삭제</button><hr>
            </c:if>
            </c:forEach>
            
            <form method = "post" action = "/post/postview">
            <input type = "hidden" name = "userid" value= "${id }">
            <input type = "hidden" name = "pno" value= "${dto.pno}"> 
            <input name = "ctext">
            <button type = "submit">댓글 등록</button>
            </form>
            </div>
      <button type="button" onclick="location.href='/post/postlist'">목록으로</button>
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