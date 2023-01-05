<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</style>
    <link rel="stylesheet" href="/css/mypage.css"/>
        <link rel="stylesheet" href="/css/admin.css"/>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="background">
	<div class="outerbox">
		<div class="wrapper">
			<div class="wrapper_left">
				<div class="wrapper_left_header">
					<div class="hello">
					   <a href="/chan/main"><span>요</span>리초보를 위한 <span>요</span>리비책</a>
					</div>
				</div>
				<div class="wrapper_left_body">
					<div class="header">
						<div class="profile">
						<c:if test = "${id.profile == null }">
						<img src ="/style/goguma1.jpeg">
						</c:if>
						<c:if test= "${id.profile != null }">
							  <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
							  </c:if>
							</div>
						<div class="line"></div>
						<div class="prnbtn">
							<div class="pr">
							<c:if test = "${id.pr == null}">
							자기소개가 없습니다.
							</c:if>
							<c:if test = "${id.pr != null }">
							<sec:authentication property = "principal.user.pr"></sec:authentication>
							</c:if>
							</div>
						</div>
					</div>
					<div class="footer">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
						<button onclick = "location.href ='/admin/admain' ">관리자 페이지</button>
					</sec:authorize>
					<form method="post" action="/tae/kakaoPay" name="frmData">
					<button type="button" id = "kakao">유료 레시피 결제</button>
					</form>		
						<div class="feelWrapper">
							<div class="feel">오늘의 기분</div>
							<select class="feelSelect">
                            	<option>기쁨 😀</option>
                                <option>슬픔 😭</option>
                                <option>분노 😡</option>
                               	<option>행복 😊</option>
                                <option>귀찮 😒</option>
                         	</select>	
						</div>
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						<sec:authentication property = "principal.user.nickname"></sec:authentication>의 마이페이지
					</div>
					<div class="wrapper_right_setting">
					<sec:authorize access="hasAnyRole('ROLE_MEMBER')">
					<button onclick = 'location.href = "/tae/myask1?id=<sec:authentication property = 'principal.user.userid'/>"'>내 문의내역</button>
					</sec:authorize>
						<a href="/tae/userupdate">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper__body">
            				<div class="header2">
            	    			<div class="header__title">
                    				<span class="title">계정 정보</span>
                				</div>
                				<div class="line2"></div>
                				<form method="Post" action="tae/userupdate">               					
                				<div class="myaccount">               					               						
                				<span>이름: </span><sec:authentication property = "principal.user.name"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>아이디: </span><sec:authentication property = "principal.user.userid"></sec:authentication> <br>               						
               						<input type="hidden" value="<sec:authentication property = "principal.user.userid"></sec:authentication>" name="userid">
               						
               					</div>
               					<div class="myaccount">
               						<span>이메일: </span><sec:authentication property = "principal.user.email"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>활동명: </span><sec:authentication property = "principal.user.nickname"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>주소: </span><sec:authentication property = "principal.user.address"></sec:authentication><br>
               					</div>
               					</form>
            				</div>            				
        				</div>
   					 </div>     
                  </div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#kakao").click(function(){
		//window.open("/tae/kakaoPay", '_blank', 'width=800, height=600'); 
		
		
	var pop_title = "popupOpener" ;
		
		window.open("", pop_title,'width=800, height=600') ;
		
		var frmData = document.frmData ;
		frmData.target = pop_title ;
		frmData.action = "/tae/kakaoPay" ;
		
		frmData.submit() ;
		
	})
})
</script>
</body>
</html>