<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
.prdiv{
 border :1px solid; 
 padding:10px;
}
</style>
<link rel="stylesheet" href="/css/paging.css"/>
<link rel="stylesheet" href="/css/admin.css"/>
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
							  <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
							</div>
						<div class="line"></div>
						<div class="prnbtn">
							<div class="pr">
							<sec:authentication property = "principal.user.pr"></sec:authentication>
							</div>
						</div>
					</div>
					<div class="footer">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
						<button onclick = "location.href ='/admin/admain' ">회원 관리</button>
						<button onclick = "location.href ='/admin/asklist' ">문의 리스트</button>
						<button onclick = "location.href ='/admin/reportlist' ">신고 리스트</button>
						<button onclick = "location.href ='/admin/adtotal'">사이트 통계 보기</button>
					</sec:authorize>		
				
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						배너 스타일 변경
					</div>
					<div class="wrapper_right_setting">
						<a href="/tae/userinfo">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper__body">
            				<div class="header2">
            	    			<div class="header__title">
                    				<span class="title">스타일 변경</span>
                				</div>
                				<div class="line2"></div>
								<form class="realform" method="post" action="/admin/adstyle">
								<input type="hidden" class="form1" name="styleimg" value="">
								<div class="showimg">
								<img src="/style/realsugar1.png"> 
								<button id = "btn1">오리지널 배너</button>
								</div>
								<div class="showimg">
								<img src="/style/realsugar2.jpeg"> 
								<button id = "btn2">새해 배너</button>
								</div>
								<div class="showimg">
								<img src="/style/realsugar3.jpeg"> 
								<button id = "btn3">크리스마스 배너</button>
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

<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(function(){
	$("#btn1").click(function(){
		$(".form1").val("realsugar1.png");
		alret($(".form1").val())
		$(".realform").submit();
	});
	
	$("#btn3").click(function(){
		$(".form1").val("realsugar3.jpeg");
		alret($(".form1").val())
	});
	
	$("#btn2").click(function(){
		$(".form1").val("realsugar2.jpeg");
		alret($(".form1").val())
	});
})
</script>
</body>
</html>