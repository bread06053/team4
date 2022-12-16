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
		<button class="btn btn-default" type="submit">
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
    <a href="http://localhost:8084/tae/login">
    <sec:authentication property = "principal.user.userid"></sec:authentication>님 안녕하세요!<br>
    <sec:authorize access = "!isAuthenticated()"/>
    <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
    </a>
</dl>
</div>
</div>
<div class="yoyo_navi">
            <ul class="yoyoNavi">
                <li><a href="https://www.10000recipe.com/index.html">Best 레시피</a>
                </li>
                <li><a href="https://www.10000recipe.com/recipe/list.html" class="active">나만의 레시피</a>
                </li>
                <li><a href="https://www.10000recipe.com/ranking/home_new.html">커뮤니티</a>
                </li>
            </ul>
        </div>
<div class="main">       
<div class="slideshow-container">
		<c:forEach var="i" items="${bestView}">
		<div class="mySlides fade">
		${i}
		</div>
		</c:forEach>
		<a class="prev" onclick="plusSlides(-1)">❮</a>
		<a class="next" onclick="plusSlides(1)" style="right: 390px;width: 76px;">❯</a>
	</div>

	<br>



	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> 
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
	</div>
<dl class="mainview" id="chefList" style="left:330px;">
<dt>
<h3>이번주 <span>짜파게티 요리사</span></h3>
</dt>
<dd style="margin-top:-10px;">
<div class="chefList chefview" style="height:180px;width:1100px;display:inline-block;margin-left:1px;vertical-align:middle;overflow:hidden;">
	<div aria-live="polite" class="chef-list">
	<div class="chef-track" role="listbox" style="opacity:1; width:5500px;transform:translate3d(70px,10px,100px)">
	<c:forEach var="i" items="${bestChef}">
	<div class="chefimg">
	<img src="/profile/${i.profile}">
	</div>
	</c:forEach>
	</div>
	</div>
</div>
</dd>
</dl>
<div class="recent" style="width: 1240px; margin-bottom: 400px;">
	<h3 style="
    margin-top: 330px;width: 150px;">최근 올라온 레시피</h3>
	<div class="fixed_img_col">
	<c:forEach var="i" items="${recent}">
	<div class="thumimg">
	${i.rthumimg}
<strong>${i.rtitle}</strong>
	</div>
	</c:forEach>
	</div>	
</div>
<div class="container">
<div class="comment"style="margin-left: 1080px;">
<h4>건의 사항</h4>
<textarea id="customerSend" name="board_txt" class="form-control" placeholder="불편한 사항 혹은 제안 사항을 적어주세요!">
</textarea>
<button class="btn btn_default" onclick="ask();">의견 제출</button>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlides(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
</body>
</html>