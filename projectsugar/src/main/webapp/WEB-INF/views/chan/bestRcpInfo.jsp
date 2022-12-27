<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/bestRcpInfo.css"/>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
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
<div class="container sub_bg">
	<div id="contents_area" class="col-xs-9">
		<div class="view2_pic">
			<div class="centeredcrop">
				${Recipeinfo.rthumimg}
			</div>
			<div class="user_info2">
				<a class="app_block_link_remove user_info2_pic">
					<img src="/profile/${Recipeinfo.profile}">
				</a>
				<span class="user_info2_name" style="font-size:20px;">${Recipeinfo.nickname}</span>
			</div>
		</div>
		<div class="view2_sumary st3">
			<h3 style="font-size:36px;">${Recipeinfo.rtitle}</h3>
			<div class="view2_summary_in" id="recipeIntro" style="font-size:24px;">${Recipeinfo.rinfo}</div>
			<div class="view2_summary_info">
				<span class="view2_summary_info2">${Recipeinfo.rtime}</span>
				<span class="view2_summary_info3">${Recipeinfo.rlevel}</span>
			</div>
			<div class="blank_bottom"></div>
			<div class="cont_ingre2">
				<div class="best_tit">
					<b>재료</b>
					<span>Ingredients</span>
				</div>
				<div class="ready_ingre3" id="divConfirmedMateriaArea">
					<div class="case1">
						<b class="ready_ingre3_tt">[재료]</b>
						${Recipeinfo.rprep}
					</div>
					
				</div>
			</div>
		<div class="blank_bottom"></div>
			<div class="view_step">
				<div id="oldContArea" class="view_cont_old">
					<div style="font-size:16px;">
					<div class="logic">
					<b>요리 순서</b>
					<span>Recipe</span>
					</div>
						${Recipeinfo.rlogic}
					</div>
				</div>
				<dl class="view_step_tip">
					<dt>
					<img src="https://recipe1.ezmember.co.kr/img/tit_tip.gif">
					</dt>
					<dd>
					${Recipeinfo.rtip}
					</dd>
				</dl>
				<div class="view_notice">
					<p class="view_notice_date">
						<b>등록일: 2022-12-21</b>
					</p>
					<span>저작자의 사전 동의 없이 이미지 및 문구를 무단 도용 및 복제를 금합니다.</span>		
				</div>
			</div>
		</div>
		<div class="blank_bottom"></div>
		<div class="heart">추천수: ${Recipeinfo.rlikes}</div>
	</div>
</div>
<!--
<table border="1" style = "text-align : center;" >
	<tr><td>제목</td><td>${Recipeinfo.rtitle}</td>
	<tr><td>작성자</td><td>${Recipeinfo.nickname}</td> 
	<tr><td>카테고리</td><td>${Recipeinfo.cateno}</td>
	<tr><td colspan = "2"><img src = "/profile/${Recipeinfo.profile}"/></td>
	<tr><td>내용</td><td>${Recipeinfo.rinfo}</td>
	<tr><td>요리 시간</td><td>${Recipeinfo.rtime}</td>
	<tr><td>요리 팁</td><td>${Recipeinfo.rtip}</td>
	<tr><td>재료</td><td>${Recipeinfo.rprep}</td>
	<tr><td>완성 요리사진</td><td>${Recipeinfo.rthumimg}</td>
	<tr><td>요리 방법</td><td>${Recipeinfo.rlogic}</td>
	<tr><td>추천 수</td><td>${Recipeinfo.rlikes}</td>
	<tr><td colspan = "2" align = "right">
	
	<a href="../main">커뮤니티로 이동</a> 
	</td></tr>
</table>
 -->
<<<<<<< HEAD
=======

>>>>>>> refs/heads/master
 <a class="gohome" href="/chan/bestRcp"><img src="/style/밤고구마.jpeg" style="margin-left:150px;"></a>
</body>
</html>