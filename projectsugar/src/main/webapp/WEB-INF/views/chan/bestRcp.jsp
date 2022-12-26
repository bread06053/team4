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
<form method="get" class="cate" action="">
<h4>재료별</h4>
<c:forEach var="i" items="${cateName}">
<input type='checkbox' id='${i.cateno }' name="cate1" value='${i.cateno}'/>
<label for='${i.cateno}'>
</label>${i.catename}
</c:forEach><br><br>
<h4>난이도별</h4>
<c:forEach var="i" items="${rcpLevel}">
<input type='checkbox' id='${i}' name="cate2" value='${i}'/>
<label for='${i}'>
</label>${i}
</c:forEach><br><br>
<h4>시간별</h4>
<c:forEach var="i" items="${rcpTime}">
<input type='checkbox' id='${i.num}' name="cate3" value='${i.num}'/>
<label for='${i.num}'>
</label>${i.rtime}
</c:forEach><br>
<input type='submit' value='검색'>
</form>
</dl>
</div><br>

<div class="bestcontainer">
<h3>추천 레시피</h3>
<button onclick = "location.href = '/tae/Rcpinfowrite'">글 쓰기</button>
<h4>${cnt}개의 검색 결과가 있습니다.</h4>
<c:forEach var="i" items="${best}">
	<div class="thumimg">
	<a href ="/chan/bestRcpInfo/${i.rno}">${i.rthumimg}</a>
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
</body>
</html>