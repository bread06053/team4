<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/main.css"/>
<link rel="stylesheet" href="/css/bestRcp.css"/>
<link rel="stylesheet" href="/css/paging.css"/>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
.mySlides {display:none}
.prev, .next, .dot {cursor:pointer}
.dot {height:13px;width:13px;padding:0}
</style>
</head>
<body>
<div class="yoyo_top_wra p">
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
<dl class="yoyoRight" style="position:relative">
   <div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none; margin:10;">
         <span style="margin: 10; padding: 10; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="http://localhost:8084/chan/mypage">
    <sec:authentication property = "principal.user.userid"></sec:authentication>님 안녕하세요!<br>
    <sec:authorize access = "!isAuthenticated()"/>
    <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
    </a>
</dl>
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
<div class="catelist">
<dl class="mainview" id="chefList" style="left:18%; right:30%;">
<dt>
<h3>주재료 <span>카테고리</span></h3>
</dt>
<dd style="margin-top:-10px;">
<form method="get" class="cate" action="/chan/myrecipeSearch">
<h4>재료별</h4>
<c:forEach var="i" items="${cateName}">
<input type='radio' id='${i.cateno }' name="cateno" value='${i.cateno}'/>
<label for='${i.cateno}'>
</label>${i.catename}
</c:forEach><br><br>
<h4>난이도별</h4>
<c:forEach var="i" items="${rcpLevel}">
<input type='radio' id='${i}' name="rlevel" value='${i}'/>
<label for='${i}'>
</label>${i}
</c:forEach><br><br>
<h4>시간별</h4>
<c:forEach var="i" items="${rcpTime}">
<input type='radio' id='${i.num}' name="rtime" value='${i.rtime}'/>
<label for='${i.num}'>
</label>${i.rtime}
</c:forEach><br>
<input type='submit' value='검색'>
</form>
</dl>
</div><br>

<div class="bestcontainer">
<button onclick = "location.href = '/tae/Rcpinfowrite'">글 쓰기</button>
<h3>추천 레시피</h3>
<h4>${cnt}개의 검색 결과가 있습니다.</h4>
<div class="rinfo">
<c:forEach var="i" items="${best}">
   <div class="thumimg">
   <a href ="/chan/myRcpinfo/${i.rno}"><img src="/rthumimg/${i.rthumimg}" style="width:430px; height:200px;"></a>
   <div class="title">
<strong style="">${i.rtitle}</strong>
</div>
<div class="chefinfo">
작성자: 
<img src="/profile/${i.profile}">
${i.nickname}
   </div>
   </div>
   </c:forEach>
</div>
</div>
 <div class="page_wrap"style="clear:both;">
  <div class="page_nation">
      <div class="paging" align="center" >
         <c:if test="${begin > pageNum}">
            <a class="point" href="bestRcp?p=${begin-1}">◀</a>
         </c:if>
         <c:forEach begin="${begin}" end = "${end}" var='i'>
            <a class="point" href="bestRcp?p=${i}" class="page">${i}</a>
         </c:forEach>
         <c:if test="${end < totalPages}">
            <a class="point" href="bestRcp?p=${end+1}">▶</a>
         </c:if>
      </div>
      </div>
      </div>
</body>
</html>