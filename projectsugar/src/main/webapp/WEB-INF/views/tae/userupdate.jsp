<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/userupdate.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
.mySlides {display:none}
.prev, .next, .dot {cursor:pointer}
.dot {height:13px;width:13px;padding:0}
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/main.css"/>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
.mySlides {display:none}
.prev, .next, .dot {cursor:pointer}
.dot {height:13px;width:13px;padding:0}
</style>

<title>정보 수정/삭제</title>
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
                <li><a href="https://www.10000recipe.com/recipe/list.html" class="active">나만의 레시피</a>
                </li>
                <li><a href="/post/postlist">커뮤니티</a>
                </li>
            </ul>
        </div>

<form action="userupdate" method="post" id="updateform" style = "text-align : center; font-size:32pt">
	
		${info.userid}님의 정보를 수정합니다. <br>
		현재 아이디 : ${info.userid} <br>
		<input type="hidden" name="userid" value="${info.userid}">
		비밀번호: <input name="passwd" type="password" id="password" value="${info.passwd}"><br>
		이메일: <input name = "email" value = "${info.email}"><br>
		이름: <input name="name" id="name" value="${info.name}"><br>
		닉네임: <input name = "nickname" value = "${info.nickname}"><br>
		<div class="pr"><span>자기소개:</span> <textarea name="pr"></textarea><br></div>
		주소: <input name="address" id="address" value="${info.address}"> <input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"><br>
		상세주소:<input name = "address" id = "address">
		<br>
		<input type="submit" id="change" value="수정">
	
		
</form>
		<button id = "deleteuser" style="float: right;margin-right: 40%;">회원 탈퇴</button>															
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
            	alert("나머지 주소도 입력하세요.");
        }
    }).open();
}    

$(function(){
	$("#updateform").submit(function(){
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
	});
})//ready
$(function(){
	$("#deleteuser").click(function(){
		let userid ="${info.userid}";
		let passwd = "${info.passwd}";
		
		if (!confirm("정말로 삭제 하시겠습니까?.")) {
    			return false;
			} else {
				$.ajax({url:"/tae/delete",
				 	data:"userid="+userid+"&passwd="+passwd,
				 	method:'post'
				}).done( function(data){
					window.location.href = "/tae/login";
				})
				
	
			}//if
	})//click
})//ready
			
			

	


</script>
</body>
</html>