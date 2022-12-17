
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');

</style>
</head>
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
	<form id="yoyoSearch" method="get" action="">
		<div class="input-group">
		<input id="yoyoText" name="q" type="text" class="form-control ui-autocmplete-input" placeholder values="" style="ime-mode:active;" autocomplete="off">	
		<span class="input-group-btn">
		<button class="btn btn-default" type="button" onclick="$('#yoyoSearch').submit();">
			<span class="glyphicon glyphicon-search">
			::검색
			</span>
		</button>	
		</span>
		</div>
	</form>	
</div> 
<dl class="yoyoRight" style="position:relative">
	<div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none; margin:10;">
         <span style="margin: 10; padding: 10; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKqph2wqtX84lDFu9tH5kMGjUQwoL14qT45w&usqp=CAU" alt="로그인">
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


${q }으로/로 검색 결과를 보여줍니다.<br>
레시피 검색 결과 입니다..
<hr>
<ul>
<c:forEach items="${recipe}" var="dto">
	<c:if test = "${recipe  == null}">
		<div>검색결과가 없습니다..</div>
	</c:if>
	<li><a href="주소?rno=${dto.rno}"> ${dto.rtitle}</a> <br>
	
</c:forEach>
</ul>
<hr> 
${q }으로/로 검색 결과를 보여줍니다.<br>
커뮤니티 검색 결과 입니다..
<ul>
<c:forEach items="${post}" var="dto">
	<li><a href="주소?rno=${dto.pno}"> ${dto.ptitle}</a> <br>

</c:forEach>
</ul>


</body>
</html>